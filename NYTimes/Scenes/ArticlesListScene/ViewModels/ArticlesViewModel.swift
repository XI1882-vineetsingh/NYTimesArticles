//
//  ArticlesViewModel.swift
//  NYTimes
//
//  Created by Vineet Singh on 17/11/20.
//

import Foundation
import UIKit

protocol UIUpdateDelegate:class {
    func reloadTableView()
}

class ArticlesViewModel {
    
    weak var delegate:UIUpdateDelegate?
    
    let networkManager = NYTimesService.sharedInstance
    var models: [Article] = []
    
    static var imageCache = NSCache<NSString, UIImage>()
    
    func getArticles() {
            
        self.delegate?.reloadTableView()
        
        networkManager.getPopularArticles { [weak self](model, error) in
            
            if error == nil && model != nil {
                 
                let models = model?.results ?? []
                 
                self?.reloadDataForPage(models)
             
            }
            
        }
        
    }
    
    func reloadDataForPage(_ articles:[Article]) {
        
        for article in articles{
            self.models.append(article)
        }
        
        self.delegate?.reloadTableView()
    }
    
}
