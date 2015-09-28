# Camera View Controller
This is a view controller class with different methods for an easy implementation of AVFoundation.

In order to use it you just need to inherit this class from your view controller and add an UIView that uses the included CameraView.
## Setting the class

To start using the class you need to set your view as a Camera view with the **setCameraView:** method:

```Obj-C
[self setCameraView:yourView];
```

If you want to implement a focus tap gesture just call the method **focusAndExposeTap** like this:

```Obj-C
UIGestureRecognizer *gestureRecognizer = (UIGestureRecognizer *) sender;
[self focusAndExposeTap:gestureRecognizer];
```

## Camera methods

If you want to change the camera just call the **changeCamera** method.

```Obj-C
[self changeCamera];
```

By default the back camera is activated, if you want to change this just call the **setFrontCameraAsDefault** in your view did load after [super viewDidLoad]:

```Obj-C
[super viewDidLoad];
[self setFrontCameraAsDefault];
```

## Photo methods

The photo methods let you take pictures easily and save them in the gallery if the user grants you permission.

In order to use them you have two methods.

The **takeStillPictureWithSuccessBlock** lets you take a picture and use it in your app, this would not save the picture in the users phone, so you can do whatever you want with it.

```Obj-C
[self takeStillPictureWithSuccessBlock:^(UIImage *cameraImage) {
      //Do what you want with the image
    } forFailure:^(NSError *error) {
      //Do something with the error
    }];
```

In case you want to save the picture you've two options, you can call **saveImage:successBlock:forFailure:** and send the user image to the method:
```Obj-C
[self saveImage:userImage successBlock:^{
      //Let the user know his image was saved
    } forFailure:^(NSError *error) {
      //Do something with the error
    }];
```
Or you can call **takeStillPictureWithSuccessBlock:forFailure:** and save the image once it's taken:

```Obj-C
[self takeStillPictureSavingInImagesWithSuccessBlock:^(UIImage *cameraImage) {
      //Do something with the saved image
    } forFailure:^(NSError *error) {
      //Do something with the erro
    }];
```

## Video methods

Video is a little different from picture. When you start recording video it's recomended to hide all the other buttons to take pictures or change camera, for this you can use the method **isCameraRecording**, it returns a boolean value.

```Obj-C
[self isCameraRecording];
```

If you want to start or stop a recording session you can call the **toggleMovieRecording**, this method will start or end (depending on the status of recording) a video recording. When the recording is stopped the file is saved in the user phone.

```Obj-C
[self toggleMovieRecording];
```

## What's missing?

The idea is to implement a way to record a video without saving it into the user phone (just like the picture works). Also all the session methods are not implemented.
