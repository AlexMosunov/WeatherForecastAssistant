//
//  ContentView.swift
//  WeatherApp
//
//  Created by Oleksii Mosunov on 03/12/2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        ZStack {
            WeatherBackgroundView(palette: viewModel.palette)
            ScrollView {
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.xl) {
//                    ConditionHeroView(
//                        condition: viewModel.snapshot.condition,
//                        palette: viewModel.palette
//                    )
                    WeatherHeaderView(
                        city: viewModel.snapshot.city,
                        date: viewModel.snapshot.today,
                        onCalendarTap: {}
                    )
                    VibeCardView(
                        snapshot: viewModel.snapshot,
                        vibe: viewModel.vibe,
                        idea: viewModel.highlightedIdea
                    )
                    RhythmHighlightsView(
                        blocks: viewModel.snapshot.rhythm,
                        primaryColor: viewModel.palette.primary
                    )
                    HourlyForecastStripView(
                        hourly: viewModel.snapshot.hourly,
                        primaryColor: viewModel.palette.primary
                    )
                    IdeaDeckView(
                        title: "Ідеї, поки дощ малює фон",
                        ideas: viewModel.ideas,
                        accentColor: viewModel.palette.primary
                    )
                }
                .padding(.horizontal, DesignSystem.Padding.screenHorizontal)
                .padding(.vertical, DesignSystem.Padding.screenVertical)
            }
        }
        .overlay(alignment: .topTrailing) {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .padding()
            }
        }
        .task {
            await viewModel.load()
        }
    }
}

#Preview {
    ContentView(viewModel: WeatherViewModel(
            weatherService: MockWeatherService()
        ))
}
