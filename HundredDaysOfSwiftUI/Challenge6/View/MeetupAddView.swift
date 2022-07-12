//
//  MeetupAddView.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/7/11.
//

import SwiftUI

struct MeetupAddView: View {
    @ObservedObject var people: People
    
    @State private var name = ""
    @State private var image: Image?
    
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Photo")
                        .font(.headline)
                    ZStack {
                        Rectangle()
                            .fill(.secondary)
                        Text(image != nil ? "" : "Tap to select image.")
                            .foregroundColor(.white)
                        
                        image?
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(height: 300)
                    .onTapGesture {
                        showingImagePicker = true
                    }
                }
                
                
                Divider()
                    .padding([.vertical])
                
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.headline)
                    TextField("Input name", text: $name)
                }
                
                Spacer()
            }
            .padding()
            .onChange(of: inputImage, perform: { _ in
                setImage()
            })
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .navigationTitle("Add person")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem {
                    Button {
                        addNewPerson()
                    } label: {
                        Text("Save")
                    }
                    .disabled(name.isEmpty || image == nil)
                }
            }
        }
    }
    
    func setImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func addNewPerson() {
        guard let data = inputImage?.jpegData(compressionQuality: 0.8) else { return }
        
        let path = ImageHelper().setImage(image: data)
        let person = Person(name: name, imagePath: path ?? "")
        people.data.append(person)
        dismiss()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct MeetupAddView_Previews: PreviewProvider {
    static var previews: some View {
        MeetupAddView(people: People())
    }
}
