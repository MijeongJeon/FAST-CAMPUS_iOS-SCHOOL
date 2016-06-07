//
//  main.m
//  2. ToolBoxClass
//
//  Created by Mijeong Jeon on 5/10/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToolBox.h"

int main(int argc, const char * argv[]) {
    ToolBox *tbClass = [[ToolBox alloc] init];
    NSInteger num1 = 12;
    NSInteger num2 = 19;
    
    [tbClass number1:num1];
    [tbClass number2:num2];

    NSLog(@"%ld + %ld = %ld\n", num1, num2,[tbClass sumNumbers]);
    NSLog(@"%ld - %ld = %ld\n", num1, num2,[tbClass subNumbers]);
    NSLog(@"%ld * %ld = %ld\n", num1, num2,[tbClass mulNumbers]);
    NSLog(@"%ld / %ld = %lf\n", num1, num2,[tbClass didNumbers]);

    NSLog(@"%ldinch는 %0.2lfcm입니다.\n", num1,[tbClass inchToCm]);
    NSLog(@"%ldcm는 %0.2lfinch입니다.\n", num1,[tbClass cmToInch]);

    NSLog(@"%ldm2은 %0.2lf평입니다.\n", num1,[tbClass m2ToPyung]);
    NSLog(@"%ld평은 %0.2lfm2입니다.\n", num1,[tbClass pyungToM2]);

    NSLog(@"%ld섭씨는 %0.2lf화씨입니다.\n", num1,[tbClass ctoF]);
    NSLog(@"%ld화씨는 %0.2lf섭씨입니다.\n", num1,[tbClass fToC]);

    NSLog(@"%ldKM는 %0.2lfMB입니다.\n", num1,[tbClass dataChange]);

    return 0;
}
