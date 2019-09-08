import Foundation

struct CurrencyRate {

    enum Direction {
        case increase
        case decrease
        case same
    }

    let currencyCode: String
    let buy: Decimal
    let sell: Decimal
    let direction: Direction

}
