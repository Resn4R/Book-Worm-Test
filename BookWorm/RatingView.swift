//
//  RatingView.swift
//  BookWorm
//
//  Created by Vito Borghi on 23/10/2023.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColour = Color.gray
    var onColour = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maxRating+1, id: \.self) { number in
                image(for: number)
                    .foregroundStyle(number > rating ? offColour : onColour)
                    .onTapGesture {
                        rating = number
                    }
            }
            Text("\(rating)/5")
                .padding(.horizontal, 40)

        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
