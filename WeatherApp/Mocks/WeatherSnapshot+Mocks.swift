import Foundation

extension WeatherSnapshot {
    static let mockKyiv = WeatherSnapshot(
        city: "Київ",
        today: Date(),
        temperature: 9,
        feelsLike: 7,
        condition: .rain,
        highlights: ["легкий дощ", "вітер 12 км/год", "атмосферні 9°"],
        rhythm: [
            .init(title: "Ранок", detail: "Повільний старт з чашкою фільтру", icon: "cup.and.saucer.fill"),
            .init(title: "День", detail: "Спринти задач під легкий джаз", icon: "headphones"),
            .init(title: "Вечір", detail: "Фільм вдома або зустріч у кав’ярні", icon: "film.fill")
        ],
        hourly: [
            .init(time: "09:00", temperature: 8, icon: "cloud.rain.fill", idea: "візьми плащ"),
            .init(time: "12:00", temperature: 9, icon: "cloud.drizzle.fill", idea: "обід у новому місці"),
            .init(time: "15:00", temperature: 9, icon: "cloud.rain.fill", idea: "co-working + flat white"),
            .init(time: "18:00", temperature: 7, icon: "cloud.fill", idea: "вечірній фільм"),
            .init(time: "21:00", temperature: 6, icon: "cloud.moon.rain.fill", idea: "підсумуй день")
        ],
        ideas: [
            .init(id: UUID(), title: "Кав’ярня + книга", detail: "Сядь біля вікна, дивись на місто і перечитай 1–2 розділи.", icon: "book.fill", accentIcon: "sparkles"),
            .init(id: UUID(), title: "Deep work 90 хв", detail: "Шум дощу допомагає сфокусуватися — зроби блок роботи, потім нагороди себе десертом.", icon: "laptopcomputer", accentIcon: "clock.arrow.circlepath"),
            .init(id: UUID(), title: "Вечірня прогулянка", detail: "Якщо дощ вщухне, короткий прогулянковий подкаст вимкне робочі думки.", icon: "figure.walk", accentIcon: "moon.stars.fill")
        ]
    )
}
