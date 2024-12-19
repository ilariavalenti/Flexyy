//
//  Welcomesecond.swift
//  Flexy
//
//  Created by Ilaria Valenti on 18/12/24.
//



import SwiftUI

struct Welcomesecond: View {
    @State private var GradientColor: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer() // Push content down
                
                // Welcome Text
                VStack(spacing: 10) {
                    Text("Welcome to")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.black)
                    Text("Flexy")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.pink2)
                }
                .padding(.top, -30)
                
                Spacer() // Push content down
                
                // Health, Activity, and Food sections
                VStack(alignment: .leading, spacing: 30) {
                    HStack {
                        
                        Image(systemName: "figure.cooldown")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(colors:  [.pink1, .pink2], startPoint: .bottomLeading, endPoint: .topTrailing))
                            .hueRotation(.degrees(GradientColor ? 5 : -15))
                            .onAppear{
                                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                                    GradientColor.toggle()
                                }
                            }
                        
                        
                        VStack(alignment: .leading) {
                            Text("Stretching Sessions ")
                                .font(.system(size: 24).bold())
                                .foregroundColor(.black)
                            Text("Tailored to various goals, such as improving flexibility, relieving tension, or enhancing posture.")
                                .font(.system(size: 18))
                                .foregroundColor(.black.opacity(0.8))
                        }
                    }
                    
                    HStack {
                        Image(systemName: "chart.bar.xaxis")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(colors:  [.pink1, .pink2], startPoint: .bottomLeading, endPoint: .topTrailing))
                            .hueRotation(.degrees(GradientColor ? 5 : -15))
                            .onAppear{
                                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                                    GradientColor.toggle()
                                }
                            }
                        VStack(alignment: .leading) {
                            Text("Progress Tracking")
                                .font(.system(size: 24).bold())
                            
                                .foregroundColor(.black)
                            Text("Monitor flexibility improvements over time with milestones, streak tracking, and visual graphs.")
                                .font(.system(size: 18))
                                .foregroundColor(.black.opacity(0.8))
                        }
                    }
                    
                    HStack {
                        Image(systemName: "list.clipboard.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(LinearGradient(colors:  [.pink1, .pink2], startPoint: .bottomLeading, endPoint: .topTrailing))
                            .hueRotation(.degrees(GradientColor ? 5 : -15))
                            .onAppear{
                                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                                    GradientColor.toggle()
                                }
                            }
                        VStack(alignment: .leading) {
                            Text("Personalised Routines")
                                .font(.system(size: 24).bold())
                                .foregroundColor(.black)
                            Text("Design custom stretching routines tailored to unique needs and preferences.")
                                .font(.system(size: 18))
                                .foregroundColor(.black.opacity(0.8))
                            
                        }
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, -80)
              
                
                
                
                Spacer() // Push content down
                
                // Continue button
                
                NavigationLink(){
                    ContentMainView()
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .frame(width: 300, height: 50)
                        .background(Color.pink2.opacity(0.9))
                        .foregroundColor(.black)
                        .cornerRadius(15)
                }
                
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(EllipticalGradient(colors:[Color.pink1.opacity(0.3),Color.pink2.opacity(0.2), Color.white], center:.center, startRadiusFraction: 0.0, endRadiusFraction: 0.5)
               
            )
            
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    Welcomesecond()
}
