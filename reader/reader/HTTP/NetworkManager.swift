//
//  NetworkManager.swift
//  reader
//
//  Created by 姚智豪 on 2018/11/27.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

import UIKit
import AFNetworking
import AVFoundation

enum HttpContentType : Int {
    case From  //表单
    case Json
}

class NetworkManager: NSObject {
    
    //设置交互方式
    class func setupAFManagerWithContentType(contentType:HttpContentType) -> AFHTTPSessionManager {
        let managershareSingleOne =  AFHTTPSessionManager()
        let manager = managershareSingleOne
        manager.requestSerializer.timeoutInterval = 30
        // 响应序列化设置,用来处理服务器返回数据，提供返回码校验和数据校验的功能
        let serializershareSingleOne = AFJSONResponseSerializer()
        manager.responseSerializer = serializershareSingleOne
        if contentType == .From{
            // FORM方式
            //AFJSONRequestSerializer:用来将字典参数编码成URL传输参数，并提供上传文件的基本功能实现
            let serializershareSingleOne = AFJSONRequestSerializer()
            manager.requestSerializer = serializershareSingleOne
            manager.requestSerializer.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        }
        else if contentType == .Json{
            let serializershareSingleOne = AFJSONRequestSerializer()
            manager.requestSerializer = serializershareSingleOne
            manager.requestSerializer.setValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
            manager.responseSerializer.acceptableContentTypes = Set<AnyHashable>(["application/json", "text/json", "text/javascript", "text/html", "text/plain"]) as? Set<String>
        }
        return manager
    }
    
    class func getWithURL(url:String,params:NSDictionary,success:@escaping (_ responseObject:Any)->Void,failure:@escaping (_ error:Error)->Void){
        //1.船舰请求管理对象
        let mgr = self.setupAFManagerWithContentType(contentType: HttpContentType.Json)
        mgr.get(url, parameters: params, success: { (task:URLSessionDataTask, responseObject:Any) in
             success(responseObject)
        }, failure: { (task:URLSessionDataTask?, Error) in
            failure(Error)
        })
    }
    
}
