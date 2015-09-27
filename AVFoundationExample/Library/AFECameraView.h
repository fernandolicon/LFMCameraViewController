//
//  AFECameraView.h
//  AVFoundationExample
//
//  Created by Luis Fernando Mata on 26/9/15.
//  Copyright © 2015 Luis Fernando Mata. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVCaptureSession;

@interface AFECameraView : UIView

@property (nonatomic) AVCaptureSession *session;

@end
