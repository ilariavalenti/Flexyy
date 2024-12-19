//
//  WorkoutDetailView.swift
//  Flexy
//
//  Created by Ilaria Valenti on 17/12/24.
//

import SwiftUI

struct WorkoutDetailView: View {
    @State private var isShowingModal = false
    @State private var selectedExercise: Exercise? // Per passare l'esercizio selezionato
    
    let workout: Workout
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // Titolo e descrizione
                HStack {
                    VStack(alignment: .leading) {
                        Text(workout.title)
                            .font(.largeTitle)
                            .bold()
                        Text(workout.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {
                        // Salva o contrassegna nei preferiti
                    }) {
                        Image(systemName: "bookmark")
                            .font(.title)
                            .offset(x: 7, y: -15)
                    }
                }
                .padding()
                
                // Elenco esercizi
                List {
                    ForEach(workout.exercises, id: \.name) { exercise in
                        HStack {
                            Text("\(exercise.index). \(exercise.name)")
                                .font(.body)
                            Spacer()
                            Text(exercise.duration)
                                .font(.body)
                                .foregroundColor(.gray)
                            Button(action: {
                                selectedExercise = exercise // Passa l'esercizio selezionato
                                isShowingModal = true       // Mostra il sheet
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                
                // Pulsante Start
                NavigationLink {
                    ExerciseView()
                } label: {
                    Text("Start")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(colors: [.pink1, .pink2], startPoint: .bottomLeading, endPoint: .topTrailing))
                        .cornerRadius(16)
                }
                .padding()
            }
            .sheet(isPresented: $isShowingModal) {
                if let selectedExercise = selectedExercise {
                    InfoView(exercise: selectedExercise) // Passa l'esercizio selezionato
                }
            }
        }
    }
}

// MARK: - Anteprima
struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView(workout: Workout(title: "Wake Up",
                                           description: "A simple routine to maintain your body's natural mobility and range of motion.",
                                           exercises: Exercise.sampleData))
    }
}
