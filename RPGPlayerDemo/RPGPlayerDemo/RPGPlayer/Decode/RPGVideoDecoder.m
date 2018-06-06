//
//  RPGVideoDecoder.m
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/15.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "RPGVideoDecoder.h"

#import "avformat.h"
#import "swscale.h"
#import "swresample.h"
#import "pixdesc.h"


@interface RPGVideoDecoder()

@end

@implementation RPGVideoDecoder{
    int _readLastestFrameTime;
    int _subscribeTimeOutTimeInSecs;//超时时间
    BOOL _interrupted;//被中断
}
- (instancetype)initW{
    if (self = [super init]) {
//        avformat_network_init();
//        av_register_all();
    }
    return self;
}

#pragma mark - ffmpeg reigist funcation

- (void)initFFmpegFuncation{
    avformat_network_init();
    av_register_all();
    
    AVFormatContext *formatctx = avformat_alloc_context();
//    AVIOInterruptCB int_cb = {
}
    
#pragma mark - callvack
static int interrupt_callback(void *ctx)
{
    if (!ctx)
        return 0;
    __unsafe_unretained RPGVideoDecoder *p = (__bridge RPGVideoDecoder *)ctx;
    const BOOL r = [p detectInterrupted];
    if (r) NSLog(@"DEBUG: INTERRUPT_CALLBACK!");
    return r;
}

#pragma mark - private
- (BOOL) detectInterrupted;
{
    if ([[NSDate date] timeIntervalSince1970] - _readLastestFrameTime > _subscribeTimeOutTimeInSecs) {
        return YES;
    }
    return _interrupted;
}
@end
