//
//  Habit.swift
//  Habitrack
//
//  Created by Purnaman Rai (College) on 26/09/2025.
//

import Foundation

@Observable
class Habit: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    var completition = 0
    
    func incrementCompletionCount() {
        completition += 1
    }
    
    static let samples: [Habit] = [
        Habit(title: "Morning Run", description: "Go for a 20-minute run to start the day with energy."),
        Habit(title: "Read a Book", description: "Spend at least 15 minutes reading any book before bed."),
        Habit(title: "Drink Water", description: "Drink 8 glasses of water throughout the day."),
        Habit(title: "Meditation", description: "Practice 10 minutes of mindfulness meditation."),
        Habit(title: "Journal Writing", description: "Write down thoughts, goals, or gratitude entries daily.")
    ]
    
    init(title: String, description: String, completition: Int = 0) {
        self.title = title
        self.description = description
        self.completition = completition
    }
    
    // When you make a class conform to Hashable, you must implement both:
    static func == (lhs: Habit, rhs: Habit) -> Bool { // is required by the 'Equatable' protocol, and 'Hashable' inherits from 'Equatable', so any 'Hashable' type must also implement ==.
        lhs.id == rhs.id
    } /*  Why we need it?
           - Classes are reference types, meaning two objects can have the same content (title, description) but be different instances in memory.
           - Swift doesn’t know which property should define equality — you have to tell it.
           - In our case, we choose id, because each Habit has a unique identifier.
       */
    
    func hash(into hasher: inout Hasher) { // is required by the Hashable protocol.
        /*
         hash(    : function name
         (into    : external parameter name
         hasher   : internal parameter name
         inout    : means the function can modify the variable you pass in.
                    Swift normally passes arguments by value.
                    inout allows changes inside the function to affect the original variable outside the function.
         Hasher   : a Swift struct that accumulates hash information.
                    You combine properties into it using hasher.combine(...).
         */
        
        hasher.combine(id) // tells Swift: “Use id as the unique value for hashing this object.”
    } /* Why we need it?
           - The hash is like a shortcut for equality checks.
           - Swift uses hashes to quickly locate items without comparing every property.
           - Rule: If a == b returns true, then a.hashValue must equal b.hashValue.
       */
    
    /*
     Manually Hashing:
     
         var hasher = Hasher()       // create a new hasher
         habit1.hash(into: &hasher)  // pass it into hash(into:)
         let hashValue = hasher.finalize()  // get the integer hash
     
     Here,
         &hasher → The '&' indicates "pass by reference".
             L Required because the function expects an inout parameter.
             L This allows habit1.hash(into:) to modify the same Hasher instance.
     
         hasher.finalize() → Returns a single integer that represents the hash value.
     */
}
