//
//  RPGMp3Encoder.hpp
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/15.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#ifndef RPGMp3Encoder_h
#define RPGMp3Encoder_h

//#include <stdio.h>
#include "lame.h"

class RPGMp3Encoder{
public:
    RPGMp3Encoder();
    ~RPGMp3Encoder();
    int init(const char *pcm_file_path, const char *mp3_file_path,int sample_rate, int channels, int bit_rate);
    void encode();
    void destory();
private:
    FILE *pcm_file;
    FILE *mp3_file;
    lame_t lame_client;
};

#endif /* RPGMp3Encoder_h */
