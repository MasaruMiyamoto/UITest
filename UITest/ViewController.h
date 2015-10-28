//
//  ViewController.h
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, readonly)UIView *oya;

//- (void)newScroll;
- (void)addScroll :(int)distY;
- (void)scrollUpDate;
//- (void)randomAction :(id)sender;
@end

