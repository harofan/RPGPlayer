//
//  RPGAudioEncodeController.m
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/11.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#import "RPGAudioEncodeController.h"
#import "RPGPlayer.h"
#import "NSString+RPGExtra.h"
@interface RPGAudioEncodeController ()

@end

@implementation RPGAudioEncodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
}
#pragma mark - UI
- (void)initView{
    self.title = @"AudioEncode";
}

#pragma mark - target
- (IBAction)didClickPcm2Mp3Encode:(id)sender {
    NSString *pcmFilePath = [NSString bundlePath:@"vocal.pcm"];
    NSString *mp3FilePath = [NSString documentsPath:@"vocal.mp3"];
    int sampleRate = 44100;
    int channels = 2;
    int bitRate = 128 * 1024;
    BOOL ret = [[RPGPlayerManager shareManager] pcmToMp3EncodeWithPcmFilePath:pcmFilePath mp3FilePath:mp3FilePath sampleRate:sampleRate channels:channels bitRate:bitRate];
    
}
@end
