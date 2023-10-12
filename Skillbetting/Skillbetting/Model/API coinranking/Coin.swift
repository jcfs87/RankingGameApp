//
//  Coin.swift
//  Skillbetting
//
//  Created by alumne on 05/05/2023.
//


import Foundation
// Modelo de datos de APi externa
struct Coin: Decodable, Hashable{
    let name: String
    let price: String
}
