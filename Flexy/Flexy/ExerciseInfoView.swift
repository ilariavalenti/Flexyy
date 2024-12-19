//
//  ExerciseInfoView.swift
//  Flexy
//
//  Created by Ilaria Valenti on 17/12/24.
//

import SwiftUICore
import SwiftUI

struct ExerciseInfoView: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(spacing: 20) {
            Text(exercise.name)
                .font(.largeTitle)
                .bold()
            Image(systemName: "figure.walk") // Placeholder immagine
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
            Text(exercise.details)
                .font(.body)
                .padding()
            Spacer()
        }
        .navigationTitle("Exercise Info")
        .padding()
    }
}
