//
//  InitialView.swift
//  Nano Challenge 3
//
//  Created by Nafis-Macbook on 16/07/24.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        Spacer()
        GifImageView("search")
            .frame(width: 283)
            .padding(.bottom, -40)
        VStack (spacing: 16){
            Text("Play Ahead for \nthe Weather")
                .fontWeight(.bold)
                .font(.title)
            .multilineTextAlignment(.center)
            Text("Fill in your destination, \ndate, and time.")

                .multilineTextAlignment(.center)
        }
        Spacer()
    }
}

#Preview {
    InitialView()
}
