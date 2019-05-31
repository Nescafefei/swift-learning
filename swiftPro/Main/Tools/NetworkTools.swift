//
//  NetworkTools.swift
//  swiftPro
//
//  Created by diyidan on 2019/5/29.
//  Copyright © 2019 fei. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


protocol NetworkToolProtocol {
    // -----------------我的 mine ----------------
    // 我的界面 cell的数据
    // complete:() -> ()
    static func loadMyCellData(complete:@escaping (_ sections:[[MyCellModel]]) -> ())
    // 我的e关注数据
    static func loadMyConcern(complete:@escaping (_ concerns:[MyConcern]) -> ())
}

// 协议扩展
extension NetworkToolProtocol{
    // 我的界面 cell的数据
    static func loadMyCellData(complete:@escaping (_ sections:[[MyCellModel]]) -> ()){
        
        let url = BASE_URL + "/user/tab/tabs/?"
        let params = ["device_id":device_id]
        
        Alamofire.request(url,parameters:params).responseJSON { (response) in
             // guard 只有在条件不满足的时候才会执行这段代码  近似的看做是Assert
            guard response.result.isSuccess else{
                // 网络错误的提示信息
                return
            }
            if let value = response.result.value{
                let json = JSON(value)
                guard json["message"] == "success" else{
                    return
                }
                if let data = json["data"].dictionary{
                    if let sections = data["sections"]?.array{
                        var sectionArray = [[MyCellModel]]()
                        for item in sections{
                            var  rows = [MyCellModel]()
                            for row in item.arrayObject!{
                                let mycellmodel = MyCellModel.deserialize(from: row as?NSDictionary)
                                rows.append(mycellmodel!)
                            }
                            sectionArray.append(rows)
                        }
                        complete(sectionArray)
                        
                    }
                }
            }
        }
    }
    // 我的关注数据
    static func loadMyConcern(complete:@escaping (_ concerns:[MyConcern]) -> ()){
        let url = BASE_URL + "/concern/v2/follow/my_follow/?"
        let params = ["iid":iid]
        
        Alamofire.request(url,parameters:params).responseJSON { (response) in
            // guard 只有在条件不满足的时候才会执行这段代码  近似的看做是Assert
            guard response.result.isSuccess else{
                // 网络错误的提示信息
                return
            }
            if let value = response.result.value{
                let json = JSON(value)
                guard json["message"] == "success" else{
                    return
                }
                if let dataArr = json["data"].arrayObject{
                    var concernTempArr = [MyConcern]()
                    for dic in dataArr{
                        let model = MyConcern.deserialize(from: dic as?NSDictionary)
                        concernTempArr.append(model!)
                    }
                    complete(concernTempArr)
                }
            }
        }
    }
    
}


struct NetworkTools:NetworkToolProtocol { }
