//
//  RPGPlayerManager.m
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/11.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "RPGPlayerManager.h"
#import "RPGMp3Encoder.h"

@implementation RPGPlayerManager

#pragma mark construct manager
static RPGPlayerManager *_share = nil;
+ (instancetype)shareManager{
    static dispatch_once_t once = 0;
    dispatch_once(&once, ^{
        _share = [[super allocWithZone:NULL] init];
    });
    return _share;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self shareManager];
}

#pragma mark - audio encode
- (BOOL)pcmToMp3EncodeWithPcmFilePath:(NSString *)pcmFilePath mp3FilePath:(NSString *)mp3FilePath sampleRate:(int)sampleRate channels:(int)channels bitRate:(int)bitRate{
    NSLog(@"Start Encode...");
    RPGMp3Encoder *encoder = new RPGMp3Encoder();
    const char *pcm_file_path = [pcmFilePath cStringUsingEncoding:NSUTF8StringEncoding];
    const char *mp3_file_path = [mp3FilePath cStringUsingEncoding:NSUTF8StringEncoding];
    int ret = encoder->init(pcm_file_path, mp3_file_path, sampleRate, channels, bitRate);
    if (ret == 0) {
        encoder->encode();
        NSLog(@"Encode Success");
    }else{
        NSLog(@"Encode Failure");
    }
    encoder->destory();
    delete encoder;
    return !ret;//ret 为0成功
}
@end
