import Foundation
import Combine
import SwiftUI

@MainActor
final class WeatherViewModel: ObservableObject {
    @Published private(set) var snapshot: WeatherSnapshot
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?

    private let weatherService: WeatherServiceProtocol

    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
        self.snapshot = weatherService.placeholderSnapshot
    }

    func refresh() async {
        isLoading = true
        errorMessage = nil
        do {
            snapshot = try await weatherService.fetchCurrentSnapshot()
        } catch {
            errorMessage = "Не вышло обновить погоду. Попробуй еще раз."
        }
        isLoading = false
    }
}
