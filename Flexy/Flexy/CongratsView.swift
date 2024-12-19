//
//  CongratsView.swift
//  Flexy
//
//  Created by Ilaria Valenti on 18/12/24.
//


import SwiftUI

struct CongratsView: View {
    @Environment(\.dismiss) var dismiss
    var onAddActivity: () -> Void

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Congrats!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 8)
                
                Text("You completed your daily routine")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.pink2)
                    .offset(y: 30)
                Spacer()
                
                Button(action: {
                    onAddActivity()
                    dismiss()
                }) {
                    NavigationLink{
                        ContentMainView()
                    }label:{
                        Text("Add to activity")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.pink2)
                            .cornerRadius(12)
                    }
                }
                .padding()
            }
        }
    }
}

// Preview
struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView {
            print("Activity saved")
        }
    }
}
