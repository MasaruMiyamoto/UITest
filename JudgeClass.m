//
//  JudgeClass.m
//  UITest
//
//  Created by miyamoto masaru on 2015/02/27.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import "JudgeClass.h"
#import "ViewClass.h"

#define Width 520
#define Height 80
#define Size 80

@implementation JudgeClass

UILabel *Code;
UILabel *Line;

ViewClass *formula;
AppDelegate *appDelegate;

- (id)init{
    self = [super init];
    self.frame = CGRectMake(0, 0, Width, Height);
//    NSLog(@"make judgecalss");
    [self setLabel];
    [self makeClass];
    return self;
}

- (void)setPosition:(int)x :(int)y
{
    self.frame = CGRectMake( x, y, self.frame.size.width, self.frame.size.height);
//    self.backgroundColor = [UIColor cyanColor];
//    NSLog(@"set judge");
//    [self setLabel];
}

- (void)resetPosition
{
    Code.text = @"";
    Line.backgroundColor = [UIColor clearColor];
}

- (void)setLabel
{
    Code = [[UILabel alloc] init];
    Code.textAlignment = NSTextAlignmentCenter;
    Code.font = [UIFont systemFontOfSize:50];
    Code.frame = CGRectMake(0, 0, Size, Size);
    Code.adjustsFontSizeToFitWidth = YES;
    [self addSubview:Code];
    
    Line = [[UILabel alloc]init];
    Line.frame = CGRectMake(0, Code.frame.origin.y + Size, Width, 3);
    Line.backgroundColor = [UIColor blackColor];
    [self addSubview:Line];
}

- (int)judgeCheck:(ViewClass *)f1 :(ViewClass *)f2
{
    int A1,B1,E1;
    int A2,B2,E2;
    
    A1 = (int)[f1.A.text integerValue];
    B1 = (int)[[f1.Code.text stringByAppendingString:f1.B.text] integerValue];
    E1 = (int)[f1.E.text integerValue];
    
    A2 = (int)[f2.A.text integerValue];
    B2 = (int)[[f2.Code.text stringByAppendingString:f2.B.text] integerValue];
    E2 = (int)[f2.E.text integerValue];
    
    
//    NSLog(@"A1 = %d, A2 = %d",A1,A2);
//    NSLog(@"B1 = %d, B2 = %d",B1,B2);
    
    /** ２回目以降の処理のリセット **/
    [self changeTextColor:f1.A :f2.A :0];
    [self changeTextColor:f1.B :f2.B :0];
//    [self unDisplay];
    /****/
    
    if(A1 - A2 == 0){
        [self events:f1.A :f2.A :1 :NO];
        [formula changeMode:@"calculationModeX"];
        [formula setResult:B1-B2 :E1-E2];
        appDelegate.form = formula;
        return 1;
    }else if(A1 + A2 == 0){
        [self events:f1.A :f2.A :2 :YES];
        [formula changeMode:@"calculationModeX"];
        [formula setResult:B1+B2 :E1+E2];
        appDelegate.form = formula;
        return 2;
    }else if(B1 - B2 == 0){
        [self events:f1.B :f2.B :1 :NO];
        [formula changeMode:@"calculationModeY"];
        [formula setResult:A1-A2 :E1-E2];
        appDelegate.form = formula;
        return 3;
    }else if(B1 + B2 == 0){
        [self events:f1.B :f2.B :2 :YES];
        [formula changeMode:@"calculationModeY"];
        [formula setResult:A1+A2 :E1+E2];
        appDelegate.form = formula;
        return 4;
    }
    return 0;
}

- (void)writeCode:(BOOL)flag
{
//    NSLog(@"OK");
    if(flag){
        Code.text = @"+";
    }else{
        Code.text = @"-";
    }
    
    Code.text = [Code.text stringByAppendingString:@" )"];
    Line.backgroundColor = [UIColor blackColor];
}

- (void)changeTextColor :(UILabel *)a :(UILabel *)b :(int)change
{
    switch (change) {
        case 1:
            a.textColor = [UIColor redColor];
            b.textColor = [UIColor redColor];
            break;
        
        case 2:
            a.textColor = [UIColor blueColor];
            b.textColor = [UIColor blueColor];
            break;

        default:
            a.textColor = [UIColor blackColor];
            b.textColor = [UIColor blackColor];
            break;
    }
}

/***** 計算処理クラスの作成 *****/
- (void) makeClass
{
    formula = [[ViewClass alloc] initWithPosition: 80 : 115];
//    appdelegate = [[UIApplication sharedApplication] delegate];
    [self display];
}

- (void) display
{
    [self addSubview:formula];
}

- (void)unDisplay
{
    [formula removeFromSuperview];
}

/***** 処理をまとめる *****/
- (void) events :(UILabel *)f1 :(UILabel *)f2 :(int)change :(BOOL)flag
{
    [self changeTextColor:f1 :f2 :change];
    [self makeClass];
    [self writeCode:flag];
}

@end
