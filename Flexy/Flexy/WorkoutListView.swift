//
//  WorkoutListView.swift
//  Flexy
//
//  Created by Ilaria Valenti on 17/12/24.
//


import SwiftUI

struct WorkoutListView: View {
    let workouts = [
        Workout(title: "Wake Up", description: "A simple routine to maintain mobility", exercises: Exercise.sampleData)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(workouts, id: \.title) { workout in
                        Button(action: {
                            // Naviga alla WorkoutDetailView
                        }) {
                            WorkoutCardView(title: workout.title)
                        }
                    }
                }
            }
            .navigationTitle("Workouts")
        }
    }
}

struct WorkoutCardView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            Image(systemName: "circle.fill") // Placeholder immagine
                .resizable()
                .frame(width: 100, height: 100)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
