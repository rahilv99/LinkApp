//
//  CirclesView.swift
//  Link
//
//  Created by Atul Verma on 6/29/23.
//

import SwiftUI

struct CirclesView: View {
    
    let group: Group
    
    var body: some View {
        Text(group.name)
    }
}

struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView(group: Group.MOCK_GROUPS[0])
    }
}
