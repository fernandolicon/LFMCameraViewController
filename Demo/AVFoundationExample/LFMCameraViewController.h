//
//  AFECameraViewController.h
//  AVFoundationExample
//
//  Created by Luis Fernando Mata on 27/9/15.
//  Copyright © 2015 Luis Fernando Mata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFMCameraView.h"

@interface LFMCameraViewController : UIViewController

typedef enum FlashConfiguration
{
    LFMFlashConfigurationAlways,
    LFMFlashConfigurationAutomatic,
    LFMFlashConfigurationDeactivated
} FlashConfiguration;

- (void)setCameraView: (LFMCameraView *) cameraView;

#pragma mark Camera actions
- (void)focusAndExposeTap:(UIGestureRecognizer *)gestureRecognizer;
- (void)changeCamera;
- (void) setFrontCameraAsDefault;
- (FlashConfiguration) cameraFlashConfiguration;
- (void) setFlashConfiguration: (FlashConfiguration) newConfiguration;
- (BOOL) isCameraAvailable;

#pragma Photo actions
- (void) takeStillPictureWithSuccessBlock: (void (^)(UIImage *cameraImage))success forFailure: (void (^)(NSError *error))failure;
- (void) takeStillPictureSavingInImagesWithSuccessBlock: (void (^)(UIImage *cameraImage))success forFailure: (void (^)(NSError *error))failure;

#pragma Video actions
- (BOOL) isCameraRecording;
- (void)toggleMovieRecording;

#pragma mark Save files
- (void) saveImage: (UIImage *) image successBlock: (void (^)(void)) successBlock forFailure: (void (^)(NSError *error))failure;

@end
