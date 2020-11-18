//
//  ArticlesListVC.swift
//  NYTimes
//
//  Created by Vineet Singh on 17/11/20.
//

import UIKit

class ArticlesListVC: UIViewController {

    @IBOutlet weak var articlesTableView: UITableView!
    
    let viewModel = ArticlesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        viewModel.getArticles()
        setupTableView()
        
        self.title = "NY Times Most Popular"
        self.navigationController?.navigationBar.backgroundColor = Constants.navigationBG
    
    }
    
    private func setupTableView() {
        articlesTableView.register(UINib(nibName: "ArticlesListTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticlesListTableViewCell")
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
    }

}


extension ArticlesListVC: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticlesListTableViewCell", for: indexPath) as? ArticlesListTableViewCell
        let model = viewModel.models[indexPath.row]
        cell?.updateCell(model)
        
        cell?.accessoryType = .disclosureIndicator
        cell?.selectionStyle = .none
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let article = viewModel.models[indexPath.row]
        
        let vc = ArticleDetailsVC()
        vc.articleModel = article
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}

extension ArticlesListVC: UIUpdateDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.articlesTableView.reloadData()
        }
    }
}
