//
//  RXLeaderContentModel.m
//  RXBookRead
//
//  Created by Evan on 2018/5/30.
//  Copyright © 2018年 Evan. All rights reserved.
//

#import "RXLeaderContentModel.h"

@implementation RXLeaderContentModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"books" : [RXLeaderContentDetailModel class]};
}

@end

@implementation RXLeaderContentDetailModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{ @"ID" : @"_id"};
}
@end
