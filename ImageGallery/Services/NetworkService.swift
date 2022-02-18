//
//  NetworkService.swift
//  ImageGallery
//
//  Created by Олег Федоров on 16.02.2022.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case responseError
    case decodingError
}

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchPhotos(
        completion: @escaping (Result<[PhotoModelCodeable]?, NetworkError>) -> Void
    ) {
        guard
            let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
        else { return }

        let urlSession = URLSession.shared

        let task = urlSession.dataTask(with: url) { data, response, error in

            guard let data = data, error == nil else {
                completion(.failure(.serverError))
                return
            }

            guard
                let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                completion(.failure(.responseError))
                return
            }

            do {
                let photos = try JSONDecoder().decode(
                    [PhotoModelCodeable]?.self, from: data
                )
                
                DispatchQueue.main.async {
                    completion(.success(photos))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }

        task.resume()
    }

}
