//
//  HomeViewController.swift
//  DynamicLayout
//
//  Created by Sunil on 04/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //Storyboard references
    @IBOutlet weak var layoutTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    //Properties
    var presenter: HomePresenterInterface!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        presenter.viewDidLoad()
    }
    
    func configureViews() {
        self.layoutTableView.register(ofType: TextFeedsTableViewCell.self)
        self.layoutTableView.dataSource = self
        self.layoutTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension HomeViewController: HomeViewInterface {
    
    func reloadTableViewData() {
        layoutTableView.reloadData()
    }
    
    func setLoadingVisible(_ visible: Bool) {
        if visible {
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
        }
    }
    
}


extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TextFeedsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let data = presenter.data(forIndexPath: indexPath)
        cell.updateViewsWith(data: data)
        return cell
    }
}
