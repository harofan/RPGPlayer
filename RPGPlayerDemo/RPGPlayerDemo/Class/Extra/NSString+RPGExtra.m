//
//  NSString+RPGExtra.m
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/11.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "NSString+RPGExtra.h"

@implementation NSString (RPGExtra)

+(NSString *)bundlePath:(NSString *)fileName {
    return [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:fileName];
}
+(NSString *)documentsPath:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

@end
