//
//  main.m
//  StringConvert
//
//  Created by Mijeong Jeon on 5/23/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 초성 18개
        // 중성 20개
        // 종성 27개
        
        
        NSArray *chosungs = @[@"ㄱ", @"ㄲ", @"ㄴ", @"ㄷ", @"ㄸ", @"ㄹ", @"ㅁ", @"ㅂ", @"ㅃ", @"ㅅ", @"ㅆ", @"ㅇ", @"ㅈ", @"ㅊ",@"ㅉㅉ", @"ㅋ", @"ㅌ",@"ㅍ", @"ㅎ"];
        NSString *name  = @"ㅂㄱㅏa많k+ㅇ ㅏㅙ10  고프ㅎㅎ~";
        NSLog(@"%@\n",name);
        NSMutableString *result = [NSMutableString string];
        for (NSUInteger i = 0; i<[name length]; i++) {
            unichar c = [name characterAtIndex:i];
            if (0xAC00 <= c && c <= 0xD7AF) {
            NSLog(@"%tu %C %zd", i, c, (NSInteger)c);
            NSInteger x = (NSInteger)c - 0xAC00;
            NSLog(@"%zd 번째", x);
            NSInteger jong = x % 28;
            x = x - jong;
            x = x / 28;
            NSInteger jung = x % 21;
            x-=jung;
            NSInteger cho = x / 21;
            NSString *chosung = chosungs[cho];
            NSLog(@"%C %zd번째 초성 %@",c, cho, chosung);
            [result appendString:chosung];
            } else {
                NSString *letter = [name substringWithRange:NSMakeRange(i, 1)];
                NSLog(@"에외 : %@",letter);
                NSUInteger index = [chosungs indexOfObject:letter];
                NSLog(@"인덱스: %tu",index);
                if (index != NSNotFound) {
                    [result appendString:letter];
                }
            }
        }
        NSString *converted = result;
        converted = [converted stringByReplacingOccurrencesOfString:@"ㄱㄱ" withString:@"ㄲ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㄷㄷ" withString:@"ㄸ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㅂㅂ" withString:@"ㅃ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㅅㅅ" withString:@"ㅉ"];
        converted = [converted stringByReplacingOccurrencesOfString:@"ㅈㅈ" withString:@"ㅉ"];
        
        NSLog(@"%@", result);
        NSLog(@"%@", converted);

    }
    return 0;
}
