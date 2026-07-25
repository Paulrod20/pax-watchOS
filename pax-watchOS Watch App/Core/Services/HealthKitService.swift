import HealthKit

final class HealthKitService {
    private let healthStore = HKHealthStore()

    var isAvailable: Bool {
        HKHealthStore.isHealthDataAvailable()
    }

    func requestAuthorization() async throws {
        guard isAvailable else { return }

        let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession)!
        try await healthStore.requestAuthorization(toShare: [mindfulType], read: [mindfulType])
    }
}
