//
//  BitcoinPriceViewModel.swift
//  Bitcoin Price
//
//  Created by Juan carlos Faria santiago on 25/4/23.
//
import Combine
import Foundation

class BitcoinViewModel: ObservableObject {
    @Published public private(set) var lastUpdated:String = ""
    @Published public private(set) var priceDetails: [PriceDetails] = Currency.allCases.map {
        PriceDetails(currency: $0)
    }
    
    private var subscription: AnyCancellable?
    
    public func onAppear(){
        // Get data from the Api
        
        subscription = CoindeskAPIService.shared.fechBitcoinPrice()
            .sink(receiveCompletion: {completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("success")
                }
            }, receiveValue: {
                [weak self] value in guard let self = self else { return }
                self.lastUpdated = value.time.update
                self.priceDetails = [
                    PriceDetails(currency: .usd, rate: value.bpi.USD.rate),
                    PriceDetails(currency: .eur, rate: value.bpi.GBP.rate),
                    PriceDetails(currency: .eur, rate: value.bpi.EUR.rate),]
            })
        
    }
}
