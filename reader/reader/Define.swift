//
//  Define.swift
//  模仿小说
//
//  Created by 姚智豪 on 2018/11/24.
//  Copyright © 2018年 YZH. All rights reserved.
//

import Foundation
import UIKit

let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height

#if DEBUG
// 测试环境
let API_HOST = "http://api.zhuishushenqi.com"
#else
// 生产环境
let API_HOST = "http://api.zhuishushenqi.com/"
#endif

//小说排行榜
let API_LEADERBOARD = "http://ir-2016137559.cn-north-1.elb.amazonaws.com.cn/api/v2/rank.php"
//小说排行榜图片前缀
let IMAGE_PRE = "http://statics.zhuishushenqi.com"

let API_LEADERBOARD_BOOK = API_HOST+"/ranking"

//书籍分类
let API_BOOKCATEGORY = API_HOST+"/cats/lv2/statistics"
