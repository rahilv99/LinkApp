//
//  HeaderView.swift
//  Link
//
//  Created by Atul Verma on 6/27/23.
//

import SwiftUI

var secondaryColor: Color =
                    Color(.init(
                      red: 100 / 255,
                      green: 174 / 255,
                      blue: 255 / 255,
                      alpha: 1))

var bgColor: Color =
          Color(.init(
                  red: 40 / 255,
                  green: 40 / 255,
                  blue: 55 / 255,
                  alpha: 1))


struct HeaderView: View {
    var text: String
    var color: Color = bgColor
    
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .font(.title)
            .fontWeight(.bold)
            .kerning(1.9)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(text: "Test")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
