//
//  APIManager.swift
//  MVP-API-Demo
//
//  Created by Lana Fernando S on 24/04/22.
//

import Foundation
import Alamofire

final class APIManager {
    
    static let instance = APIManager()
    let baseUrl = "https://datausa.io"
    
    private init(){}
    
    enum EndPoints {
        case population
        
        var urlComponent: String {
            switch self {
            case .population:
                return "/api/data?drilldowns=Nation&measures=Population"
            }
        }
    }
    
    func createRequest<T:Decodable>(endPoints: EndPoints, completionHandler: @escaping (Result<T,Error>) -> Void) {
        let url = baseUrl + endPoints.urlComponent
        AF.request(url, encoding: JSONEncoding.default).response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any], let dataObj = json["data"] as? [[String:Any]] {
                            let jsonData = try JSONSerialization.data(withJSONObject: dataObj, options: [])
                            let resultObj = try JSONDecoder().decode(T.self, from: jsonData)
                            completionHandler(.success(resultObj))
                        }
                    }
                    catch let catchError {
                        completionHandler(.failure(catchError))
                    }
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
