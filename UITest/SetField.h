//
//  FirstSet.h
//  UITest
//
//  Created by miyamoto masaru on 2015/04/16.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ViewClass.h"
@interface SetField : NSObject

- (void)firstSet :(UIView *)oya;
- (void)secondSet :(UIView *)oya;
- (void)thirdSet :(UIView *)oya :(ViewClass *)view;
@end
