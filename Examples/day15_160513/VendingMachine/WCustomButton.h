//
//  WCustomButton.h
//  VendingMachine
//
//  Created by Mijeong Jeon on 5/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WCustomButtonDelegate;

@interface WCustomButton : UIView

@property (nonatomic, weak, nullable) id <WCustomButtonDelegate> delegate;

- (void)setTitle:(nullable NSString *)title;
- (void)setImageWithName:(nullable NSString *)imageName;
- (void)updateLayout;

@end

@protocol WCustomButtonDelegate <NSObject>

- (void)didSelectWCustomButton:(nullable WCustomButton *)customBtn;

@end