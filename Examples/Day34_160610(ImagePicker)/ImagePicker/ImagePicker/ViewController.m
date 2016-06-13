//
//  ViewController.m
//  ImagePicker
//
//  Created by Mijeong Jeon on 6/10/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clickInvisibleAlertButton:(id)sender {
    NSLog(@"Image View touched");
    
    UIAlertController *photoAlertSheet = [UIAlertController alertControllerWithTitle:@"PHOTO SOURCE"
                                                                             message:@"Select Photo Source"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *library = [UIAlertAction actionWithTitle:@"Photo Library"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             NSLog(@"Library");
                                                             [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
   
    }];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Camera"
                                                           style:UIAlertActionStyleDestructive
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             NSLog(@"Camera");
                                                             [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Cancel"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       NSLog(@"Cancel");

    }];
    
    [photoAlertSheet addAction:library];
    [photoAlertSheet addAction:camera];
    [photoAlertSheet addAction:cancle];
    
    [self presentViewController:photoAlertSheet animated:YES completion:nil];
    
}

- (void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    
    if ([UIImagePickerController isSourceTypeAvailable:sourceType] == NO) {
        NSLog(@"You cannot use this source");
     return;
    }
    
    
    // pieckController 생성
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    [pickerController setSourceType:sourceType];
    pickerController.delegate = self;
    
    // 이미 수정 허용(기본적으로 수정불가능으로 설정되어있다)
    [pickerController setAllowsEditing:YES];
    
    [self presentViewController:pickerController animated:YES completion:nil]; // pickerview를 모달로 보여준다.
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil]; // 모달을 내려준다.
}


- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // 선택된 사진의 원본 이미지를 객체로 생성해준다.
    UIImage *pickerdImage = [info objectForKey:UIImagePickerControllerEditedImage];
    NSDictionary *dic = [[NSDictionary alloc] initWithDictionary:[info objectForKey:UIImagePickerControllerMediaMetadata]];
    
    NSArray *arrForKeys  = [dic allKeys];
    NSArray *arrForValues  = [dic allValues];
    for (NSString *dickey in arrForKeys ) {
        NSLog(@"key %@",dickey);
    }
    for (NSString *dickey in arrForValues ) {
        NSLog(@"key %@",dickey);
    }

    // 생성된 이미지를 이미지뷰에 올려준다.
    [self.imageView setImage:pickerdImage];
    // 이미지 비율에 맞춰서 보여준다.
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    // 이미지를 보여줄때 피커는 모달에서 내려준다.
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
