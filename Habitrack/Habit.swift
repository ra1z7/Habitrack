//
//  Habit.swift
//  Habitrack
//
//  Created by Purnaman Rai (College) on 26/09/2025.
//

import Foundation

struct Habit: Hashable {
    let title: String
    let description: String
    
    static let samples: [Habit] = [
        Habit(title: "Morning Run", description: "Go for a 20-minute run to start the day with energy."),
        Habit(title: "Read a Book", description: "Spend at least 15 minutes reading any book before bed."),
        Habit(title: "Drink Water", description: "Drink 8 glasses of water throughout the day."),
        Habit(title: "Meditation", description: "Practice 10 minutes of mindfulness meditation."),
        Habit(title: "Journal Writing", description: "Write down thoughts, goals, or gratitude entries daily.")
    ]
}
