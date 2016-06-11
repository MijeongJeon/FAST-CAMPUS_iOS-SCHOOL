Day34_Alert, ImagePickerView
--
<br>
####:notebook: **이론**

#####**Alert**
- UIAlertController: Alert Controller Style// Action Sheet Style
- UIAlertAction: Default, Destructive(red), Cancel(only one)
- Modal(presentViewController)를 이용해 화면에 띄운다.

```objective-c
// alert 객체 생성
UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title"
                                                               message:@"Message"
                                                        preferredStyle:UIAlertControllerStyle];
// alert action 설정
UIAlertAction *action = [UIAlertAction actionWithTitle:@"actionTitle"
                                                 style:UIAlertActionStyle
                                               handler:^(UIAlertAction * _Nonnull action) {
                                            }];

```
<br>
<br>

#####**Gesture Recognizer**
- View위에 형태없이 존재하며 다양한 이벤트를 감지함
- 옵션값을 이용해 터치 수와, 터시 손가락 수 설정 가능
- delegate를 이용하거나 action method연결을 통해 행동을 설정할 수 있음
<br>
<br>

#####**ImagePickerView**
- 라이브러리, 카메라롤, 카메라로부터 사진을 가져오는 기능이 구현되어있는 클래스
- 옵션을 이용해 사진을 가져올시 크롭편집을 가능하게 할 수 있음
- ImagePickerViewDelegate를 이용해 화면에 이미지를 보여줄수 있음

```objective-c
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
// 이미지가 선택됬을때 행동 지정 delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info;
```
<br>
```objective-c
// info dictionary keys
NSString *const UIImagePickerControllerMediaType;       // an NSString (UTI, i.e. kUTTypeImage)
NSString *const UIImagePickerControllerOriginalImage;   // a UIImage
NSString *const UIImagePickerControllerEditedImage;     // a UIImage
NSString *const UIImagePickerControllerCropRect;        // an NSValue (CGRect)
NSString *const UIImagePickerControllerMediaURL;        // an NSURL
NSString *const UIImagePickerControllerReferenceURL;    // an NSURL that references an asset in the AssetsLibrary framework
NSString *const UIImagePickerControllerMediaMetadata;   // an NSDictionary containing metadata from a captured photo
NSString *const UIImagePickerControllerLivePhoto;       // a PHLivePhoto
```
<br>
<br>

####:computer: **실습**
- Alert 구현
- Gesture recognize를 이용한 화면 전체 이벤트 감지 구현
- imagePickerView 생성 및 화면 사이즈 조절

// Alert Style
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day34_160610(Alert)1.png?" width="400px" />

// Action Sheet Style
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day34_160610(Alert)2.png?" width="400px" />

// Gesture Recognize
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day34_160610(ImagePicker)1.png?" width="400px" />

// ImagePickerView
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day34_160610(ImagePicker)2.png?" width="400px" />

// ImageView + ViewContentMode
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day34_160610(ImagePicker)3.png?" width="400px" />

