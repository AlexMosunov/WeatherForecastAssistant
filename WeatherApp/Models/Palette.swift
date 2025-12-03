import SwiftUI

struct Palette {
    let background: [Color]
    let primary: Color
    let card: Color

    static func `for`(condition: Condition) -> Palette {
        switch condition {
        case .sun:
            return Palette(
                background: [Color(red: 0.98, green: 0.72, blue: 0.42), Color(red: 0.98, green: 0.55, blue: 0.52)],
                primary: Color(red: 1.0, green: 0.93, blue: 0.7),
                card: Color.black.opacity(0.18)
            )
        case .rain:
            return Palette(
                background: [Color(red: 0.18, green: 0.29, blue: 0.49), Color(red: 0.12, green: 0.16, blue: 0.25)],
                primary: Color(red: 0.64, green: 0.82, blue: 1.0),
                card: Color.white.opacity(0.12)
            )
        case .cloud:
            return Palette(
                background: [Color(red: 0.42, green: 0.45, blue: 0.65), Color(red: 0.24, green: 0.27, blue: 0.46)],
                primary: Color(red: 0.85, green: 0.89, blue: 1.0),
                card: Color.white.opacity(0.14)
            )
        }
    }
}
