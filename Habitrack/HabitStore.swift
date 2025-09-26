//
//  HabitStore.swift
//  Habitrack
//
//  Created by Purnaman Rai (College) on 26/09/2025.
//

import Foundation

@Observable
class HabitStore {
    var habits: [Habit]
    
    init(fillWithSamples: Bool = false) {
        if fillWithSamples {
            self.habits = Habit.samples
        } else {
            self.habits = [Habit]()
        }
    }
}
