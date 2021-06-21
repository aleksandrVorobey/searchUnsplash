//
//  NetworkService.swift
//  SearchUnsplash
//
//  Created by Александр Воробей on 18.06.2021.
//

import Foundation

class NetworkService {
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        let parametrs = prepareParameters(searchTerm: searchTerm)
        let url = url(params: parametrs)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepereHeaders()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func prepereHeaders() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID TPt1-SVIPNeZ8XVcq0yjJPmHN8I8wCFftIOr4Il8JBw"
        return headers
    }
    
    private func prepareParameters(searchTerm: String?) -> [String: String] {
        var parametrs = [String: String]()
        parametrs["query"] = searchTerm
        parametrs["page"] = "1"
        parametrs["per_page"] = String(30)
        return parametrs
    }
    
    private func url(params: [String: String]) -> URL {
        var componets = URLComponents()
        componets.scheme = "https"
        componets.host = "api.unsplash.com"
        componets.path = "/search/photos"
        componets.queryItems = params.map{URLQueryItem(name: $0, value: $1)}
        return componets.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
