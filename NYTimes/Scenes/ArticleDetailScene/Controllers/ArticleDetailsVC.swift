//
//  ArticleDetailsVC.swift
//  NYTimes
//
//  Created by Vineet Singh on 17/11/20.
//

import UIKit

class ArticleDetailsVC: UIViewController {

    @IBOutlet weak var articleTitleLbl: UILabel!
    @IBOutlet weak var articleAuthorLbl: UILabel!
    @IBOutlet weak var articleDescLbl: UILabel!
    @IBOutlet weak var articlePublishedDateLbl: UILabel!
    @IBOutlet weak var calendarImage: UIImageView!
    @IBOutlet weak var articleImage: UIImageView!
    
    var articleModel: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    
    func setupUI(){
        
        calendarImage.tintColor = UIColor.darkGray
        
        articleImage.layer.cornerRadius = articleImage.frame.width / 2
        
        guard let article = articleModel else {
            return
        }
        
        articleTitleLbl.text = article.title
        articleAuthorLbl.text = article.byline
        articleDescLbl.text = article.abstract
        articlePublishedDateLbl.text = article.publishedDate
        
        //Image Setup
        if article.media.count > 0{
            
            let metaData = article.media[0].mediaMetadata
            
            if metaData.count > 0{
                
                let imageUrl = metaData[0].url
                
                if let cachedImage = imageUrl.returnImageCache(){
                    DispatchQueue.main.async {
                        self.articleImage.image = cachedImage
                    }
                }
            }
            
        }
        
        
    }

}
