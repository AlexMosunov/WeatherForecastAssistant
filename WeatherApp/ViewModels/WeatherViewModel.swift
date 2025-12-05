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

    var palette: Palette {
        snapshot.palette
    }

    var vibe: Vibe {
        snapshot.vibe
    }

    var ideas: [ActivityIdea] {
        snapshot.ideas
    }

    var highlightedIdea: ActivityIdea? {
        ideas.first
    }

    func load() async {
        await refresh()
    }

    func refresh() async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        do {
            snapshot = try await weatherService.fetchCurrentSnapshot()
        } catch {
            errorMessage = "Не вийшло оновити погоду. Спробуй ще раз."
        }
    }
}
