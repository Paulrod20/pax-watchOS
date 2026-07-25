//
//  HomeView.swift
//  pax-watchOS Watch App
//
//  Created by Paul Rodriguez on 7/24/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var appState: AppState

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Image(systemName: "wind")
                    .font(.title)
                    .foregroundStyle(Color.paxBreathingRing)

                Text("Pax")
                    .font(.headline)

                NavigationLink("Start Breathing") {
                    BreathingView()
                }

                if appState.completedSessions > 0 {
                    Text("\(appState.completedSessions) sessions")
                        .font(.caption)
                        .foregroundStyle(Color.paxTextSecondary)
                }
            }
            .padding()
            .background(Color.paxBackground)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AppState())
}
