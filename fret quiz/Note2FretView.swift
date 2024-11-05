//
//  Note2FretView.swift
//  fret quiz
//
//  Created by Kohki Hatori on 9/19/24.
//

import SwiftUI

struct Note2FretView: View {
    let notes: [String] = ["C", "C#/Db", "D", "D#/Eb", "E", "F", "F#/Gb", "G", "G#/Ab", "A", "A#/Bb", "B"]
    let open_string_notes: [Int] = [7, 2, 9, 4, 11]
    @State private var note: String = ""
    @State private var string: Int = 0
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
                    note = notes[Int.random(in: 0..<notes.count)]
                    string = Int.random(in: 1...5)
                    displayText = "String: \(string) | Note: \(note)"
                    buttonText = "Show Answer"
                } else {
                    let openStringIndex = open_string_notes[string - 1]
                    var noteIndex = notes.firstIndex(of: note) ?? 0
                    if noteIndex < openStringIndex {
                        noteIndex += 12
                    }
                    displayText = "Fret Position: \(abs(noteIndex - openStringIndex))"
                    buttonText = "Next Question"
                }
                counter += 1
            }) {
                Text(buttonText)
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 40)
        }
    }
}
