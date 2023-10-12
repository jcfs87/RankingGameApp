//
//  CoindeskAPIService.swift
//  Bitcoin Price
//
//  Created by Juan carlos Faria santiago on 25/4/23.
//
import Combine
import Foundation

//http://api.coindesk.com/v1/bpi/currentprice.json


struct CoindeskAPIService {
    public static let shared: CoindeskAPIService = CoindeskAPIService()
    
    public func fechBitcoinPrice() -> AnyPublisher <APIResponse, Error> {
        guard let url = URL(string: "http://api.coindesk.com/v1/bpi/currentprice.json") else {
            let error = URLError(.badURL)
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({data, response in guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.unknown)
            }
                guard httpResponse.statusCode == 200 else {
                    let code = URLError.Code(rawValue: httpResponse.statusCode)
                    throw URLError(code)
                }
                return data
            })
            .decode(type: APIResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}



struct APIResponse: Decodable{
    let time: APITime
    let bpi: APIBitcoinPriceIndex
}

struct APITime: Decodable{
    let update: String

}

struct APIBitcoinPriceIndex: Decodable{
    let USD: APIPriceData
    let GBP: APIPriceData
    let EUR: APIPriceData
    
}
struct APIPriceData: Decodable {
    let rate: String
}
