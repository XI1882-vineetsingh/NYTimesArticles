//
//  Extensions.swift
//  NYTimes
//
//  Created by Vineet Singh on 18/11/20.
//

import Foundation
import UIKit

extension String{
    
    func returnImageCache() -> UIImage? {
        
        if let image = ArticlesViewModel.imageCache.object(forKey: self as NSString){
            return image
        }
        else{
            return nil
        }
        
    }
    
}
