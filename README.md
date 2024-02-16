# booking

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

https://60minut.ru/api/v1 - документация

https://60minut.ru/api/v1/hotels?token=3ji2klgboopkatgmhis3e… (https://60minut.ru/api/v1/hotels?token=3ji2klgboopkatgmhis3esv6kezfmwkl) - отели на главной

https://60minut.ru/api/v1/hotel?id=2417&token=3ji2klgboopkat… (https://60minut.ru/api/v1/hotel?id=2417&token=3ji2klgboopkatgmhis3esv6kezfmwkl) - отель, в примере De Art 13 на Профсоюзной

https://60minut.ru/api/v1/filter?token=3ji2klgboopkatgmhis3e… (https://60minut.ru/api/v1/filter?token=3ji2klgboopkatgmhis3esv6kezfmwkl) - фильтры с возможными значениями

3ji2klgboopkatgmhis3esv6kezfmwkl

Обратная связь

Запрос

POST https://60minut.ru/api/v1/feedback
Параметры запроса

    name — Имя
    phone* — Телефон
    text — Текст сообщения
    whatsapp — whatsapp
    viber — viber
    sms — смс




    sort — Сортировка
        price_asc — По возрастанию цены
        price_desc — По убыванию цены
        distance — По удаленности от метро
    q — Ключевое слово
    price_type — Тип цены
        hour — 1 ч
        hour_3 — 3 ч
        night — Ночь
        day — Сутки
    price_f — Цена от
    price_t — Цена до
    district[] — Округ, возможные значения см. в Фильтры
    area[] — Район, возможные значения см. в Фильтры
    metro[] — Станция метро, возможные значения см. в Фильтры
    type — Тип
        1 — Отель
        2 — Апартаменты
    result — Тип
        hotels — Отели
        rooms — Номера
    with_discount — Со скидками, true или false
    is_designer — Дизайнерские, true или false
    rating — Рейтинг не ниже, одно из значений: 5, 6, 7, 8, 9
    r — Удобства номеров, возможные значения см. в Фильтры
    h — Удобства отелей, возможные значения см. в Фильтры
    Служебные:
    id[] — Отели по ID
    city[] — Города подмосковья, возможные значения см. в Фильтры
    entry_point[] — Отели по ID посадочной страницы
