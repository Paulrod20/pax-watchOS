import SwiftUI

struct BreathingView: View {
    @StateObject private var session = BreathingSession()

    var body: some View {
        VStack(spacing: 12) {
            BreathingRing(phase: session.phase, progress: session.progress)
                .frame(width: 100, height: 100)

            Text(session.isRunning ? session.phase.title : "Ready")
                .font(.headline)
                .foregroundStyle(Color.paxTextPrimary)

            Button(session.isRunning ? "Stop" : "Begin") {
                session.isRunning ? session.stop() : session.start()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color.paxBackground)
        .onDisappear {
            session.stop()
        }
    }
}

#Preview {
    BreathingView()
}
