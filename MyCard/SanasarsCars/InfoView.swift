//
//  InfoView.swift
//  SanasarsCars
//
//  Created by Sanasar Janjughazyan on 10/27/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                }
            )
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text:"Hello", imageName:"phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
