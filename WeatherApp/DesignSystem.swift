import SwiftUI

enum DesignSystem {
    enum Spacing {
        static let xss: CGFloat = 4
        static let xs: CGFloat = 8
        static let s: CGFloat = 12
        static let m: CGFloat = 16
        static let l: CGFloat = 20
        static let xl: CGFloat = 24
        static let xxl: CGFloat = 32
    }

    enum Padding {
        static let screenHorizontal: CGFloat = Spacing.l
        static let screenVertical: CGFloat = Spacing.xxl
    }

    enum CornerRadius {
        static let small: CGFloat = 12
        static let medium: CGFloat = 16
        static let large: CGFloat = 18
        static let extraLarge: CGFloat = 24
    }

    enum Shadow {
        static let cardColor: Color = .black.opacity(0.2)
        static let cardRadius: CGFloat = 20
        static let cardY: CGFloat = 10
    }

    enum Colors {
        static let textPrimaryOnDark: Color = .white
        static let textSecondaryOnDark: Color = .white.opacity(0.8)
        static let textMutedOnDark: Color = .white.opacity(0.7)
        static let accentMutedOnDark: Color = .white.opacity(0.4)
        static let glowOnDark: Color = .white.opacity(0.2)
        static let overlayStrongOnDark: Color = .white.opacity(0.12)
        static let overlayMediumOnDark: Color = .white.opacity(0.08)
        static let overlayLightOnDark: Color = .white.opacity(0.06)
        static let overlayActionOnDark: Color = .white.opacity(0.15)
        static let separatorOnDark: Color = .white.opacity(0.5)
        static let dimmerStartOnDark: Color = Color.black.opacity(0.55)
        static let dimmerEndOnDark: Color = Color.black.opacity(0.25)
        static let heroShadowOnDark: Color = Color.black.opacity(0.25)
    }
}
