//
//  RXLeaderboardModel.m
//  RXBookRead
//
//  Created by Evan on 2018/5/29.
//  Copyright © 2018年 Evan. All rights reserved.
//

#import "RXLeaderboardModel.h"

@implementation RXLeaderboardModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"item" : [RXLeaderboardDetailModel class]};
}

@end

@implementation RXLeaderboardDetailModel

@end
