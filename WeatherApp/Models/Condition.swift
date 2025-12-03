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
        case .sun: return "Город зовет на прогулку"
        case .rain: return "Ритм замедляется — бери уют"
        case .cloud: return "Мягкий свет, идеален для работы"
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
