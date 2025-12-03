struct Vibe {
    let title: String
    let message: String

    static func from(condition: Condition) -> Vibe {
        switch condition {
        case .sun:
            return Vibe(
                title: "Солнечный драйв",
                message: "Идеальный день, чтобы выйти на улицу, поймать вдохновение и запланировать короткий side-project на террасе."
            )
        case .rain:
            return Vibe(
                title: "Тихий дождь — твой саундтрек",
                message: "Пусть капли создают фон. Выбери уютное место, добавь любимый плейлист и закрой пару дел, пока город прячется от дождя."
            )
        case .cloud:
            return Vibe(
                title: "Небо в облаках — время для идей",
                message: "Облака дают ровный свет: идеально для фокусной работы, фото прогулок и продумывания следующих шагов."
            )
        }
    }
}
