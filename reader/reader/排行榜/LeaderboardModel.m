//
//  LeaderboardModel.m
//  reader
//
//  Created by YZH on 2018/12/3.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

#import "LeaderboardModel.h"

@implementation LeaderboardModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"item":[LeaderboardDetailModel class]};
}

@end


