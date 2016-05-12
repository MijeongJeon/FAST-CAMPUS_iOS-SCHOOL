//
//  ToolBox.m
//  2. ToolBoxClass
//
//  Created by Mijeong Jeon on 5/10/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ToolBox.h"

@implementation ToolBox
{
     NSInteger num1;
     NSInteger num2;
}

// 값 받기 메소드
-(void)number1:(NSInteger)numA{
    num1 = numA;
}

-(void)number2:(NSInteger)numA{
    num2 = numA;
}

//************* 산술메소드 ***************//
// 1. 더하기 메소드
-(NSInteger)sumNumbers{
    return num1 + num2;
}
// 2. 더하기 메소드
-(NSInteger)subNumbers{
    return num1 - num2;
}
// 3. 더하기 메소드
-(NSInteger)mulNumbers{
    return  num1 * num2;
}
// 4. 더하기 메소드
-(CGFloat)didNumbers{
    return (CGFloat)((NSInteger)((((CGFloat)num1/(CGFloat)num2)+0.005)*100))/100;
}


//************* 치환전환 메소드 ***************//
// 1. inch to cm, cm to inch
-(CGFloat)inchToCm{
    return num1 * 2.54;
}
-(CGFloat)cmToInch{
    return num1 / 2.54;
}

// 2. m2 to 평, 평 to m2
-(CGFloat)m2ToPyung{
    return num1 / 3.306;
}
-(CGFloat)pyungToM2{
    return num1 * 3.306;
}

// 3. FtoC, CtoF
-(CGFloat)fToC{
    return (num1 - 32)*5/9;
}
-(CGFloat)ctoF{
    return num1 *9 /5 + 32;
}

// 4. data
-(CGFloat)dataChange{
    return num1 * 1000;
}


@end
