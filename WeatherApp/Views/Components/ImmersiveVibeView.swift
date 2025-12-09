import SwiftUI

/// Full-bleed variant of the vibe card for immersive hero layouts.
struct ImmersiveVibeView: View {
    let snapshot: WeatherSnapshot
    let vibe: Vibe
    let idea: ActivityIdea?

    var body: some View {
        ZStack(alignment: .topLeading) {
            heroImage
                .ignoresSafeArea()

            overlayGradient
                .ignoresSafeArea()

            VStack(spacing: DesignSystem.Spacing.l) {
                header
                Spacer()
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.m) {
                    conditionRow
                    VStack(alignment: .leading, spacing: DesignSystem.Spacing.s) {
                        Text(vibe.title)
                            .font(.system(.title, design: .rounded, weight: .bold))
                            .foregroundStyle(snapshot.palette.primary)
                        Text(vibe.message)
                            .font(.system(.body, design: .rounded))
                            .foregroundStyle(DesignSystem.Colors.textSecondaryOnDark)
                    }
                    if let idea {
                        ideaStrip(idea)
                    }
                }
            }
            .padding(.horizontal, DesignSystem.Spacing.l)
            .padding(.top, DesignSystem.Spacing.l)
            .padding(.bottom, DesignSystem.Spacing.xl)
        }
    }

    private var heroImage: some View {
        Image(heroImageName)
            .resizable()
            .scaledToFill()
    }

    private var overlayGradient: some View {
        LinearGradient(
            colors: [
                DesignSystem.Colors.dimmerStartOnDark,
                DesignSystem.Colors.dimmerEndOnDark.opacity(0.8),
                DesignSystem.Colors.dimmerEndOnDark
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .blendMode(.overlay)
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(snapshot.city)
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))
                    .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                Text(snapshot.today, style: .date)
                    .font(.system(.subheadline, design: .rounded, weight: .medium))
                    .foregroundStyle(DesignSystem.Colors.textSecondaryOnDark)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: DesignSystem.Spacing.xs) {
                Text("\(snapshot.temperature)°")
                    .font(.system(size: 52, weight: .bold, design: .rounded))
                    .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                Text("Відчувається як \(snapshot.feelsLike)°")
                    .font(.system(.callout, design: .rounded))
                    .foregroundStyle(DesignSystem.Colors.textSecondaryOnDark)
            }
        }
    }

    private var conditionRow: some View {
        HStack(spacing: DesignSystem.Spacing.s) {
            Image(systemName: snapshot.condition.symbol)
                .font(.system(size: 34, weight: .semibold))
                .foregroundStyle(snapshot.palette.primary)
                .shadow(color: DesignSystem.Colors.glowOnDark, radius: 8, y: 4)
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(snapshot.condition.title)
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                Text(snapshot.condition.tagline)
                    .font(.system(.callout, design: .rounded, weight: .semibold))
                    .foregroundStyle(DesignSystem.Colors.textSecondaryOnDark)
            }
            Spacer()
        }
    }

    private func ideaStrip(_ idea: ActivityIdea) -> some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.s) {
            Divider().overlay(DesignSystem.Colors.separatorOnDark)
            HStack(alignment: .center, spacing: DesignSystem.Spacing.m) {
                Image(systemName: idea.icon)
                    .font(.title2)
                    .foregroundStyle(snapshot.palette.primary)
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                    Text(idea.title)
                        .font(.system(.headline, design: .rounded, weight: .semibold))
                        .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                    Text(idea.detail)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(DesignSystem.Colors.textSecondaryOnDark)
                }
                Spacer()
                Image(systemName: idea.accentIcon)
                    .foregroundStyle(DesignSystem.Colors.accentMutedOnDark)
            }
        }
        .padding(DesignSystem.Spacing.m)
        .background(
            DesignSystem.Colors.overlayMediumOnDark,
            in: RoundedRectangle(
                cornerRadius: DesignSystem.CornerRadius.large,
                style: .continuous
            )
        )
    }

    private var heroImageName: String {
        switch snapshot.condition {
        case .sun:
            return "hero-sun"
        case .rain:
            return "hero-rain"
        case .cloud:
            return "hero-cloud"
        }
    }
}

#Preview {
    let snapshot = WeatherSnapshot.mockKyiv
    ImmersiveVibeView(
        snapshot: snapshot,
        vibe: snapshot.vibe,
        idea: snapshot.ideas.first
    )
    .previewLayout(.sizeThatFits)
}
