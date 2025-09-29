//
//  HabitStore.swift
//  Habitrack
//
//  Created by Purnaman Rai (College) on 26/09/2025.
//

import Foundation

@Observable
class HabitStore {
    private let storageKey = "Habits"

    var habits: [Habit] {
        didSet {
            if let encodedData = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encodedData, forKey: storageKey)
            }
        }
    }
    
    init(fillWithSamples: Bool = false) {
        if let savedData = UserDefaults.standard.data(forKey: storageKey) {
            if let decodedData = try? JSONDecoder().decode([Habit].self, from: savedData) {
                habits = decodedData
                return
            }
        }
        
        if fillWithSamples {
            self.habits = Habit.samples
        } else {
            self.habits = [Habit]()
        }
    }
}
