//
//  ToolBox.h
//  2. ToolBoxClass
//
//  Created by Mijeong Jeon on 5/10/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolBox : NSObject

- (void)number1:(NSInteger)numA;
- (void)number2:(NSInteger)numA;

- (NSInteger)sumNumbers;
- (NSInteger)subNumbers;
- (NSInteger)mulNumbers;
- (CGFloat)didNumbers;

- (CGFloat)inchToCm;
- (CGFloat)cmToInch;
- (CGFloat)m2ToPyung;
- (CGFloat)pyungToM2;
- (CGFloat)fToC;
- (CGFloat)ctoF;
- (CGFloat)dataChange;

@end
