//
//  Mp3Encoder.h
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/10.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#ifndef Mp3Encoder_h
#define Mp3Encoder_h

#include "lame.h"

class Mp3Encoder{
public:
    Mp3Encoder();
    ~Mp3Encoder();
    int init(const char *pcm_file_path, const char *mp3_file_path,int sample_rate, int channels, int bit_rate);
    void encode();
    void destory();
private:
    FILE *pcm_file;
    FILE *mp3_file;
    lame_t lame_client;
};
#endif /* Mp3Encoder_h */
