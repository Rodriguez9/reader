//
//  RXLeaderContentModel.h
//  RXBookRead
//
//  Created by Evan on 2018/5/30.
//  Copyright © 2018年 Evan. All rights reserved.
//

#import "RXObject.h"

@class RXLeaderContentDetailModel;
@interface RXLeaderContentModel : RXObject
@property (nonatomic, strong) NSArray <RXLeaderContentDetailModel *>* books;
@end

@interface RXLeaderContentDetailModel :RXObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *shortIntro;
@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *majorCate;
@property (nonatomic, assign) long long latelyFollower;
@property (nonatomic, assign) double retentionRatio;
@end
