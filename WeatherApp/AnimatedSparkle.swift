import SwiftUI

struct AnimatedSparkle: View {
    @State private var rotation: Double = 0
    var color: Color

    var body: some View {
        Image(systemName: "sparkles")
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(color)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(.easeInOut(duration: 8).repeatForever(autoreverses: true)) {
                    rotation = 12
                }
            }
    }
}

#Preview {
    AnimatedSparkle(color: .yellow)
        .padding()
        .background(Color.blue)
}
