import Combine

@MainActor
final class AppState: ObservableObject {
    @Published var completedSessions = 0

    func recordCompletedSession() {
        completedSessions += 1
    }
}
