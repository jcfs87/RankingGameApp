//
//  Bitcoin_PriceApp.swift
//  Bitcoin Price
//
//  Created by Juan carlos Faria santiago on 25/4/23.
//

import SwiftUI

@main
struct Bitcoin_PriceApp: App {

    var body: some Scene {
        WindowGroup {
            BitcoinPriceView(viewModel: BitcoinViewModel())
        }
    }
}
