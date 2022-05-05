//
//  Activity.swift
//  HundredDaysOfSwiftUI
//
//  Created by WillChen on 2022/5/5.
//

import Foundation

struct Activity: Codable, Identifiable {
    var id = UUID()
    let title: String
    let describtion: String
}

extension Activity {
    static let temp: Activity = Activity(title: "Guitar", describtion:
        """
                See also: Lute § History and evolution of the lute, History of lute-family instruments, Gittern, Citole § Origins, and Classical guitar § History
                Are they guitar ancestors?
                Hittite lute colorized
                Instrument labeled "cythara" in the Stuttgart Psalter, a Carolingian psalter from 9th century Paris.
                Hittite lute
                Turkey. Hittite lute from Alacahöyük 1399–1301 BC. This image is sometimes used to indicate the antiquity of the guitar, because of the shape of its body.[5]
                Musical-instrument historians write that it is an error to consider "oriental lutes" as direct ancestors of the guitar, simply because they have the same body shape, or because they have a perceived etymological relationship (kithara, guitarra). While examples with guitar-like incurved sides such as the instrument in the Airtam Frieze or the Hittite lute from Alacahöyük are known, there are no intermediary instruments or traditions between those instruments and the guitar.[4]
        
                Similarly, musicologists have argued over whether instruments indigenous to Europe could have led to the guitar. This idea has not gotten beyond speculation and needs "a thorough study of morphology and performing practice" by ethnomusicologists.[4]
                The modern word guitar, and its antecedents, has been applied to a wide variety of chordophones since classical times and as such causes confusion. The English word guitar, the German Gitarre, and the French guitare were all adopted from the Spanish guitarra, which comes from the Andalusian Arabic قيثارة (qīthārah)[6] and the Latin cithara, which in turn came from the Ancient Greek κιθάρα. Kithara appears in the Bible four times (1 Cor. 14:7, Rev. 5:8, 14:2 and 15:2), and is usually translated into English as harp.
        
                The origins of the modern guitar are not known.[7] Before the development of the electric guitar and the use of synthetic materials, a guitar was defined as being an instrument having "a long, fretted neck, flat wooden soundboard, ribs, and a flat back, most often with incurved sides."[8] The term is used to refer to a number of chordophones that were developed and used across Europe, beginning in the 12th century and, later, in the Americas.[9] A 3,300-year-old stone carving of a Hittite bard playing a stringed instrument is the oldest iconographic representation of a chordophone and clay plaques from Babylonia show people playing a lute like instrument which is smiliar to the guitar.
        
                A number of scholars cite many influences as antecedents to the modern guitar. Although the development of the earliest "guitars" is lost in the history of medieval Spain, two instruments are commonly cited as their most influential predecessors, the four-string oud and its precursor the European lute, the former was brought to Iberia by the Moors in the 8th century, It has often been assumed that the guitar is a development of the lute, or of the ancient Greek kithara. However many scholars consider the lute an offshoot or separate line of development which did not influence the evolution of the guitar in any significant way.[8][10] [11]
        
                At least two instruments called "guitars" were in use in Spain by 1200: the guitarra latina (Latin guitar) and the so-called guitarra morisca (Moorish guitar). The guitarra morisca had a rounded back, wide fingerboard, and several sound holes. The guitarra Latina had a single sound hole and a narrower neck. By the 14th century the qualifiers "moresca" or "morisca" and "latina" had been dropped, and these two chordophones were simply referred to as guitars.[12]
        
                The Spanish vihuela, called in Italian the "viola da mano", a guitar-like instrument of the 15th and 16th centuries, is widely considered to have been the single most important influence in the development of the baroque guitar. It had six courses (usually), lute-like tuning in fourths and a guitar-like body, although early representations reveal an instrument with a sharply cut waist. It was also larger than the contemporary four-course guitars. By the 16th century, the vihuela's construction had more in common with the modern guitar, with its curved one-piece ribs, than with the viols, and more like a larger version of the contemporary four-course guitars. The vihuela enjoyed only a relatively short period of popularity in Spain and Italy during an era dominated elsewhere in Europe by the lute; the last surviving published music for the instrument appeared in 1576.[13]
        
                Meanwhile, the five-course baroque guitar, which was documented in Spain from the middle of the 16th century, enjoyed popularity, especially in Spain, Italy and France from the late 16th century to the mid-18th century.[A][B] In Portugal, the word viola referred to the guitar, as guitarra meant the "Portuguese guitar", a variety of cittern.
        
                There were many different plucked instruments [14] that were being invented and used in Europe, during the Middle Ages. By the 16th century, most of the forms of guitar had fallen off, to never be seen again. However, midway through the 16th century, the five-course guitar [15] was established. It was not a straightforward process. There were two types of five-course guitars, they differed in the location of the major third and in the interval pattern. The fifth course can be placed on the instrument because it was known to play seventeen notes or more. Because the guitar had a fifth string, it was capable of playing that amount of notes. The guitar's strings were tuned in unison, so, in other words, it was tuned by placing a finger on the second fret of the thinnest string and tuning the guitar [16] bottom to top. The strings were a whole octave apart from one another, which is the reason for the different method of tuning. Because it was so different, there was major controversy as to who created the five course guitar. A literary source, Lope de Vega's Dorotea, gives the credit to the poet and musician Vicente Espinel. This claim was also repeated by Nicolas Doizi de Velasco in 1640, however this claim has been refuted by others who state that Espinel's birth year (1550) make it impossible for him to be responsible for the tradition.[17] He believed that the tuning was the reason the instrument became known as the Spanish guitar in Italy. Even later, in the same century, Gaspar Sanz wrote that other nations such as Italy or France added to the Spanish guitar. All of these nations even imitated the five-course guitar by "recreating" their own.[18]
        
        
                19th century guitar made by luthier Manuel de Soto held by Spanish guitarist Rafael Serrallet
                Finally, circa 1850, the form and structure of the modern guitar are followed by different Spanish makers such as Manuel de Soto y Solares and perhaps the most important of all guitar makers Antonio Torres Jurado, who increased the size of the guitar body, altered its proportions, and invented the breakthrough fan-braced pattern. Bracing, which refers to the internal pattern of wood reinforcements used to secure the guitar's top and back and prevent the instrument from collapsing under tension, is an important factor in how the guitar sounds. Torres' design greatly improved the volume, tone, and projection of the instrument, and it has remained essentially unchanged since.
        """)
}
