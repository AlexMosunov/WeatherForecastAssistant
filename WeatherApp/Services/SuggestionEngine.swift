import Foundation

protocol SuggestionEngineProtocol {
    func suggest(from snapshot: WeatherSnapshot, mode: DayMode) -> (vibe: Vibe, ideas: [ActivityIdea])
}

struct SuggestionEngine: SuggestionEngineProtocol {
    func suggest(from snapshot: WeatherSnapshot, mode: DayMode) -> (vibe: Vibe, ideas: [ActivityIdea]) {
        let vibe = Vibe.from(condition: snapshot.condition)
        let ideas = buildIdeas(from: snapshot, mode: mode)
        return (vibe, ideas)
    }

    private func buildIdeas(from snapshot: WeatherSnapshot, mode: DayMode) -> [ActivityIdea] {
        if !snapshot.ideas.isEmpty {
            return snapshot.ideas
        }

        // Fallback ideas tuned by weather + time of day
        switch (snapshot.condition, mode) {
        case (.rain, .morning):
            return [
                ActivityIdea(id: UUID(), title: "Ранкова кава + нотатки", detail: "Теплий напій, дощ за вікном і 15 хв на план дня.", icon: "cup.and.saucer.fill", accentIcon: "list.bullet")
            ]
        case (.rain, .evening):
            return [
                ActivityIdea(id: UUID(), title: "Домашній кіносеанс", detail: "Плед, чай і фільм, поки краплі створюють саундтрек.", icon: "film.fill", accentIcon: "moon.stars.fill")
            ]
        case (.sun, .day):
            return [
                ActivityIdea(id: UUID(), title: "Прогулянка з подкастом", detail: "10–20 хв під сонцем, щоб провітрити думки.", icon: "figure.walk", accentIcon: "sun.max.fill")
            ]
        case (.cloud, .day):
            return [
                ActivityIdea(id: UUID(), title: "Фокус-спринт 45 хв", detail: "Рівне світло — ідеально для глибокої роботи без відволікань.", icon: "laptopcomputer", accentIcon: "clock.arrow.circlepath")
            ]
        default:
            return [
                ActivityIdea(id: UUID(), title: "Уютний плейлист + фокус", detail: "Тихе місце, дощовий лоуфай і одне важливе завдання.", icon: "sparkles", accentIcon: "music.note.list")
            ]
        }
    }
}
