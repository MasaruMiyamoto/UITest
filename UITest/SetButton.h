//
//  SetButton.h
//  UITest
//
//  Created by miyamoto masaru on 2014/11/19.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetButton : UIView

@property(nonatomic, readonly)UILabel* btn;
@property(nonatomic, readonly)UIImageView* img;
@property(nonatomic, readonly)CGPoint tmp;

- (void) move :(int)x :(int)y;
- (void) back;
- (UILabel *)labelCopy :(int)a;

@end
