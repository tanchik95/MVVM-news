//
//  NewsTableViewController.swift
//  MVVM
//
//  Created by Татьяна Аникина on 07.09.2021.
//

import UIKit
import SnapKit

class NewsTableViewController: UIViewController {
    
    private var tableView = UITableView()
    
    
    private var viewModel: NewsTableViewControllerViewModelProtocol! {
        didSet {
            viewModel.getNews {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        viewModel = NewViewModel()
        title = "New"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setTableView() {

        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .white
        view.addSubview(tableView)

        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
    }
 }

extension NewsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        
        return cell
    }
}

extension NewsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetailsTableViewController()
        vc.viewModel = NewsDetalisViewModel(new: viewModel.news[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
