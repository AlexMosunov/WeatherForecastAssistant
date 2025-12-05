enum Condition {
    case sun
    case rain
    case cloud

    var title: String {
        switch self {
        case .sun: return "Ясно"
        case .rain: return "Дождливо"
        case .cloud: return "Облачно"
        }
    }

    var tagline: String {
        switch self {
        case .sun: return "Місто кличе на прогулянку"
        case .rain: return "Ритм сповільнюється — бери затишок"
        case .cloud: return "М’яке світло, ідеальне для роботи"
        }
    }

    var symbol: String {
        switch self {
        case .sun: return "sun.max.fill"
        case .rain: return "cloud.rain.fill"
        case .cloud: return "cloud.fill"
        }
    }
}
