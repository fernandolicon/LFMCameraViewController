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
    __weak IBOutlet LFMCameraView *cameraViewStoryboard;
    __weak IBOutlet UIImageView *pictureTaken;
    __weak IBOutlet UIButton *pictureButton;
    __weak IBOutlet UIButton *savePictureButton;
    __weak IBOutlet UIButton *changeCameraButton;
    __weak IBOutlet UIButton *recordButton;
    __weak IBOutlet UIButton *flashButton;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setCameraView:cameraViewStoryboard];
    // Do any additional setup after loading the view, typically from a nib.s
    
    //[self setFrontCameraAsDefault];
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

- (IBAction)changeFlash:(id)sender {
    FlashConfiguration currentFlashConfiguration = [self cameraFlashConfiguration];
    
    switch (currentFlashConfiguration) {
        case LFMFlashConfigurationAutomatic:
            [self setFlashConfiguration:LFMFlashConfigurationAlways];
            [flashButton setTitle:@"Flash On" forState:UIControlStateNormal];
            break;
        case LFMFlashConfigurationAlways:
            [self setFlashConfiguration:LFMFlashConfigurationDeactivated];
            [flashButton setTitle:@"Flash Off" forState:UIControlStateNormal];
            break;
        case LFMFlashConfigurationDeactivated:
            [self setFlashConfiguration:LFMFlashConfigurationAutomatic];
            [flashButton setTitle:@"Flash Auto" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (IBAction)record:(id)sender {
    if ([self isCameraAvailable]) {
        if ([self isCameraRecording]) {
            [savePictureButton setHidden:NO];
            [pictureButton setHidden:NO];
            [changeCameraButton setHidden:NO];
            [pictureTaken setHidden:NO];
            [recordButton setTitle:@"Record" forState:UIControlStateNormal];
            [self toggleMovieRecording];
        }else{
            [savePictureButton setHidden:YES];
            [pictureButton setHidden:YES];
            [changeCameraButton setHidden:YES];
            [pictureTaken setHidden:YES];
            [recordButton setTitle:@"Stop recording" forState:UIControlStateNormal];
            [self toggleMovieRecording];
        }
    }
}
@end
