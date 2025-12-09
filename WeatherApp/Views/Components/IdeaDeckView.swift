import SwiftUI

struct IdeaDeckView: View {
    let title: String
    let ideas: [ActivityIdea]
    let accentColor: Color

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.s) {
            SectionTitle(text: title)
            ForEach(ideas) { idea in
                HStack(alignment: .top, spacing: DesignSystem.Spacing.s) {
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: DesignSystem.CornerRadius.small,
                            style: .continuous
                        )
                        .fill(accentColor.opacity(0.2))
                        .frame(width: 48, height: 48)
                        Image(systemName: idea.icon)
                            .font(.title3)
                            .foregroundStyle(accentColor)
                    }
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
                .padding(DesignSystem.Spacing.m)
                .background(
                    DesignSystem.Colors.overlayLightOnDark,
                    in: RoundedRectangle(
                        cornerRadius: DesignSystem.CornerRadius.medium,
                        style: .continuous
                    )
                )
            }
        }
    }
}

#Preview {
    IdeaDeckView(
        title: "Ідеї, поки дощ малює фон",
        ideas: WeatherSnapshot.mockKyiv.ideas,
        accentColor: Palette.for(condition: .rain).primary
    )
    .padding()
    .background(Color.black.opacity(0.75))
    .frame(width: 360)
    .previewLayout(.sizeThatFits)
}
