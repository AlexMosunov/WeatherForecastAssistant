import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {
    private let weatherService: WeatherServiceProtocol
    private let weatherViewModel: WeatherViewModel

    init(weatherService: WeatherServiceProtocol = MockWeatherService()) {
        self.weatherService = weatherService
        self.weatherViewModel = WeatherViewModel(weatherService: weatherService)
    }

    @ViewBuilder
    func rootView() -> some View {
        ContentView(viewModel: weatherViewModel)
    }
}
