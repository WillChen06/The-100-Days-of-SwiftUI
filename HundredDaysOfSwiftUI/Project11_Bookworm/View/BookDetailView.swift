//
//  BookDetailView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/13.
//

import SwiftUI
//import CoreData

struct BookDetailView: View {
    let book: Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        Image(book.genre ?? "Fantasy")
                            .resizable()
                            .scaledToFit()
                        
                        Text(book.genre?.uppercased() ?? "FANTASY")
                            .font(.caption)
                            .fontWeight(.black)
                            .padding(8)
                            .foregroundColor(.white)
                            .background(.black.opacity(0.75))
                            .clipShape(Capsule())
                            .offset(x: -5, y: -5)
                    }
                    
                    Text(book.author ?? "Unknown Author")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Text(book.review ?? "No review")
                        .padding()
                    
                    RatingView(rating: .constant(Int(book.rating)))
                    Spacer()
                    
                    if let date = book.date {
                        Text(dateString(date: date))
                            .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                            .padding([.bottom, .trailing])
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: geometry.size.height)
            }
            .navigationTitle(book.title ?? "Unknown Book")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Delete Book", isPresented: $showingDeleteAlert) {
                Button("Delete", role: .destructive, action: deleteBook)
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure?")
            }
            .toolbar {
                Button {
                    showingDeleteAlert = true
                } label: {
                    Label("Delete this book", systemImage: "trash")
                }
        }
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        
        try? moc.save()
        dismiss()
    }
    
    func dateString(date: Date) -> String {
        date.formatted(date: .numeric, time: .shortened)
    }
}

//struct BookDetailView_Previews: PreviewProvider {
//    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//
//    static var previews: some View {
//        let book = Book(context: moc)
//        book.title = "Test book"
//        book.author = "Test author"
//        book.genre = "Fantasy"
//        book.rating = 4
//        book.review = "This was a great book; I really enjoyed it."
//        return NavigationView {
//            BookDetailView(book: book)
//        }
//    }
//}
