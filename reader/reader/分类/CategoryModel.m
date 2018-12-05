//
//  CategoryModel.m
//  reader
//
//  Created by YZH on 2018/12/6.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

#import "CategoryModel.h"
#import "CategoryDetailModel.h"
@implementation CategoryModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"male" : [CategoryDetailModel class]};
}
@end
