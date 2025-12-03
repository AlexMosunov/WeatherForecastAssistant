//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Oleksii Mosunov on 03/12/2025.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            coordinator.rootView()
        }
    }
}
