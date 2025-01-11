//
//  ContentView.swift
//  project
//
//  Created by Lab Lab on 19/12/24.
//

import SwiftUI

struct ContentView: View, ColorPickerDelegate {
    @State private var selectedBackgroundColor: Color = .red
    @State private var selectedTextColor: Color = .black
    @State private var buttonColors: [ColorPickerType: Color] = [
        .background: .gray,
        .text: .gray,
        .button: .gray
    ] // Store individual button colors
    @State private var selectedColorName: String = "Blue"  // Store color name
    @State private var showColorPicker = false
    @State private var colorPickerType: ColorPickerType = .background // To determine which color to update

    var body: some View {
        NavigationStack {
            VStack {
                // Rectangle to display the selected background color
                Rectangle()
                    .fill(selectedBackgroundColor)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding()

                // Buttons with corresponding actions
                Button(action: {
                    colorPickerType = .background
                    showColorPicker = true
                }) {
                    Text("Pick Background Color")
                        .padding()
                        .background(buttonColors[.background] ?? .gray)
                        .foregroundColor(selectedTextColor)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showColorPicker) {
                    ColorPickerView(delegate: self)
                }

                Button(action: {
                    colorPickerType = .text
                    showColorPicker = true
                }) {
                    Text("Pick Text Color")
                        .padding()
                        .background(buttonColors[.text] ?? .gray)
                        .foregroundColor(selectedTextColor)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showColorPicker) {
                    ColorPickerView(delegate: self)
                }

                Button(action: {
                    colorPickerType = .button
                    showColorPicker = true
                }) {
                    Text("Pick Button Color")
                        .padding()
                        .background(buttonColors[.button] ?? .gray)
                        .foregroundColor(selectedTextColor)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showColorPicker) {
                    ColorPickerView(delegate: self)
                }

                // Display the name of the current selected color
                Text("Current chosen color is \(selectedColorName)")
                    .font(.headline)
                    .padding()
            }
            .navigationTitle("Color Picker")
        }
    }

    // MARK: - Delegate Method
    func didPickColor(_ color: Color, colorName: String) {
        switch colorPickerType {
        case .background:
            selectedBackgroundColor = color
        case .text:
            selectedTextColor = color
        case .button:
            buttonColors[colorPickerType] = color
        }
        selectedColorName = colorName
    }
    func didPickColor1(_ color: Color, colorName: String) {
        switch colorPickerType {
        case .background:
            selectedBackgroundColor = selectedBackgroundColor
        case .text:
            selectedTextColor = color
        case .button:
            buttonColors[colorPickerType] = buttonColors[colorPickerType]
        }
        selectedColorName = colorName
    }
}

// Enum to differentiate between types of color selection
enum ColorPickerType: Hashable {
    case background
    case text
    case button
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
