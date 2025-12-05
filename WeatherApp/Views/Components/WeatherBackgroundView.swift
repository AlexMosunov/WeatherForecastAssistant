import SwiftUI

struct WeatherBackgroundView: View {
    let palette: Palette

    var body: some View {
        AngularGradient(
            gradient: Gradient(colors: palette.background),
            center: .topLeading,
            angle: .degrees(135)
        )
        .ignoresSafeArea()
    }
}

struct SectionTitle: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(.title3, design: .rounded, weight: .bold))
            .foregroundStyle(DesignSystem.Colors.textPrimaryOnDark)
    }
}

#Preview {
    WeatherBackgroundView(palette: Palette.for(condition: .rain))
        .frame(width: 360, height: 720)
        .previewLayout(.sizeThatFits)
}
