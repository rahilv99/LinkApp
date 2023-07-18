//
//  TextFieldView.swift
//  Link
//
//  Created by Atul Verma on 7/7/23.
//

import SwiftUI

struct TextFieldView: View {
    var text: String
    var binding: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(bgColor)
            TextField(text,text: binding)
                .font(.system(size:20,weight:.bold))
                .foregroundColor(bgColor)
                .padding(.top, 5)
                .disableAutocorrection(true)
            
            Divider()
        })
        .padding(.top,25)
        
    }
}
/*
struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: "preview", binding: "preview")
    }
}
*/
