//
//  CryptoServices.swift
//  Skillbetting
//
//  Created by alumne on 05/05/2023.
//

    import Foundation
    import Combine

    //Esta clase encapsula la logica para obtener los datos de la API externa
    final class CryptoService {
    //    components es una instancia de URLComponents se utiliza para construir la URL
        var components: URLComponents {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.coinranking.com"
            components.path = "/v2/coins"
            components.queryItems = [URLQueryItem(name: "base", value: "USD"), URLQueryItem(name: "timePeriod", value: "1h")]
            return components
        }
    //    fecthCoins realiza solicitud de red y devuelve "AnyPublisher" que emite valores de tipo
    //    CryptoDataContainer o un error
        func fecthCoins() -> AnyPublisher<CryptoDataContainer, Error> {
    //  URLSession.shared.dataTaskPublisher(for:) para realizar una solicitud de red utilizando la URL construida a partir de components.url!.
            return URLSession.shared.dataTaskPublisher(for: components.url!)
                .map { $0.data}
                .decode(type: CryptoDataContainer.self, decoder: JSONDecoder())
    //  .receive(on:) para cambiar al hilo principal (DispatchQueue.main) y asegurarse de que las actualizaciones y los manejadores de finalización se realicen en el hilo principal.
                .receive(on: DispatchQueue.main)
    //   .eraseToAnyPublisher() para eliminar la información específica del tipo del Publisher y devolverlo como un AnyPublisher
                .eraseToAnyPublisher()
        }
        
    }

