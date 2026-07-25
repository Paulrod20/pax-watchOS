//
//  PaxApp.swift
//  pax-watchOS Watch App
//
//  Created by Paul Rodriguez on 7/24/26.
//

import SwiftUI

@main
struct PaxApp: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(appState)
        }
    }
}
