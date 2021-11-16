//
//  SwiftUiLectionApp.swift
//  SwiftUiLection
//
//  Created by Dominika Poleshyck on 15.11.21.
//

import SwiftUI

@main
struct SwiftUiLectionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(redSliderValue: 1, greenSliderValue: 1, blueSliderValue: 1, shouldShowAlert: true)
        }
    }
}
