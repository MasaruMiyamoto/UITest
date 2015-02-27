//
//  JudgeClass.m
//  UITest
//
//  Created by miyamoto masaru on 2015/02/27.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import "JudgeClass.h"
#import "ViewClass.h"

#define width 440
#define height 80
#define size 80


@implementation JudgeClass

UILabel *Code;
UILabel *Line;

-(id)init{
    self = [super init];
    self.frame = CGRectMake(0, 0, width, height);
    return self;
}

-(void)setPosition:(int)x :(int)y
{
    self.frame = CGRectOffset(self.frame, x, y);
    [self setLabel];
}

- (void)setLabel
{
    Code = [[UILabel alloc] init];
    Code.textAlignment = NSTextAlignmentCenter;
    Code.font = [UIFont systemFontOfSize:50];
    Code.frame = CGRectMake(0, 0, size, size);
    Code.adjustsFontSizeToFitWidth = YES;
    [self addSubview:Code];
    
    Line = [[UILabel alloc]init];
    Line.frame = CGRectMake(0, Code.frame.origin.y+size, width, 3);
    Line.backgroundColor = [UIColor blackColor];
    [self addSubview:Line];
}

- (int)judgeCheck:(ViewClass *)f1 :(ViewClass *)f2
{
    
//    NSLog(@"judge In");
    
    int A1,B1;
    int A2,B2;
    
    A1 = (int)[f1.A.text integerValue];
    B1 = (int)[[f1.Code.text stringByAppendingString:f1.B.text] integerValue];
    
    A2 = (int)[f2.A.text integerValue];
    B2 = (int)[[f2.Code.text stringByAppendingString:f1.B.text] integerValue];
    
    NSLog(@"A1 = %d, A2 = %d",A1,A2);
    
    if(A1 - A2 == 0){
        return 1;
    }else if(A1 + A2 == 0){
        return 2;
    }else if(B1 - B2 == 0){
        return 3;
    }else if(B1 + B2 == 0){
        return 4;
    }
    
    return 0;
}


@end
