//
//  EndPoint.swift
//  NYTimes
//
//  Created by Vineet Singh on 17/11/20.
//

import Foundation
import UIKit

struct Constants {
    static let apiKey:String = "NHY0Hq0miGDsruQbgk0Y3wMTdwqUYNAT"
    static let navigationBG :UIColor = UIColor(red: 120/255, green: 225/255, blue: 195/255, alpha: 1)
    
}

enum EndPoint:String {
    
    case BASE_URL = "https://api.nytimes.com/svc"
    //MARK:- URLs
    case popularArticles = "/mostpopular/v2/viewed/7.json?api-key=NHY0Hq0miGDsruQbgk0Y3wMTdwqUYNAT"

}

//MARK:- EndPoint extension for URL
extension EndPoint{
    
    var url: String{
        
        switch self {
        case .BASE_URL:
            return self.rawValue
        default:
            let tempString = "\(EndPoint.BASE_URL.rawValue)\(self.rawValue)"
            return tempString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        }
        
    }
    
}
