//
//  SelectButtons.h
//  UITest
//
//  Created by miyamoto masaru on 2015/02/19.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SelectButtons : UIView

@property(nonatomic, readonly)UIButton *Sel1;
@property(nonatomic, readonly)UIButton *Sel2;

- (id) initWithPosition:(int)x :(int)y;
- (void)btnPushed:(id)mainView;
- (void)dontSelects:(id)mainView;
- (void)randomAction :(id)mainView;
- (BOOL)isMode;
@end
