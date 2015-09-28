//
//  ViewController.m
//  AVFoundationExample
//
//  Created by Luis Fernando Mata on 26/9/15.
//  Copyright © 2015 Luis Fernando Mata. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    IBOutlet UITapGestureRecognizer *focusGesture;
    __weak IBOutlet AFECameraView *cameraViewStoryboard;
    __weak IBOutlet UIImageView *pictureTaken;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [self setCameraView:cameraViewStoryboard];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.s
    
    [self setFrontCameraAsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)focusCameraView:(id)sender {
    UIGestureRecognizer *gestureRecognizer = (UIGestureRecognizer *) sender;
    [self focusAndExposeTap:gestureRecognizer];
}

- (IBAction)takePicture:(id)sender {
    [self takeStillPictureWithSuccessBlock:^(UIImage *cameraImage) {
        [pictureTaken setImage:cameraImage];
    } forFailure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (IBAction)takeAndSavePicture:(id)sender {
    [self takeStillPictureSavingInImagesWithSuccessBlock:^(UIImage *cameraImage) {
        [pictureTaken setImage:cameraImage];
    } forFailure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (IBAction)changeUserCamera:(id)sender {
    [self changeCamera];
}

@end
