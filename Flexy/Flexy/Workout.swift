//
//  Workout.swift
//  Flexy
//
//  Created by Ilaria Valenti on 17/12/24.
//


struct Workout {
    let title: String
    let description: String
    let exercises: [Exercise]
}

struct Exercise {
    let index: Int
    let name: String
    let duration: String
    let details: String
    
    static let sampleData: [Exercise] = [
        Exercise(index: 1, name: "Lunge", duration: "1:00", details: "Step forward and bend your knees."),
        Exercise(index: 2, name: "Upward Dog", duration: "1:00", details: "Stretch your back and lift your chest."),
        Exercise(index: 3, name: "Child’s Pose", duration: "1:00", details: "Relax your body in a seated position."),
        Exercise(index: 4, name: "Toe Touch", duration: "1:00", details: "Bend forward to touch your toes.")
    ]
}


