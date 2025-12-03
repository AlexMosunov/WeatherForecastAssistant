import Foundation

struct WeatherSnapshot {
    let city: String
    let today: Date
    let temperature: Int
    let feelsLike: Int
    let condition: Condition
    let highlights: [String]
    let rhythm: [RhythmBlock]
    let hourly: [HourBlock]
    let ideas: [ActivityIdea]

    var vibe: Vibe {
        Vibe.from(condition: condition)
    }

    var palette: Palette {
        Palette.for(condition: condition)
    }
}
