//
//  ContentView.swift
//  SwiftUiLection
//
//  Created by Dominika Poleshyck on 15.11.21.
//

import SwiftUI

struct ContentView: View {
    var red: Double = Double.random(in: 0...1)
    var green: Double = Double.random(in: 0...1)
    var blue: Double = Double.random(in: 0...1)
    
    @State var redSliderValue: Double
    @State var greenSliderValue: Double
    @State var blueSliderValue: Double
    @State var shouldShowAlert: Bool = false
    
    var body: some View {
        VStack { HStack { Color(
            red: red,
            green: green,
            blue: blue)
            Color(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue)
        }
            Button("Check", action: {
                shouldShowAlert = true
            }).foregroundColor(.black).background(.quaternary).cornerRadius(10).font(Font.largeTitle).alert("\((checkDifference()))", isPresented: $shouldShowAlert, actions: {})
            ColorPalletSlider(componentName: "Red", componentColor: .red, sliderValue: $redSliderValue)
            ColorPalletSlider(componentName: "Green", componentColor: .green, sliderValue: $greenSliderValue)
            ColorPalletSlider(componentName: "Blue", componentColor: .blue, sliderValue: $blueSliderValue)
        }
    }
    func checkDifference() -> Double{
        let redDifference = abs(red - redSliderValue)
        let blueDifference = abs(blue - blueSliderValue)
        let greenDifference = abs(green - greenSliderValue)
        let generalDifference = abs(redDifference * blueDifference * greenDifference)
        return 1 - generalDifference
    }
}

struct ColorPalletSlider: View {
    @State var componentName: String
    @State var componentColor: Color
    @Binding var sliderValue: Double
    var body: some View {
        VStack{
            Text(componentName).foregroundColor(componentColor)
            HStack {
                Text("0").padding(.leading, 20)
                Slider(value: $sliderValue)
                Text("255").padding(.trailing, 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            redSliderValue: 1, greenSliderValue: 1, blueSliderValue: 1
        )
    }
}
