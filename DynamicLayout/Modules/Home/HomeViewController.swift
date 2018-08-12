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
    var feedsAdapter: HomeFeedsAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedsAdapter = HomeFeedsAdapter(presenter: presenter)
        configureViews()
        presenter.viewDidLoad()
        
    }
    
    func configureViews() {
        customiseNavigationController()
        self.layoutTableView.register(ofType: TextFeedsTableViewCell.self)
        self.layoutTableView.register(ofType: ImageFeedTableViewCell.self)
        self.layoutTableView.register(ofType: HorizontalScrollTableViewCell.self)
        
        self.layoutTableView.dataSource = feedsAdapter
        self.layoutTableView.delegate = feedsAdapter
        self.layoutTableView.tableFooterView = UIView()
        self.layoutTableView.rowHeight = UITableViewAutomaticDimension
        self.layoutTableView.estimatedRowHeight = 100
    }
    
    func customiseNavigationController() {
        self.navigationController?.navigationBar.barTintColor = AppColors.primary
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: AppColors.navTextColor]
        self.navigationItem.title = NSLocalizedString("HOME_TITLE", comment: "")
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
