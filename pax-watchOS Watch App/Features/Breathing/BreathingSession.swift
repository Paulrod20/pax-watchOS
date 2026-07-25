import Combine
import Foundation

@MainActor
final class BreathingSession: ObservableObject {
    @Published private(set) var phase: BreathingPhase = .inhale
    @Published private(set) var progress = 0.0
    @Published private(set) var isRunning = false

    private let haptics: HapticService
    private var timer: AnyCancellable?
    private var phaseStartedAt = Date()

    init(haptics: HapticService? = nil) {
        self.haptics = haptics ?? HapticService()
    }

    func start() {
        guard !isRunning else { return }

        isRunning = true
        phase = .inhale
        progress = 0
        phaseStartedAt = Date()
        haptics.playPhaseChange(for: phase)

        timer = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] date in
                self?.update(at: date)
            }
    }

    func stop() {
        timer?.cancel()
        timer = nil
        isRunning = false
        progress = 0
    }

    private func update(at date: Date) {
        let elapsed = date.timeIntervalSince(phaseStartedAt)
        progress = min(elapsed / phase.duration, 1)

        guard progress >= 1 else { return }

        phase = phase.next
        progress = 0
        phaseStartedAt = date
        haptics.playPhaseChange(for: phase)
    }
}
