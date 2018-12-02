//
//  RXAPIManager.h
//  RXBookRead
//
//  Created by Evan on 2018/5/29.
//  Copyright © 2018年 Evan. All rights reserved.
//

#import "RXObject.h"

@class RXLeaderboardModel,RXLeaderContentModel,RXBookDetailModel,RXCategoryModel,RXSearchHotwordModel,RXChapterListModel,RXChapterModel;
@interface RXAPIManager : RXObject

//获取小说排行榜
+ (void)getNovelLeaderboardSuccess:(void(^)(RXLeaderboardModel *leaderboardModel))success failure:(void(^)(NSError *error))failure;

//获取小说书单排行榜
+(void)getNovelListLeaderBoardWithRankingId:(NSString *)rankingId success:(void(^)(RXLeaderContentModel *leaderContentModel))success failure:(void(^)(NSError *error))failure;

//获取书籍详情
+ (void)getBookDetailWithBookId:(NSString *)bookId success:(void(^)(RXBookDetailModel *bookDetailModel))success failure:(void(^)(NSError *error))failure;

//获取书籍分类列表
+ (void)getBookCategotySuccess:(void(^)(RXCategoryModel *categoryModel))success failure:(void(^)(NSError *error))failure;

//获取具体分类的书籍列表
+ (void)getCategotyBookListWithMajor:(NSString *)major success:(void(^)(RXLeaderContentModel *categoryBookModel))success failure:(void(^)(NSError *error))failure;

//获取小说热词
+ (void)getSearchHotwordSuccess:(void(^)(RXSearchHotwordModel *searchHotwordModel))success failure:(void(^)(NSError *error))failure;

//获取小说搜索结果
+ (void)getSearchResultWithKeyword:(NSString *)keyword success:(void(^)(RXLeaderContentModel *categoryBookModel))success failure:(void(^)(NSError *error))failure;

//获取小说章节列表
+ (void)getChapterListWithBookId:(NSString *)bookId success:(void(^)(RXChapterListModel *chapterListModel))success failure:(void(^)(NSError *error))failure;

//获取小说章节详细信息
+ (void)getChapterDetailWithLink:(NSString *)link success:(void(^)(RXChapterModel *chapterModel))success failure:(void(^)(NSError *error))failure;
@end
