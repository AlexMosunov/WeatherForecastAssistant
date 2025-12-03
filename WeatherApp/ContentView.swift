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
            AngularGradient(gradient: Gradient(colors: snapshot.palette.background),
                            center: .topLeading,
                            angle: .degrees(135))
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    vibeCard
                    moodHighlights
                    hourStrip
                    ideaDeck
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 32)
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
            await viewModel.refresh()
        }
    }

    private var snapshot: WeatherSnapshot {
        viewModel.snapshot
    }

    private var header: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 6) {
                Text(snapshot.city)
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))
                    .foregroundStyle(.white)
                Text(snapshot.today, style: .date)
                    .font(.system(.subheadline, design: .rounded, weight: .medium))
                    .foregroundStyle(.white.opacity(0.8))
            }
            Spacer()
            Button {
                // Placeholder for future "sync with calendar" action
            } label: {
                Image(systemName: "calendar.badge.clock")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding(12)
                    .background(.white.opacity(0.15), in: Capsule())
            }
            .buttonStyle(.plain)
        }
    }

    private var vibeCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: snapshot.condition.symbol)
                    .font(.system(size: 46, weight: .semibold))
                    .foregroundStyle(snapshot.palette.primary)
                    .shadow(color: .white.opacity(0.2), radius: 10, y: 6)
                VStack(alignment: .leading, spacing: 6) {
                    Text(snapshot.condition.title)
                        .font(.system(.title2, design: .rounded, weight: .bold))
                    Text(snapshot.condition.tagline)
                        .font(.system(.callout, design: .rounded, weight: .semibold))
                        .foregroundStyle(.secondary.opacity(0.8))
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(snapshot.temperature)°")
                        .font(.system(size: 46, weight: .bold, design: .rounded))
                    Text("feels \(snapshot.feelsLike)°")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.secondary)
                }
                .foregroundStyle(.white)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(snapshot.vibe.title)
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .foregroundStyle(snapshot.palette.primary)
                Text(snapshot.vibe.message)
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.white.opacity(0.9))
                Divider().overlay(.white.opacity(0.25))
                HStack(spacing: 12) {
                    ForEach(snapshot.highlights, id: \.self) { highlight in
                        Text(highlight)
                            .font(.system(.footnote, design: .rounded, weight: .semibold))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(.white.opacity(0.14), in: Capsule())
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .padding(20)
        .background(snapshot.palette.card.opacity(0.9), in: RoundedRectangle(cornerRadius: 24, style: .continuous))
        .overlay(alignment: .topTrailing) {
            AnimatedSparkle(color: snapshot.palette.primary.opacity(0.8))
                .offset(x: 22, y: -18)
        }
        .shadow(color: .black.opacity(0.2), radius: 20, y: 10)
    }

    private var moodHighlights: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle("Ритм дня")
            HStack(spacing: 12) {
                ForEach(snapshot.rhythm, id: \.title) { block in
                    VStack(alignment: .leading, spacing: 6) {
                        Label(block.title, systemImage: block.icon)
                            .font(.system(.footnote, design: .rounded, weight: .semibold))
                            .labelStyle(.iconOnly)
                            .foregroundStyle(snapshot.palette.primary)
                        Text(block.title)
                            .font(.system(.callout, design: .rounded, weight: .semibold))
                            .foregroundStyle(.white)
                        Text(block.detail)
                            .font(.system(.footnote, design: .rounded))
                            .foregroundStyle(.white.opacity(0.75))
                    }
                    .padding(14)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
            }
        }
    }

    private var hourStrip: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle("Сегодня по часам")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(snapshot.hourly, id: \.time) { hour in
                        VStack(spacing: 8) {
                            Text(hour.time)
                                .font(.system(.footnote, design: .rounded, weight: .bold))
                                .foregroundStyle(.white)
                            Image(systemName: hour.icon)
                                .foregroundStyle(snapshot.palette.primary)
                            Text("\(hour.temperature)°")
                                .font(.system(.headline, design: .rounded, weight: .bold))
                                .foregroundStyle(.white)
                            Text(hour.idea)
                                .font(.system(.caption2, design: .rounded))
                                .foregroundStyle(.white.opacity(0.7))
                                .multilineTextAlignment(.center)
                        }
                        .padding(14)
                        .frame(width: 120)
                        .background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                    }
                }
            }
        }
    }

    private var ideaDeck: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle("Идеи, пока дождь рисует фон")
            ForEach(snapshot.ideas) { idea in
                HStack(alignment: .top, spacing: 12) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(snapshot.palette.primary.opacity(0.2))
                            .frame(width: 48, height: 48)
                        Image(systemName: idea.icon)
                            .font(.title3)
                            .foregroundStyle(snapshot.palette.primary)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(idea.title)
                            .font(.system(.headline, design: .rounded, weight: .semibold))
                            .foregroundStyle(.white)
                        Text(idea.detail)
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    Spacer()
                    Image(systemName: idea.accentIcon)
                        .foregroundStyle(.white.opacity(0.4))
                }
                .padding(14)
                .background(.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
        }
    }

    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.system(.title3, design: .rounded, weight: .bold))
            .foregroundStyle(.white)
    }
}

#Preview {
    ContentView(viewModel: WeatherViewModel(weatherService: MockWeatherService()))
}
