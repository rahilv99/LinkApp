//
//  ImageView.swift
//  Link
//
//  Created by Atul Verma on 7/9/23.
//

import SwiftUI

struct ImageView: View {
    
    var url: String = "https://picsum.photos/100"
    var frame: CGFloat
    
    var body: some View {
        AsyncImage(
            url: URL(
                string: url)) { image in
                    image
                        .resizable()
                        .frame(width: frame,
                               height: frame,
                               alignment: .center)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(secondaryColor, lineWidth: 2)
                        }
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(3 / 2, contentMode: .fill)
                .shadow(color: secondaryColor,radius: 4)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(frame: 150)
    }
}
