struct Vibe {
    let title: String
    let message: String

    static func from(condition: Condition) -> Vibe {
        switch condition {
        case .sun:
            return Vibe(
                title: "Сонячний драйв",
                message: "Ідеальний день, щоб вийти назовні, спіймати натхнення і запланувати короткий side-project на терасі."
            )
        case .rain:
            return Vibe(
                title: "Тихий дощ — твій саундтрек",
                message: "Хай краплі створюють фон. Обери затишне місце, додай улюблений плейлист і закрий кілька справ, поки місто ховається від дощу."
            )
        case .cloud:
            return Vibe(
                title: "Хмарне небо — час для ідей",
                message: "Хмари дають рівне світло: ідеально для фокусної роботи, фотопрогулянок і продумування наступних кроків."
            )
        }
    }
}
