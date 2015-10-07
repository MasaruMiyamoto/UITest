//
//  AnswerClass.h
//  UITest
//
//  Created by miyamoto masaru on 2015/10/07.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerClass : UIView

- (id) initWithPosition:(int)x :(int)y;
- (void)setXY :(int)X :(int)Y;
- (void)selectMode :(NSString *)mode;

@end
