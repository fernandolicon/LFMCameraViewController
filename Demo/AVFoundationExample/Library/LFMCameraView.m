//
//  AFECameraView.m
//  AVFoundationExample
//
//  Created by Luis Fernando Mata on 26/9/15.
//  Copyright © 2015 Luis Fernando Mata. All rights reserved.
//

#import "LFMCameraView.h"
#import <AVFoundation/AVFoundation.h>

@implementation LFMCameraView

+ (Class)layerClass
{
    return [AVCaptureVideoPreviewLayer class];
}

- (AVCaptureSession *)session
{
    AVCaptureVideoPreviewLayer *previewLayer = (AVCaptureVideoPreviewLayer *) self.layer;
    return previewLayer.session;
}

- (void)setSession:(AVCaptureSession *)session
{
    AVCaptureVideoPreviewLayer *previewLayer = (AVCaptureVideoPreviewLayer *) self.layer;
    [previewLayer setSession:session];
}

@end
