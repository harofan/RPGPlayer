//
//  Mp3Encoder.cpp
//  RPGPlayerDemo
//
//  Created by 范杨 on 2018/1/10.
//  Copyright © 2018年 RPGLiker. All rights reserved.
//

#include "Mp3Encoder.h"
#include <iostream>
Mp3Encoder::Mp3Encoder() {
}

Mp3Encoder::~Mp3Encoder() {
}

int Mp3Encoder::init(const char *pcm_file_path, const char *mp3_file_path, int sample_rate, int channels, int bit_rate){
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

void Mp3Encoder::encode() {
    int bufferSize = 1024 * 256;
    short *buffer = new short[bufferSize / 2];
    short *leftBuffer = new short[bufferSize / 4];
    short *rightBuffer = new short[bufferSize / 4];
    unsigned char *mp3_buffer = new unsigned char[bufferSize];
    size_t readBufferSize = 0;
    while ((readBufferSize = fread(buffer, 2, bufferSize / 2, pcm_file)) > 0) {
        for (int i = 0; i < readBufferSize; i++) {
            if (i % 2 == 0) {
                leftBuffer[i / 2] = buffer[i];
            } else {
                rightBuffer[i / 2] = buffer[i];
            }
        }
        size_t wroteSize = lame_encode_buffer(lame_client, (short int *) leftBuffer, (short int *) rightBuffer, (int)(readBufferSize / 2), mp3_buffer, bufferSize);
        fwrite(mp3_buffer, 1, wroteSize, mp3_file);
    }
    delete[] buffer;
    delete[] leftBuffer;
    delete[] rightBuffer;
    delete[] mp3_buffer;
}

void Mp3Encoder::destory() {
    if(pcm_file) {
        fclose(pcm_file);
    }
    if(mp3_file) {
        fclose(mp3_file);
        lame_close(lame_client);
    }
}
