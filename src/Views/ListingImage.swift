//
//  ListingImage.swift
//  University Pal
//

import SwiftUI

struct ListingImage: View {
    @State private var title = ""
    @State private var Author = ""
    @State private var ISBN = 0
    @State private var Subject = ""
    
    var body: some View {
        VStack{
            Text("Title")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter book title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Author:")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter author", text: $Author)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("ISBN:")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter ISBN", value: $ISBN, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Subject:")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter subject", text: $Subject)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // make space between input form and button
            Spacer()
                .frame(height: 50)
            
            // button
            HStack{
                //Cancel button
                Button(action: {
                    // TODO: Add action here
                }) {
                    HStack{
                        Image(systemName: "multiply")
                        Text("Cancel")
                            .frame(width: 70, height: 30)
                    }
                }.buttonStyle(GradientButtonStyle())
                Spacer()
                
                //List button
                Button(action: {
                    // TODO: Add action here
                }) {
                    HStack{
                        Image(systemName: "plus.square.fill.on.square.fill")
                        Text("List")
                            .frame(width: 70, height: 30)
                    }
                }.buttonStyle(GradientButtonStyle())
            }

        }.padding(.horizontal, 50)
    }
}

struct GradientButtonStyle: ButtonStyle{
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(configuration.isPressed ? Color.green : Color("MangoYellow"))
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}


struct ListingImage_Previews: PreviewProvider {
    static var previews: some View {
        ListingImage()
    }
}
