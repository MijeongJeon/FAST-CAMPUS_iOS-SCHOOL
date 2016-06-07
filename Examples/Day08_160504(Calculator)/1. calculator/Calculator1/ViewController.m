//
//  ViewController.m
//  Calculator1
//
//  Created by Mijeong Jeon on 5/4/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    // 데이터 초기화
    [self initData];
    
}

// 데이터 초기화 함수
- (void)initData {
    resultNum = 0;
    operatorBufer = @"";
    displayText = @"";
    
    [self.displayTextField setText:[NSString stringWithFormat:@"%zd",resultNum]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchUpIndsideNumberBtn:(id)sender {
    NSString *numberStr = ((UIButton *)sender).titleLabel.text;
    displayText = [displayText stringByAppendingString:numberStr];
    
    [self.displayTextField setText:displayText];
}

- (IBAction)onTouchUpIndsidenumberBtn:(UIButton *)sender {
    NSString * numStr = ((UIButton*)sender).titleLabel.text;
    displayText=[displayText stringByAppendingString:numStr];
    
    [self.displayTextField setText:displayText];
}

- (IBAction)onTouchUpIndsideOperationBtn:(UIButton *)sender {
    
    if(displayText.length>0) {
        
        //기존에 display에 있는 숫자를 결과에 추가한다
        [self opertingWithSecondNum:displayText.integerValue];
        
        
        //result를 텍스트로 변경해서 표시
        [self.displayTextField setText:[NSString stringWithFormat:@"%zd",resultNum]];
        //display지워준다
        displayText=@"";
        //오퍼레이션에 버퍼를 넣는다.
        operatorBufer = sender.titleLabel.text;
    } else {
        //연산기호 변경
        if(operatorBufer.length !=0) {
            operatorBufer = sender.titleLabel.text;
        }
    }
}

- (IBAction)onTouchUpIndsideResultBtn:(UIButton *)sender {
    
    if(displayText.length>0) {
        //기존에 display에 있는 숫자를 결과에 추가한다.
        [self opertingWithSecondNum:displayText.integerValue];
        
        [self .displayTextField setText:([NSString stringWithFormat:@"%zd",resultNum])];
    }
}

- (IBAction)onTouchUpIndsideCancelBtn:(id)sender {
    
    [self initData];
}



- (void)opertingWithSecondNum:(NSInteger)num {
    if(operatorBufer.length>0){
        if([operatorBufer isEqualToString:@"+"])
        {//더하기 연산
            [self operationAdd:num];
        } else if ([operatorBufer isEqualToString:@"-"])
        {//빼기 연산
            [self operationSub:num];
        } else if ([operatorBufer isEqualToString:@"x"])
        {//곱셈 연산
            [self operationMul:num];
        } else if ([operatorBufer isEqualToString:@"/"])
        {//나누기연산
            [self operationDid:num];
        } else
        {
            NSLog(@"error");
        }
    } else
        resultNum = num;
    
}



// 더하기 연산
- (void)operationAdd:(NSInteger)secondNum {
    resultNum = resultNum + secondNum;
}

// 빼기 연산
- (void)operationSub:(NSInteger)secondNum {
    resultNum = resultNum - secondNum;
}

// 곱하기 연산
- (void)operationMul:(NSInteger)secondNum {
    resultNum = resultNum * secondNum;
}

// 나누기 연산
- (void)operationDid:(NSInteger)secondNum {
    resultNum = resultNum / secondNum;
}

@end
