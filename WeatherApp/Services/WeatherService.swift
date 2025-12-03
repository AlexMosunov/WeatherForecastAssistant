import Foundation

protocol WeatherServiceProtocol {
    var placeholderSnapshot: WeatherSnapshot { get }
    func fetchCurrentSnapshot() async throws -> WeatherSnapshot
}

final class MockWeatherService: WeatherServiceProtocol {
    var placeholderSnapshot: WeatherSnapshot {
        WeatherSnapshot.mockKyiv
    }

    func fetchCurrentSnapshot() async throws -> WeatherSnapshot {
        // Simulated delay to mirror real network call
        try await Task.sleep(nanoseconds: 200_000_000)
        return WeatherSnapshot.mockKyiv
    }
}
