//
//  CustomTextFieldView.swift
//  Link
//
//  Created by Jack Steel on 7/13/23.
//

import SwiftUI

struct CustomTextFieldView: View {
    var hint: String
    @Binding var text: String
    
    // MARK: View Properties
    @FocusState var isEnabled: Bool
    var contentType: UITextContentType = .telephoneNumber
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TextField(hint, text: $text)
                .keyboardType(.numberPad)
                .textContentType(contentType)
                .focused($isEnabled)
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.black.opacity(0.2))
                
                Rectangle()
                    .fill(.black)
                    .frame(width: isEnabled ? nil : 0,alignment: .leading)
            }
            .frame(height: 2)
        }
        
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithPhoneView()
    }
}
