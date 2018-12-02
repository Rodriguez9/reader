//
//  RXAPIManager.m
//  RXBookRead
//
//  Created by Evan on 2018/5/29.
//  Copyright © 2018年 Evan. All rights reserved.
//

#import "RXAPIManager.h"
#import "RXNetworkManager.h"
#import "RXLeaderboardModel.h"
#import "RXLeaderContentModel.h"
//#import "RXBookDetailModel.h"
//#import "RXCategoryModel.h"
//#import "RXSearchHotwordModel.h"
//#import "RXChapterListModel.h"
//#import "RXChapterModel.h"
//#import "RXReadUtilites.h"

@implementation RXAPIManager

//获取小说排行榜
+ (void)getNovelLeaderboardSuccess:(void(^)(RXLeaderboardModel *leaderboardModel))success failure:(void(^)(NSError *error))failure{
    
    [RXNetworkManager getWithURL:API_LEADERBOARD params:nil success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]){
            RXLeaderboardModel *leaderboardModel = [RXLeaderboardModel mj_objectWithKeyValues:responseObject];
            if(success){
                success(leaderboardModel);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

//获取小说书单排行榜
+(void)getNovelListLeaderBoardWithRankingId:(NSString *)rankingId success:(void(^)(RXLeaderContentModel *leaderContentModel))success failure:(void(^)(NSError *error))failure{
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@",API_LEADERBOARD_BOOK,rankingId];
    [RXNetworkManager getWithURL:urlStr params:nil success:^(id responseObject) {
        if ([responseObject[@"ranking"] isKindOfClass:[NSDictionary class]]){
            RXLeaderContentModel *leaderContentModel = [RXLeaderContentModel mj_objectWithKeyValues:responseObject[@"ranking"]];
            if (success) {
                success(leaderContentModel);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

//获取书籍详情
+ (void)getBookDetailWithBookId:(NSString *)bookId success:(void(^)(RXBookDetailModel *bookDetailModel))success failure:(void(^)(NSError *error))failure{
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@",API_BOOKDETAIL,bookId];
    [RXNetworkManager getWithURL:urlStr params:nil success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]){
            RXBookDetailModel *bookDetailModel = [RXBookDetailModel mj_objectWithKeyValues:responseObject];
            if (success) {
                success(bookDetailModel);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

//获取书籍分类列表
+ (void)getBookCategotySuccess:(void(^)(RXCategoryModel *categoryModel))success failure:(void(^)(NSError *error))failure{
    [RXNetworkManager getWithURL:API_BOOKCATEGORY params:nil success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]){
            RXCategoryModel *categoryModel = [RXCategoryModel mj_objectWithKeyValues:responseObject];
            if (success) {
                success(categoryModel);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

//获取具体分类的书籍列表
+ (void)getCategotyBookListWithMajor:(NSString *)major success:(void(^)(RXLeaderContentModel *categoryBookModel))success failure:(void(^)(NSError *error))failure{

    NSDictionary *params = [NSDictionary dictionaryWithObjects:@[@"male",@"hot",major] forKeys:@[@"gender",@"type",@"major"]];
    [RXNetworkManager getWithURL:API_CATEGORY_BOOKLIST params:params success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]){
            RXLeaderContentModel *leaderContentModel = [RXLeaderContentModel mj_objectWithKeyValues:responseObject];
            if (success) {
                success(leaderContentModel);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

//获取小说热词
+ (void)getSearchHotwordSuccess:(void(^)(RXSearchHotwordModel *searchHotwordModel))success failure:(void(^)(NSError *error))failure{
    
    [RXNetworkManager getWithURL:API_BOOK_HOTWORD params:nil success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]){
            RXSearchHotwordModel *searchHotwordModel = [RXSearchHotwordModel mj_objectWithKeyValues:responseObject];
            if (success) {
                success(searchHotwordModel);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

//获取小说搜索结果
+ (void)getSearchResultWithKeyword:(NSString *)keyword success:(void(^)(RXLeaderContentModel *categoryBookModel))success failure:(void(^)(NSError *error))failure{
    
     NSDictionary *params = [NSDictionary dictionaryWithObjects:@[keyword] forKeys:@[@"query"]];
    [RXNetworkManager getWithURL:API_SEARCH_RESULT params:params success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]){
            RXLeaderContentModel *leaderContentModel = [RXLeaderContentModel mj_objectWithKeyValues:responseObject];
            if (success) {
                success(leaderContentModel);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

//获取小说章节列表
+ (void)getChapterListWithBookId:(NSString *)bookId success:(void(^)(RXChapterListModel *chapterListModel))success failure:(void(^)(NSError *error))failure{
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@?view=chapters",API_BOOK_CHAPTERLIST,bookId];
    [RXNetworkManager getWithURL:urlStr params:nil success:^(id responseObject) {
        if ([responseObject[@"mixToc"] isKindOfClass:[NSDictionary class]]){
            [RXReadUtilites sharedInstance].chapterList = [NSMutableArray arrayWithArray:responseObject[@"mixToc"][@"chapters"]];
            RXChapterListModel *chapterListModel = [RXChapterListModel mj_objectWithKeyValues:responseObject[@"mixToc"]];
            if (success) {
                success(chapterListModel);
            }
        }else{
            if (failure) {
                failure(nil);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

//获取该小说章节的详细内容
+ (void)getChapterDetailWithLink:(NSString *)link success:(void(^)(RXChapterModel *chapterModel))success failure:(void(^)(NSError *error))failure{
     NSString *urlStr = [NSString stringWithFormat:@"%@/%@",API_BOOK_CHAPTERDETAIL,[link urlEncode]];

    [RXNetworkManager getWithURL:urlStr params:nil success:^(id responseObject) {
        if ([responseObject[@"chapter"] isKindOfClass:[NSDictionary class]]){
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:responseObject[@"chapter"]];
            [dict rx_setObject:link forKey:@"link"];
            //对下载的数据进行缓存
            [[RXReadUtilites sharedInstance].chapters rx_addObject:dict];
            RXChapterModel *chapterModel = [RXChapterModel mj_objectWithKeyValues:dict];
            if (success) {
                success(chapterModel);
            }
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
