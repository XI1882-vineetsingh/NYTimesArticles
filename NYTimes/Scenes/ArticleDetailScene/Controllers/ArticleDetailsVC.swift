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
    
    var articleModel: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    
    func setupUI(){
        
        calendarImage.tintColor = UIColor.darkGray
        
        guard let article = articleModel else {
            return
        }
        
        articleTitleLbl.text = article.title
        articleAuthorLbl.text = article.byline
        articleDescLbl.text = article.abstract
        articlePublishedDateLbl.text = article.publishedDate
        
        
    }

}
