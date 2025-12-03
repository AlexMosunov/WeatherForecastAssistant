import Foundation

extension WeatherSnapshot {
    static let mockKyiv = WeatherSnapshot(
        city: "Київ",
        today: Date(),
        temperature: 9,
        feelsLike: 7,
        condition: .rain,
        highlights: ["легкий дождь", "ветер 12 км/ч", "уютный 9°"],
        rhythm: [
            .init(title: "Утро", detail: "Медленный старт с чашкой фильтра", icon: "cup.and.saucer.fill"),
            .init(title: "День", detail: "Спринты задач и фоном джаз", icon: "headphones"),
            .init(title: "Вечер", detail: "Фильм дома или встреча в кофейне", icon: "film.fill")
        ],
        hourly: [
            .init(time: "09:00", temperature: 8, icon: "cloud.rain.fill", idea: "захвати плащ"),
            .init(time: "12:00", temperature: 9, icon: "cloud.drizzle.fill", idea: "обед в новом месте"),
            .init(time: "15:00", temperature: 9, icon: "cloud.rain.fill", idea: "co-working + flat white"),
            .init(time: "18:00", temperature: 7, icon: "cloud.fill", idea: "вечерний фильм"),
            .init(time: "21:00", temperature: 6, icon: "cloud.moon.rain.fill", idea: "подвести итоги дня")
        ],
        ideas: [
            .init(id: UUID(), title: "Кофейня + книга", detail: "Садись у окна, смотри на улицу и перечитай 1–2 главы.", icon: "book.fill", accentIcon: "sparkles"),
            .init(id: UUID(), title: "Deep work 90 минут", detail: "Шум дождя помогает сосредоточиться — сделай блок работы, потом награди себя десертом.", icon: "laptopcomputer", accentIcon: "clock.arrow.circlepath"),
            .init(id: UUID(), title: "Вечерняя прогулка", detail: "Если дождь утихнет, короткий прогул с подкастом поможет выключиться из работы.", icon: "figure.walk", accentIcon: "moon.stars.fill")
        ]
    )
}
