//
//  UdeskTools.h
//  UdeskSDK
//
//  Created by xuchen on 16/1/18.
//  Copyright © 2016年 xuchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UdeskTools : NSObject

//判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)string;
//随机生成唯一字符串
+ (NSString *)soleString;
//网络状态
+ (NSString *)internetStatus;

@end
