//
//  NYTimesService.swift
//  NYTimes
//
//  Created by Vineet Singh on 17/11/20.
//

import Foundation

final class NYTimesService {
   
    static let sharedInstance = NYTimesService()
    
    private init() {
        
    }
    
    enum HTTPError: Error {
        case invalidURL
        case invalidResponse(Data?, URLResponse?)
    }
    
    private func get(urlString: String, completionBlock: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionBlock(.failure(HTTPError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completionBlock(.failure(error!))
                return
            }

            guard
                let responseData = data,
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode else {
                    completionBlock(.failure(HTTPError.invalidResponse(data, response)))
                    return
            }

            completionBlock(.success(responseData))
        }
        task.resume()
    }
    
    
    func getPopularArticles(completion:@escaping((PopularArticlesModel?,Error?) -> ())) {
        let urlString = EndPoint.popularArticles.url
        self.get(urlString: urlString) { (result) in
            switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let models = try decoder.decode(PopularArticlesModel.self, from: data)
                         completion(models,nil)
                    }catch {
                        completion(nil,error)
                    }
                case .failure(let error): completion(nil,error)
            }
        }
    }
    
}
