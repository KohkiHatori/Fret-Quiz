//
//  ContentView.swift
//  fret quiz
//
//  Created by Kohki Hatori on 9/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack {
            if selectedTab == 0 {
                Note2FretView()
            } else {
                Fret2NoteView()
            }
            
            HStack(spacing: 0) {
                Button(action: {
                    selectedTab = 0
                }) {
                    Text("Note to Fret")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedTab == 0 ? Color.blue : Color.gray.opacity(0.2))
                        .foregroundColor(selectedTab == 0 ? .white : .primary)
                }
                
                Button(action: {
                    selectedTab = 1
                }) {
                    Text("Fret to Note")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(selectedTab == 1 ? Color.green : Color.gray.opacity(0.2))
                        .foregroundColor(selectedTab == 1 ? .white : .primary)
                }
            }
            .frame(height: 50)
            .background(Color.gray.opacity(0.15))
            .cornerRadius(10)
            .padding(.horizontal)
            .shadow(radius: 5)
        }
    }
}

#Preview {
    ContentView()
}

