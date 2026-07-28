import SwiftUI

struct BreathingRing: View {
    let phase: BreathingPhase
    let progress: Double

    private var scale: CGFloat {
        switch phase {
        case .inhale:
            0.72 + (0.28 * progress)
        case .holdAfterInhale, .holdAfterExhale:
            1
        case .exhale:
            1 - (0.28 * progress)
        case .completed:
            1
        }
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.paxSurface, lineWidth: 10)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.paxBreathingRing,
                    style: StrokeStyle(lineWidth: 10, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
        }
        .scaleEffect(scale)
        .animation(.easeInOut(duration: 0.2), value: scale)
        .accessibilityLabel(phase.instruction)
        .accessibilityValue("\(Int(progress * 100)) percent")
    }
}
