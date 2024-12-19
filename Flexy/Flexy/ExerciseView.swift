//
//  ExerciseView.swift
//  Flexy
//
//  Created by Ilaria Valenti on 17/12/24.
//

import SwiftUI

struct ExerciseView: View {
    // Variabili di stato per countdown ed esercizio corrente
    @State private var countdown: Int = 3
    @State private var isCountdownActive: Bool = true
    @State private var currentExercise: Int = 1
    @State private var isPaused: Bool = false
    @State private var exerciseTimer: Int = 60 // 1:00 countdown in secondi
    @State private var showCongratsView: Bool = false // Stato per mostrare CongratsView
    
    @State private var timer: Timer? = nil
    
    // Esempio di array di esercizi con immagini e nomi
    let exercises: [exercise] = [
        exercise(name: "Lunge", imageName: "exercise1"),
        exercise(name: "Upward dog", imageName: "exercise2"),
        exercise(name: "Child's Pose", imageName: "exercise3"),
        exercise(name: "Toe Touch", imageName: "exercise4")
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                // Numero dell'esercizio
                Text("\(currentExercise) of \(exercises.count)")
                    .font(.title)
                    .bold()
                
                // Immagine centrale con animazione countdown
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [.pink1, .pink2], startPoint: .bottomLeading, endPoint: .topTrailing))
                        .frame(width: 200, height: 200)
                    
                    if isCountdownActive {
                        Text("\(countdown)")
                            .font(.system(size: 50))
                            .bold()
                            .foregroundColor(.black)
                    } else {
                        Text(exercises[currentExercise - 1].name)
                            .font(.title2)
                            .bold()
                    }
                }
                .animation(.easeInOut, value: countdown)
                
                // Timer per ogni esercizio
                if !isCountdownActive {
                    Text(formatTime(seconds: exerciseTimer))
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
                
                // Controlli
                HStack(spacing: 40) {
                    Button(action: previousExercise) {
                        Image(systemName: "backward.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                    Button(action: togglePause) {
                        Image(systemName: isPaused ? "play.fill" : "pause.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                    Button(action: nextExercise) {
                        Image(systemName: "forward.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onAppear {
                startInitialCountdown()
            }
            .sheet(isPresented: $showCongratsView) {
                CongratsView {
                    // Azione da eseguire quando si salva l'attività
                    print("Workout saved to Activity")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // Funzione di avvio countdown iniziale
    func startInitialCountdown() {
        countdown = 3
        isCountdownActive = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if countdown > 1 {
                countdown -= 1
            } else {
                timer.invalidate()
                isCountdownActive = false
                startExerciseTimer()
            }
        }
    }
    
    // Funzione di gestione timer esercizio
    func startExerciseTimer() {
        // Invalida il timer precedente se esiste
        timer?.invalidate()
        exerciseTimer = 60
        
        // Crea un nuovo timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
            if !isPaused {
                if exerciseTimer > 1 {
                    exerciseTimer -= 1
                } else {
                    t.invalidate() // Invalida il timer quando finisce
                    nextExercise()
                }
            }
        }
    }

    // Passa all'esercizio successivo
    func nextExercise() {
        if currentExercise < exercises.count {
            currentExercise += 1
            startExerciseTimer()
        } else {
            // Mostra CongratsView al termine dell'ultimo esercizio
            timer?.invalidate()
            showCongratsView = true
        }
    }
    
    // Torna all'esercizio precedente
    func previousExercise() {
        if currentExercise > 1 {
            currentExercise -= 1
            startExerciseTimer()
        }
    }
    
    // Toggle pausa/play
    func togglePause() {
        isPaused.toggle()
    }
    
    // Funzione per formattare il timer (da secondi a mm:ss)
    func formatTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

// Struttura dati per un esercizio
struct exercise {
    let name: String
    let imageName: String
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
