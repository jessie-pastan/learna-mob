//
//  RectangleCard.swift
//  Learna
//
//  Created by Jessie P on 5/4/23.
//

import SwiftUI

struct RectangleCard: View {
    
    var color = Color.white
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(20)
            .frame(height: 50)
            .shadow(radius: 3)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
