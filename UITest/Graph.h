//
//  Graph.h
//  UITest
//
//  Created by miyamoto masaru on 2016/01/25.
//  Copyright (c) 2016年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreateField.h"
#import "ViewClass.h"
#import "AnswerClass.h"
#import "AnimationClass.h"

@interface Graph : UIView

- (void)initFormula :(ViewClass *)f1 :(ViewClass *)f2;
- (void)setPoint :(int)a :(int)b :(int)c :(int)x :(int)y :(int)z;
- (void) getAns :(int)x :(int)y;
- (void) animationGraph;
@end
