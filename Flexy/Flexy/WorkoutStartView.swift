//
//  WorkoutStartView.swift
//  Flexy
//
//  Created by Ilaria Valenti on 17/12/24.
//

import SwiftUICore
import SwiftUI

struct WorkoutStartView: View {
    let exercises: [Exercise]
    
    var body: some View {
        VStack {
            Text("Workout in Progress")
                .font(.largeTitle)
                .bold()
                .padding()
            List {
                ForEach(exercises, id: \.name) { exercise in
                    HStack {
                        Text(exercise.name)
                        Spacer()
                        Text(exercise.duration)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}
