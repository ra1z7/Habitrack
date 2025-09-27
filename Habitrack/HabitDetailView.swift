//
//  HabitDetailView.swift
//  Habitrack
//
//  Created by Purnaman Rai (College) on 26/09/2025.
//

import SwiftUI

struct HabitDetailView: View {
    var habit: Habit
    
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
        VStack(spacing: 20) {
            ZStack {
                RoundedRectangle(cornerRadius: 60)
                    .fill(randomColor.gradient.opacity(0.5))
                    .ignoresSafeArea()
                    .frame(width: 410, height: 40)
                Text(habit.title)
                    .font(.title.bold())
                    .foregroundStyle(.white)
                    .offset(y: -52)
            }
            
            Text(habit.description)
                .font(.title3)
                .frame(width: .infinity, height: 200, alignment: .top)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black.opacity(0.2), lineWidth: 2)
                }
                .padding()
            
            HStack {
                Text("\(habit.completition)")
                    .frame(width: 120, height: 50)
                    .shadow(radius: 10)
                    .background(.blue.gradient.opacity(0.4))
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 15))
                    .fontWeight(.bold)
                
                Button {
                    habit.incrementCompletionCount()
                } label: {
                    HStack {
                        Text("Completed")
                        Image(systemName: "checkmark")
                    }
                    .frame(width: 220, height: 50)
                    .shadow(radius: 10)
                    .background(.green.gradient)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 15))
                    .fontWeight(.bold)
                }
            }
            
            Spacer()
        }

    }
    
    init(for habit: Habit) {
        self.habit = habit
    }
}

#Preview {
    HabitDetailView(for: Habit.samples.first!)
}
