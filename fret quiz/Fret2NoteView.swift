//
//  File.swift
//  fret quiz
//
//  Created by Kohki Hatori on 9/19/24.
//

import SwiftUI
struct Fret2NoteView: View {
    let notes = ["C", "C#/Db", "D", "D#/Eb", "E", "F", "F#/Gb", "G", "G#/Ab", "A", "A#/Bb", "B"]
    let open_string_notes = [7, 2, 9, 4, 11]
    @State private var string: Int = 0
    @State private var fret: Int = 0
    @State private var counter: Int = 0
    @State private var displayText: String = "Tap Start to Begin"
    @State private var buttonText: String = "Start Game"

    var body: some View {
        VStack(spacing: 20) {
            Text(displayText)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top, 40)
            
            Button(action: {
                if counter % 2 == 0 {
                    string = Int.random(in: 1...5)
                    fret = Int.random(in: 0...12)
                    displayText = "String: \(string) | Fret: \(fret)"
                    buttonText = "Show Answer"
                } else {
                    displayText = "Note: \(notes[(open_string_notes[string - 1] + fret) % 12])"
                    buttonText = "Next Question"
                }
                counter += 1
            }) {
                Text(buttonText)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 40)
        }
    }
}
