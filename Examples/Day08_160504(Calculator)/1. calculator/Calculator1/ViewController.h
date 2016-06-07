//
//  ViewController.h
//  Calculator1
//
//  Created by Mijeong Jeon on 5/4/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //총 계산의 결과값 변수
    NSInteger resultNum;
    
    //연산기호를 넣어둘 버퍼
    NSString *operatorBufer;
    
    //화면에 표시되는 내용
    NSString *displayText;
}

@property(nonatomic, weak) IBOutlet UITextField *displayTextField;

@end

