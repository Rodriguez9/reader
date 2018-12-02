//
//  RXConst_API.h
//  RXBookRead
//
//  Created by Evan on 2018/5/29.
//  Copyright © 2018年 Evan. All rights reserved.
//

#ifndef RXConst_API_h
#define RXConst_API_h

#ifdef DEBUG
// 测试环境
#define API_HOST                            @"http://api.zhuishushenqi.com"
#else
// 生产环境
#define API_HOST                            @"http://api.zhuishushenqi.com/"
#endif


//小说排行榜
#define API_LEADERBOARD     @"http://ir-2016137559.cn-north-1.elb.amazonaws.com.cn/api/v2/rank.php"
//小说排行榜图片前缀
#define IMAGE_PRE   @"http://statics.zhuishushenqi.com"

//小说书单排行榜
#define API_LEADERBOARD_BOOK  [API_HOST stringByAppendingString:@"/ranking"]

//书籍详情
#define API_BOOKDETAIL [API_HOST stringByAppendingString:@"/book"]

//书籍分类
#define API_BOOKCATEGORY [API_HOST stringByAppendingString:@"/cats/lv2/statistics"]

//书籍分类的具体书籍列表
#define API_CATEGORY_BOOKLIST [API_HOST stringByAppendingString:@"/book/by-categories"]

//获取小说热词
#define API_BOOK_HOTWORD [API_HOST stringByAppendingString:@"/book/hot-word"]

//获取小说搜索结果
#define API_SEARCH_RESULT [API_HOST stringByAppendingString:@"/book/fuzzy-search"]

//获取小说章节列表
#define API_BOOK_CHAPTERLIST [API_HOST stringByAppendingString:@"/mix-atoc"]

//获取小说章节详细信息
#define API_BOOK_CHAPTERDETAIL @"http://chapter2.zhuishushenqi.com/chapter"

#endif /* RXConst_API_h */
