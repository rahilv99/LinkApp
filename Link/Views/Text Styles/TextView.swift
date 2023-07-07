//
//  TextView.swift
//  Link
//
//  Created by Atul Verma on 6/29/23.
//

import SwiftUI

struct TextView: View {
    var text: String
    var color: Color = secondaryColor
    
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .font(.body)
            .fontWeight(.semibold)
            .padding(10)
    }
}


struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "Hello")
    }
}
