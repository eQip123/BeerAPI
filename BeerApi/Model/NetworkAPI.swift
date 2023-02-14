//
//  BeerManage.swift
//  MvpStart
//
//  Created by Aidar Asanakunov on 7/8/22.
//

import Foundation

protocol NetworkService {
    func getBeerList(completion: @escaping ([Beer]) -> Void )
    func getRandomBeerAPI(completion: @escaping ([Beer]) -> Void )
    func getSearchId(id: Int, completion: @escaping (Result<[Beer], Error>) -> Void)
}
class NetworkApi: NetworkService {

    static let shared = NetworkApi()
    let session = URLSession.shared
    let baseURL = "https://api.punkapi.com/v2/"
    func getBeerList(completion: @escaping ([Beer]) -> Void) {
        let request = URLRequest(url: URL(string: baseURL + "beers")!)
        session.dataTask(with: request) { data, _, _ in
            DispatchQueue.main.async {
                guard let data = data,
                      let response = try? JSONDecoder().decode([Beer].self, from: data)
                else {
                    completion([])
                    return
                }
                
                completion(response)
            }
        }.resume()
    }
    func getRandomBeerAPI(completion: @escaping ([Beer]) -> Void) {
        let request = URLRequest(url: URL(string: baseURL + "beers/random")!)
        print(request)
        session.dataTask(with: request) { data, _, _ in
            DispatchQueue.main.async {
                guard let data = data,
                      let response = try? JSONDecoder().decode([Beer].self, from: data)
                else {
                    completion([])
                    return
                }
                completion(response)
            }
        }.resume()
    }

    func getSearchId(id: Int, completion: @escaping (Result<[Beer], Error>) -> Void) {
        let request = URLRequest(url: URL(string: baseURL + "beers/\(id)")!)
        session.dataTask(with: request) { data, _, _ in
            DispatchQueue.main.async {
                guard let data = data,
                      let response = try? JSONDecoder().decode([Beer].self, from: data)
                else {
                    completion(.failure(Errors.errorNil))
                    return
                }
                completion(.success(response))
            }
        }.resume()
    }
    
}
enum Errors: Error {
    case errorNil
}
