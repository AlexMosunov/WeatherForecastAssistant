import SwiftUI

struct VibeCardView: View {
    let snapshot: WeatherSnapshot
    let vibe: Vibe
    let idea: ActivityIdea?

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.extraLarge, style: .continuous)
                .fill(snapshot.palette.card.opacity(0.72))
            Image(heroImageName)
                .resizable()
                .scaledToFill()
                .opacity(0.65)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
            LinearGradient(
                colors: [
                    DesignSystem.Colors.dimmerStartOnDark,
                    DesignSystem.Colors.dimmerEndOnDark
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.m) {
                HStack(alignment: .center, spacing: DesignSystem.Spacing.xs) {
                    Image(systemName: snapshot.condition.symbol)
                        .font(.system(size: 46, weight: .semibold))
                        .foregroundStyle(snapshot.palette.primary)
                        .shadow(color: DesignSystem.Colors.glowOnDark, radius: 10, y: 6)
                    VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                        Text(snapshot.condition.title)
                            .font(.system(.title2, design: .rounded, weight: .bold))
                            .foregroundStyle(snapshot.palette.primary)
                        Text(snapshot.condition.tagline)
                            .font(.system(.callout, design: .rounded, weight: .semibold))
                            .foregroundStyle(DesignSystem.Colors.textSecondaryOnDark)
                    }
                    .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                    VStack(alignment: .trailing, spacing: DesignSystem.Spacing.xs) {
                        Text("\(snapshot.temperature)°")
                            .font(.system(size: 46, weight: .bold, design: .rounded))
                            .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                        Text("Відчувається як \(snapshot.feelsLike)°")
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundStyle(DesignSystem.Colors.textSecondaryOnDark)
                    }
                }

                VStack(alignment: .leading, spacing: DesignSystem.Spacing.s) {
                    Text(vibe.title)
                        .font(.system(.title3, design: .rounded, weight: .bold))
                        .foregroundStyle(snapshot.palette.primary)
                    Text(vibe.message)
                        .font(.system(.body, design: .rounded))
                        .foregroundStyle(DesignSystem.Colors.textSecondaryOnDark)
                    if let idea {
                        Divider().overlay(DesignSystem.Colors.separatorOnDark)
                        ideaBottomView(idea)
                    }
                }
            }
            .padding(DesignSystem.Spacing.m)
        }
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.extraLarge, style: .continuous))
        .overlay(alignment: .topTrailing) {
            AnimatedSparkle(color: snapshot.palette.primary.opacity(0.8))
                .offset(x: 22, y: -18)
        }
        .shadow(color: DesignSystem.Shadow.cardColor, radius: DesignSystem.Shadow.cardRadius, y: DesignSystem.Shadow.cardY)
    }

    private var heroImageName: String {
        switch snapshot.condition {
        case .sun:
            return "hero_sun"
        case .rain:
            return "hero_rain"
        case .cloud:
            return "hero_cloud"
        }
    }

    private func ideaBottomView(_ idea: ActivityIdea) -> some View {
        HStack(alignment: .center, spacing: DesignSystem.Spacing.s) {
            Image(systemName: idea.icon)
                .foregroundStyle(snapshot.palette.primary)
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(idea.title)
                    .font(.system(.callout, design: .rounded, weight: .semibold))
                    .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                Text(idea.detail)
                    .font(.system(.footnote, design: .rounded))
                    .foregroundStyle(DesignSystem.Colors.textSecondaryOnDark)
            }
            Spacer()
            Image(systemName: idea.accentIcon)
                .foregroundStyle(DesignSystem.Colors.accentMutedOnDark)
        }
    }
}

#Preview {
    let snapshot = WeatherSnapshot.mockKyiv
    VibeCardView(
        snapshot: snapshot,
        vibe: snapshot.vibe,
        idea: snapshot.ideas.first ?? ActivityIdea(
            id: UUID(),
            title: "Ідея",
            detail: "Додай свою ідею",
            icon: "sparkles",
            accentIcon: "plus"
        )
    )
//    .padding()
//    .background(
//        AngularGradient(
//            gradient: Gradient(colors: snapshot.palette.background),
//            center: .topLeading,
//            angle: .degrees(135)
//        )
//    )
    .frame(width: 360, height: 320)
    .previewLayout(.sizeThatFits)
}
