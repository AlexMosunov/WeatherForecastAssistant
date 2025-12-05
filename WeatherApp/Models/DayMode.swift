import Foundation

enum DayMode {
    case morning
    case day
    case evening

    static func from(date: Date) -> DayMode {
        let hour = Calendar.current.component(.hour, from: date)
        switch hour {
        case 6..<12: return .morning
        case 12..<18: return .day
        default: return .evening
        }
    }
}
