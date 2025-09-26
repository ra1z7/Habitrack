//
//  CompletionCountView.swift
//  Habitrack
//
//  Created by Purnaman Rai (College) on 26/09/2025.
//

import SwiftUI

struct CompletionCountView: View {
    let completitionCount: Int
    
    var randomColor: Color {
        let allColors: [Color] = [
            .red,
            .orange,
            .yellow,
            .green,
            .mint,
            .teal,
            .cyan,
            .blue,
            .indigo,
            .purple,
            .pink,
            .brown,
            .gray
        ]
        
        return allColors.randomElement()!
    }

    var body: some View {
        ZStack {
            let color = randomColor
            
            RoundedRectangle(cornerRadius: 15)
                .stroke(color.gradient, lineWidth: 2)
                .frame(width: 50)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(color.gradient.opacity(0.2))
                }
            
            Text("\(completitionCount)")
                .foregroundStyle(color.gradient)
                .fontWidth(.condensed)
                .fontWeight(.bold)
                .shadow(radius: 15)
        }
    }
    
    init(for completitionCount: Int) {
        self.completitionCount = completitionCount
    }
}

#Preview {
    CompletionCountView(for: 10)
}
