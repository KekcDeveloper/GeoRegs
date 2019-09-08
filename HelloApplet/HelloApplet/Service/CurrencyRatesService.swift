import Foundation

class CurrencyRatesService {

    struct CurrencyRatesServiceError: Error {
        let description: String
    }

    func loadRates(completion: @escaping (Result<[CurrencyRate], CurrencyRatesServiceError>) -> Void) {
        completion(.failure(CurrencyRatesServiceError(description: "Not implemented")))
    }

}
