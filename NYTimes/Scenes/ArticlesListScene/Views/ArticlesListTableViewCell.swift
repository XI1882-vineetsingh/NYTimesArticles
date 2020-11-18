//
//  ArticlesListTableViewCell.swift
//  NYTimes
//
//  Created by Vineet Singh on 17/11/20.
//

import UIKit

class ArticlesListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var calendarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        
    }
    
    func setupUI(){
        
        articleImage.layer.cornerRadius = articleImage.frame.width / 2
        
        calendarImage.tintColor = UIColor.darkGray
        
    }
    
    func updateCell(_ model:Article) {
        self.titleLbl.text = model.title
        self.authorLbl.text = model.byline
        self.dateLbl.text =  model.publishedDate
        
        //Image Setup
        if model.media.count > 0{
            
            let metaData = model.media[0].mediaMetadata
            
            if metaData.count > 0{
                
                let imageUrl = metaData[0].url
                
                guard let url = URL(string: imageUrl)else{return}
                
                if let cachedImage = ArticlesViewModel.imageCache.object(forKey: imageUrl as NSString) {
                    
                    DispatchQueue.main.async {
                        self.articleImage.image = cachedImage
                    }
                    
                }
                else{
                    
                    DispatchQueue.global().async {
                        
                        do{
                            let imageData: Data = try Data(contentsOf: url,options: [])
                            guard let image: UIImage = UIImage(data: imageData)else{return}
                            DispatchQueue.main.async {
                                
                                ArticlesViewModel.imageCache.setObject(image, forKey: imageUrl as NSString)
                                self.articleImage.image = image
                                
                            }
                        }catch{
                            print(error)
                        }
                        
                    }
                    
                }
                
                
            }
            
        }
        
        
        
    }
    
}
