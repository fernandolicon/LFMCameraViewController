# Camera View Controller
This is a view controller class with different methods for an easy implementation of AVFoundation.

In order to use it you just need to inherit this class from your view controller and add an UIView that uses the included CameraView.

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

Coming soon.
