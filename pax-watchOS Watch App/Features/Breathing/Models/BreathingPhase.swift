//
//  BreathingPhase.swift
//  pax-watchos
//
//  Created by Paul Rodriguez on 7/27/26.
//

import Foundation

enum BreathingPhase: String {
    case inhale
    case holdAfterInhale
    case exhale
    case holdAfterExhale
    case completed
    
    var instruction: String {
        switch self {
        case .inhale:
            return "Breathe In"
        case .holdAfterInhale, .holdAfterExhale:
            return "Hold"
        case .exhale:
            return "Breathe Out"
        case .completed:
            return "Well Done!"
        }
    }
    
    var duration: Int {
        switch self {
        case .inhale,
             .exhale,
             .holdAfterInhale,
             .holdAfterExhale:
            return 4
            
        case .completed:
            return 0
        }
    }
    
    var next: BreathingPhase {
        switch self {
        case .inhale:
            return .holdAfterInhale
        case .holdAfterInhale:
            return .exhale
        case .exhale:
            return .holdAfterExhale
        case .holdAfterExhale:
            return .inhale
        case .completed:
            return .completed
        }
    }
}
