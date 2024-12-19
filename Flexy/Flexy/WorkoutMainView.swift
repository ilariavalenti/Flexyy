import SwiftUI

struct ContentMainView: View {
    @State private var searchText = "" // Stato per la ricerca

    // Modello dei workout
    let workouts: [Workout] = [
        Workout(title: "Wake Up", description: "A simple routine to maintain your body's natural mobility and range of motion.", exercises: Exercise.sampleData),
        Workout(title: "Stretch and Relax", description: "Focus on flexibility and relaxation.", exercises: Exercise.sampleData),
        Workout(title: "Strength Training", description: "Build muscle and improve endurance.", exercises: Exercise.sampleData)
    ]
    
    var body: some View {
        TabView {
            NavigationView {
                VStack(alignment: .leading) {
                    // Barra di ricerca e icona profilo
                    Text("Workouts")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    HStack {
                        TextField("Search", text: $searchText)
                            .padding(8)
                            .padding(.horizontal, 24)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 8)
                                }
                            )
                        
                        NavigationLink{
                            ProfileView()}
                        label:{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Sezione di card con i vari workout
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(workouts, id: \.title) { workout in
                                // NavigationLink per ogni workout card
                                NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                                    
                                    ZStack{
                                        
                                        
                                        // Card con effetto gradiente
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(LinearGradient(colors: [.pink1, .pink2], startPoint: .bottomLeading, endPoint: .topTrailing))
                                            .frame(width: 200, height: 150)
                                        VStack{
                                            // Durata in alto a sinistra
                                            Text("5'") // Durata fissa (modificabile per ogni workout)
                                                .font(.system(size: 30))
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            
                                            
                                            
                                            
                                            // Titolo del workout al centro
                                            Text(workout.title)
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                                .scaledToFill()
                                            
                                            
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    
                    // Sezione di categorie
                    Text("Browse by area")
                        .font(.largeTitle)
                        .font(.system(size: 10))
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    // Lista delle categorie
                    List {
                        ForEach(["Hips", "Shoulders", "Lower Back", "Neck", "Hamstrings", "Posture", "Quadriceps", "Chest", "Core"], id: \.self) { category in
                            HStack {
                                Text(category)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    Spacer()
                }
                .navigationBarHidden(true)
            }
            .tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            }
            
            // Aggiungi altre sezioni per il Tab Bar
            NavigationView {
                Text("Library Section")
                    .font(.title)
                    .bold()
                    .padding()
            }
            .tabItem {
                VStack {
                    Image(systemName: "bookmark.fill")
                    Text("Library")
                }
            }
            
            NavigationView {
                Text("Activity Section")
                    .font(.title)
                    .bold()
                    .padding()
            }
            .tabItem {
                VStack {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Activity")
                }
            }
            
            // Sezione per altre possibili funzionalità
            NavigationView {
                Text("Custom Section")
                    .font(.title)
                    .bold()
                    .padding()
            }
            .tabItem {
                VStack {
                    Image(systemName: "list.bullet.clipboard.fill")
                    Text("Custom")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// Card per le collezioni
struct WorkoutCard: View {
    var title: String
    var duration: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(duration)
                .font(.title2)
                .bold()
                .foregroundColor(.purple)
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.purple.opacity(0.6))
                .padding(.top, 10)
        }
        .padding()
        .frame(width: 160, height: 120)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
      }
}

// Preview
#Preview{
    ContentMainView()
}
 
