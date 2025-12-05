import SwiftUI

struct WeatherHeaderView: View {
    let city: String
    let date: Date
    let onCalendarTap: () -> Void

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(city)
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))
                    .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                Text(date, style: .date)
                    .font(.system(.subheadline, design: .rounded, weight: .medium))
                    .foregroundStyle(DesignSystem.Colors.textSecondaryOnDark)
            }
            Spacer()
            Button(action: onCalendarTap) {
                Image(systemName: "calendar.badge.clock")
                    .font(.title3)
                    .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
                    .padding(DesignSystem.Spacing.m)
                    .background(DesignSystem.Colors.overlayActionOnDark, in: Capsule())
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    WeatherHeaderView(
        city: "Київ",
        date: Date(),
        onCalendarTap: {}
    )
    .padding()
    .background(Color.blue)
    .previewLayout(.sizeThatFits)
}
