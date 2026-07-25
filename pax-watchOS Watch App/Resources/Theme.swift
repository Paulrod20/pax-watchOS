import SwiftUI

extension Color {

    // MARK: - Backgrounds

    /// Black (#000000)
    static let paxBackground = Color.black

    /// Charcoal (#111111)
    static let paxSurface = Color(
        red: 0.067,
        green: 0.067,
        blue: 0.067
    )

    // MARK: - Breathing

    /// Sky Blue (#5FA8FF)
    static let paxBreathingRing = Color(
        red: 0.373,
        green: 0.659,
        blue: 1.000
    )

    // MARK: - Text

    /// White (#FFFFFF)
    static let paxTextPrimary = Color.white

    /// White 65% Opacity
    static let paxTextSecondary = Color.white.opacity(0.65)
}
