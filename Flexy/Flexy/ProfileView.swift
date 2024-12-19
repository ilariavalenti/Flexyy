//
//  ProfileView.swift
//  Flexy
//
//  Created by Ilaria Valenti on 17/12/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var profileImage: Image? = nil
    
    @State private var isVoiceoverOn: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                
                // Profilo Utente con immagine selezionabile
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    if let image = profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                            .shadow(radius: 3)
                    } else {
                        // Immagine di default
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 150, height: 150)
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 100)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onChange(of: selectedItem) { olditem,newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            profileImage = Image(uiImage: uiImage)
                        }
                    }
                }
                
                // Lista delle opzioni
                Form {
                    Section{
                        NavigationLink(destination: Text("Create Account View")) {
                            Text("Create Account")
                        }
                        NavigationLink(destination: Text("Log In View")) {
                            Text("Log In")
                        }
                        
                        HStack {
                            Text("Apple Health")
                            Spacer()
                            Text("Off")
                                .foregroundColor(.gray)
                        }
                        
                        Toggle(isOn: $isVoiceoverOn) {
                            Text("Voiceover")
                        }
                    }
                }
                .scrollDisabled(true) // Disabilita lo scrolling se desiderato
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("") // Rimuove il titolo principale
           
            }
        }
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
