//
//  HomeInteractor.swift
//  DynamicLayout
//
//  Created by Sunil on 04/08/18.
//  Copyright © 2018 Sunil Sharma. All rights reserved.
//

class HomeInteractor {
    
    fileprivate let localDataService = LocalDataService()
    
}

extension HomeInteractor: HomeInteractorInterface {
    
    func getFeedsData(completion: ((_ status:ResponseStatus, _ feeds:[HomeFeedModel]?, _ error: ErrorData?) -> Void)?) {
        localDataService.getFeedsData(completion: completion)
    }
    
}
