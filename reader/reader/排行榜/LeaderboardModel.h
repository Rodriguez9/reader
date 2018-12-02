//
//  LeaderboardModel.h
//  reader
//
//  Created by YZH on 2018/12/3.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeaderboardDetailModel.h"
@class LeaderboardDetailModel;
@interface LeaderboardModel : NSObject
@property(nonatomic,strong)NSArray <LeaderboardDetailModel *> *item;
@end







