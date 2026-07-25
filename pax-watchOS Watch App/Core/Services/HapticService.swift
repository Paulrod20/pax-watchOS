import WatchKit

@MainActor
struct HapticService {
    func playPhaseChange(for phase: BreathingPhase) {
        let haptic: WKHapticType = phase == .exhale ? .directionDown : .directionUp
        WKInterfaceDevice.current().play(haptic)
    }

    func playCompletion() {
        WKInterfaceDevice.current().play(.success)
    }
}
