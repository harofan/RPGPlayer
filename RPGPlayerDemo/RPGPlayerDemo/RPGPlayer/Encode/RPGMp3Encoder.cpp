//
//  RPGMp3Encoder.cpp
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/15.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#include "RPGMp3Encoder.h"
#include <iostream>
RPGMp3Encoder::RPGMp3Encoder() {
}

RPGMp3Encoder::~RPGMp3Encoder() {
}

int RPGMp3Encoder::init(const char *pcm_file_path, const char *mp3_file_path, int sample_rate, int channels, int bit_rate){
    int ret = -1;
    pcm_file = fopen(pcm_file_path, "rb");
    if(pcm_file) {
        mp3_file = fopen(mp3_file_path, "wb");
        if(mp3_file) {
            lame_client = lame_init();
            lame_set_in_samplerate(lame_client, sample_rate);
            lame_set_out_samplerate(lame_client, sample_rate);
            lame_set_num_channels(lame_client, channels);
            lame_set_brate(lame_client, bit_rate / 1000);
            lame_init_params(lame_client);
            ret = 0;
        }
    }
    return ret;
}

void RPGMp3Encoder::encode() {
    int buffer_size = 1024 * 256;
    short *buffer = new short[buffer_size / 2];
    short *left_buffer = new short[buffer_size / 4];//左声道
    short *right_buffer = new short[buffer_size / 4];//右声道
    unsigned char *mp3_buffer = new unsigned char[buffer_size];
    size_t read_buffer_size = 0;
    while ((read_buffer_size = fread(buffer, 2, buffer_size / 2, pcm_file)) > 0) {
        for (int i = 0; i < read_buffer_size; i++) {
            if (i % 2 == 0) {
                left_buffer[i / 2] = buffer[i];
            } else {
                right_buffer[i / 2] = buffer[i];
            }
        }
        size_t wrote_size = lame_encode_buffer(lame_client, (short int *) left_buffer, (short int *) right_buffer, (int)(read_buffer_size / 2), mp3_buffer, buffer_size);
        fwrite(mp3_buffer, 1, wrote_size, mp3_file);
    }
    delete[] buffer;
    delete[] left_buffer;
    delete[] right_buffer;
    delete[] mp3_buffer;
}

void RPGMp3Encoder::destory() {
    if(pcm_file) {
        fclose(pcm_file);
    }
    if(mp3_file) {
        fclose(mp3_file);
        lame_close(lame_client);
    }
}
