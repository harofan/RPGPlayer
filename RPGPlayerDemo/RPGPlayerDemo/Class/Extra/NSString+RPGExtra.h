//
//  NSString+RPGExtra.h
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/11.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RPGExtra)

+(NSString *)bundlePath:(NSString *)fileName;
+(NSString *)documentsPath:(NSString *)fileName;

@end
