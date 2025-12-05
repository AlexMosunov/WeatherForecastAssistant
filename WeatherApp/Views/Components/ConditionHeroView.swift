import SwiftUI

struct ConditionHeroView: View {
    let condition: Condition
    let palette: Palette

    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(DesignSystem.Colors.overlayStrongOnDark)
                    .frame(width: 120, height: 120)
                Circle()
                    .stroke(palette.primary.opacity(0.5), lineWidth: 8)
                    .frame(width: 140, height: 140)
                    .blur(radius: 2)
                Image(systemName: condition.symbol)
                    .font(.system(size: 60, weight: .semibold))
                    .foregroundStyle(palette.primary)
                    .shadow(color: DesignSystem.Colors.heroShadowOnDark, radius: 10, y: 8)
            }
            Spacer()
        }
    }
}

#Preview {
    ConditionHeroView(
        condition: .rain,
        palette: Palette.for(condition: .rain)
    )
    .padding()
    .background(
        AngularGradient(
            gradient: Gradient(colors: Palette.for(condition: .rain).background),
            center: .topLeading,
            angle: .degrees(135)
        )
    )
    .frame(width: 360, height: 200)
    .previewLayout(.sizeThatFits)
}
