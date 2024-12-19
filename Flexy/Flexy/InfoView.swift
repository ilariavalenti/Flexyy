//
//  InfoView.swift
//  Flexy
//
//  Created by Ilaria Valenti on 18/12/24.
//


import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var dismiss
    let exercise: Exercise // Passato da WorkoutDetailView
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Background sfumato
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple.opacity(0.3), Color.orange.opacity(0.4), Color.white]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                HStack {
                    Spacer()
                    Button("Done") {
                        dismiss() // Chiude la modale
                    }
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.blue)
                    .padding()
                    .offset(y: -115)
                }
            }
            .frame(height: 350) // Altezza sfondo
            
            // Contenuto principale
            VStack(alignment: .leading, spacing: 12) {
                // Titolo
                Text(exercise.name)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                // Sottotitolo
                Text("Instructions")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                
                // Lista delle istruzioni
                VStack(alignment: .leading, spacing: 16) {
                    InstructionRow(text: "Start from a kneeling position with your arms at your sides.")
                    InstructionRow(text: "Step forward with one leg, placing your foot flat on the floor in front of you.")
                    InstructionRow(text: "Focus on proper breathing.")
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

// MARK: - Singola riga di istruzione
struct InstructionRow: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Circle()
                .fill(LinearGradient(colors: [Color.pink.opacity(0.8), Color.purple.opacity(0.6)],
                                     startPoint: .top,
                                     endPoint: .bottom))
                .frame(width: 12, height: 12)
                .shadow(color: Color.pink.opacity(0.3), radius: 8, x: 0, y: 0)
            
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .lineSpacing(4)
        }
    }
}
