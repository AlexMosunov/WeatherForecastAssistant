import SwiftUI

struct HourlyForecastStripView: View {
    let hourly: [HourBlock]
    let primaryColor: Color

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.s) {
            SectionTitle(text: "Сьогодні по годинах")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DesignSystem.Spacing.s) {
                    ForEach(hourly, id: \.time) { hour in
                        VStack(spacing: DesignSystem.Spacing.xs) {
                            Text(hour.time)
                                .font(.system(.footnote, design: .rounded, weight: .bold))
                                .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                            Image(systemName: hour.icon)
                                .foregroundStyle(primaryColor)
                            Text("\(hour.temperature)°")
                                .font(.system(.headline, design: .rounded, weight: .bold))
                                .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                            Text(hour.idea)
                                .font(.system(.caption2, design: .rounded))
                                .foregroundStyle(DesignSystem.Colors.textMutedOnDark)
                                .multilineTextAlignment(.center)
                        }
                        .padding(DesignSystem.Spacing.m)
                        .frame(width: 120)
                        .background(
                            DesignSystem.Colors.overlayMediumOnDark,
                            in: RoundedRectangle(
                                cornerRadius: DesignSystem.CornerRadius.medium,
                                style: .continuous
                            )
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    HourlyForecastStripView(
        hourly: WeatherSnapshot.mockKyiv.hourly,
        primaryColor: Palette.for(condition: .rain).primary
    )
    .padding()
    .background(Color.black)
    .frame(width: 380, height: 220)
    .previewLayout(.sizeThatFits)
}
