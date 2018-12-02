//
//  RXLeaderboardModel.h
//  RXBookRead
//
//  Created by Evan on 2018/5/29.
//  Copyright © 2018年 Evan. All rights reserved.
//

#import "RXObject.h"

@class RXLeaderboardDetailModel;
@interface RXLeaderboardModel : RXObject
@property (nonatomic, strong) NSArray <RXLeaderboardDetailModel *> *item;
@end

@interface RXLeaderboardDetailModel : RXObject
@property (nonatomic, copy) NSString *rankName;
@property (nonatomic, copy) NSString *book_name;
@property (nonatomic, copy) NSString *coverImgUrl;
@property (nonatomic, copy) NSString *rankid;

@end
