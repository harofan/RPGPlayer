//
//  RPGPlayerManager.h
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/11.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPGPlayerManager : NSObject

#pragma mark construct manager
+ (instancetype)shareManager;

#pragma mark - audio encode
- (void)pcmToMp3EncodeWithPcmFilePath:(NSString *)pcmFilePath mp3FilePath:(NSString *)mp3FilePath sampleRate:(int)sampleRate channels:(int)channels bitRate:(int)bitRate;
@end
