import Foundation

enum BreathingPhase: String, CaseIterable {
    case inhale
    case hold
    case exhale

    var title: String {
        rawValue.capitalized
    }

    var duration: TimeInterval {
        switch self {
        case .inhale:
            4
        case .hold:
            2
        case .exhale:
            6
        }
    }

    var next: BreathingPhase {
        switch self {
        case .inhale:
            .hold
        case .hold:
            .exhale
        case .exhale:
            .inhale
        }
    }
}
