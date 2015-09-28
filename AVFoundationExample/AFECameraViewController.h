//
//  AFECameraViewController.h
//  AVFoundationExample
//
//  Created by Luis Fernando Mata on 27/9/15.
//  Copyright © 2015 Luis Fernando Mata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFECameraView.h"

@interface AFECameraViewController : UIViewController

- (void)setCameraView: (AFECameraView *) cameraView;

#pragma mark Camera actions
- (void) takeStillPictureWithSuccessBlock: (void (^)(UIImage *cameraImage))success forFailure: (void (^)(NSError *error))failure;
- (void) takeStillPictureSavingInImagesWithSuccessBlock: (void (^)(UIImage *cameraImage))success forFailure: (void (^)(NSError *error))failure;
- (void)focusAndExposeTap:(UIGestureRecognizer *)gestureRecognizer;
- (void)changeCamera;
- (void) setFrontCameraAsDefault;

#pragma mark Save files
- (void) saveImage: (UIImage *) image successBlock: (void (^)(void)) successBlock forFailure: (void (^)(NSError *error))failure;

@end
