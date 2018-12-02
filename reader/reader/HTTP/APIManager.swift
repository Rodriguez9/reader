//
//  APIManager.swift
//  reader
//
//  Created by 姚智豪 on 2018/11/27.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

import UIKit
import MJExtension
class APIManager: NSObject {
    
    class func getNovelLeaderboardSuccess(success : @escaping (_ leaderboardModel:LeaderboardModel?) -> Void,failure : @escaping (_ error:Error?) -> Void){
        
        NetworkManager.getWithURL(url: API_LEADERBOARD, params: [:], success: { (responseObject:Any) in
            if (responseObject as AnyObject).isKind(of:NSDictionary.self) {
                let leaderboardModel = LeaderboardModel.mj_object(withKeyValues: responseObject)
                success(leaderboardModel)
            }
        }) { (error:Error) in
            failure(error)
        }
   }
    
}
