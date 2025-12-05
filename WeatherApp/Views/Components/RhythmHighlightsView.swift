import SwiftUI

struct RhythmHighlightsView: View {
    let blocks: [RhythmBlock]
    let primaryColor: Color

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.s) {
            SectionTitle(text: "Ритм дня")
            HStack(spacing: DesignSystem.Spacing.s) {
                ForEach(blocks, id: \.title) { block in
                    VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                        Label(block.title, systemImage: block.icon)
                            .font(.system(.footnote, design: .rounded, weight: .semibold))
                            .labelStyle(.iconOnly)
                            .foregroundStyle(primaryColor)
                        Text(block.title)
                            .font(.system(.callout, design: .rounded, weight: .semibold))
                            .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                        Text(block.detail)
                            .font(.system(.footnote, design: .rounded))
                            .foregroundStyle(DesignSystem.Colors.textMutedOnDark)
                    }
                    .padding(DesignSystem.Spacing.m)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        DesignSystem.Colors.overlayMediumOnDark,
                        in: RoundedRectangle(
                            cornerRadius: DesignSystem.CornerRadius.large,
                            style: .continuous
                        )
                    )
                }
            }
        }
    }
}

#Preview {
    RhythmHighlightsView(
        blocks: WeatherSnapshot.mockKyiv.rhythm,
        primaryColor: Palette.for(condition: .rain).primary
    )
    .padding()
    .background(Color.black)
    .frame(width: 360)
    .previewLayout(.sizeThatFits)
}
