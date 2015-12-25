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

//UILabel *Code;
UILabel *Line;

bool EnterFlag;
bool PLflag;

int A1,B1,E1;
int A2,B2,E2;

ViewClass *Code;
ViewClass *formula;
AppDelegate *appDelegate;

- (id)init{
    self = [super init];
    self.frame = CGRectMake(0, 0, Width, Height);
    EnterFlag = false;
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
    Code.alpha = 0;
    Line.alpha = 0;
}

- (void)setLabel
{
    Code = [[ViewClass alloc] init];
//    Code.textAlignment = NSTextAlignmentCenter;
//    Code.font = [UIFont systemFontOfSize:50];
    Code.frame = CGRectMake(0, 0, Size, Size);
    Code.A.frame = CGRectMake(0, 0, Size, Size);
    Code.A.text = @"";
//    Code.adjustsFontSizeToFitWidth = YES;
    Code.A.textColor = [UIColor whiteChokeColor];
    Code.A.tag = 10;
    [Code addSubview:Code.A];
    [self addSubview:Code];
    
    Line = [[UILabel alloc]init];
    Line.frame = CGRectMake(0, Code.frame.origin.y + Size + 5, Width, 3);
    Line.backgroundColor = [UIColor whiteChokeColor];
    [self addSubview:Line];
}

- (BOOL)enterCheck
{
    return EnterFlag;
}

- (int)judgeCheck:(ViewClass *)f1 :(ViewClass *)f2
{

    
//    A1 = (int)[f1.A.text integerValue];
//    B1 = (int)[[f1.Code.text stringByAppendingString:f1.B.text] integerValue];
//    E1 = (int)[f1.E.text integerValue];

//    NSLog(@"%@ from jadgeClass",[f1.Code.text stringByAppendingString:f1.B.text]);
    
    A1 = [CommonMethod inputInteger:f1.A.text :true];
    B1 = [CommonMethod inputInteger:[f1.Code.text stringByAppendingString:f1.B.text] :true];
    E1 = [CommonMethod inputInteger:f1.E.text :false];
    
    
//    A2 = (int)[f2.A.text integerValue];
//    B2 = (int)[[f2.Code.text stringByAppendingString:f2.B.text] integerValue];
//    E2 = (int)[f2.E.text integerValue];
    
    A2 = [CommonMethod inputInteger:f2.A.text :true];
    B2 = [CommonMethod inputInteger:[f2.Code.text stringByAppendingString:f2.B.text] :true];
    E2 = [CommonMethod inputInteger:f2.E.text :false];
    
//    NSLog(@"A1 = %d, A2 = %d",A1,A2);
//    NSLog(@"B1 = %d, B2 = %d",B1,B2);
    
    /** ２回目以降の処理のリセット **/
    [self changeTextColor:f1.A :f2.A :0];
    [self changeTextColor:f1.B :f2.B :0];
//    [self unDisplay];
    /****/
    
    if(A1 - A2 == 0){
        [self events:f1.A :f2.A :1 :NO];
        return 1;
    }else if(A1 + A2 == 0){
        [self events:f1.A :f2.A :2 :YES];
        return 2;
    }else if(B1 - B2 == 0){
        [self events:f1.B :f2.B :1 :NO];
        return 3;
    }else if(B1 + B2 == 0){
        [self events:f1.B :f2.B :2 :YES];
        return 4;
    }
    
    return 0;
}


- (void)writeCode:(BOOL)flag
{
//    NSLog(@"OK");
//    if(flag){
//        Code.text = @"+";
//    }else{
//        Code.text = @"-";
//    }
//    
//    Code.text = [Code.text stringByAppendingString:@" )"];
    
    PLflag = flag;
    
    //おもちゃ箱への登録
    NSMutableArray *f = [NSMutableArray arrayWithObjects:Code.A, nil];
    [appDelegate.toyBox setObject:f forKey:@"obj"];
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
    [appDelegate.toyBox setObject:list forKey:@"list"];
    
    appDelegate.form = Code;
    
    [CommonMethod setBorder:Code.A];
    
    Code.alpha = 1.0;
    Line.alpha = 1.0;
    
    EnterFlag = true;
}



- (void)changeTextColor :(UILabel *)a :(UILabel *)b :(int)change
{
    switch (change) {
        case 1:
            a.textColor = [UIColor pinkChokeColor];
            b.textColor = [UIColor pinkChokeColor];
            break;
        
        case 2:
            a.textColor = [UIColor blueChokeColor];
            b.textColor = [UIColor blueChokeColor];
            break;

        default:
            a.textColor = [UIColor whiteChokeColor];
            b.textColor = [UIColor whiteChokeColor];
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


/*********************ここから後半処理***************************/
- (BOOL) checkPL
{
    if ([Code.A.text isEqualToString:@"+"] && PLflag) {
        return true;
    }
    else if([Code.A.text isEqualToString:@"-"] && !PLflag){
        return true;
    }
    
    return false;
}

- (void) makeCulClass
{
    [CommonMethod resetBorder:Code.A];
    
    if(A1 - A2 == 0){
        [formula setResult:B1-B2 :E1-E2];
        [formula changeMode:@"calculationModeX"];
        appDelegate.form = formula;
    }else if(A1 + A2 == 0){
        [formula setResult:B1+B2 :E1+E2];
        [formula changeMode:@"calculationModeX"];
        appDelegate.form = formula;
    }else if(B1 - B2 == 0){
        [formula setResult:A1-A2 :E1-E2];
        [formula changeMode:@"calculationModeY"];
        appDelegate.form = formula;
    }else if(B1 + B2 == 0){
        [formula setResult:A1+A2 :E1+E2];
        [formula changeMode:@"calculationModeY"];
        appDelegate.form = formula;
    }
    
    [AnimationClass fadeIn:formula :0];
    
    Code.A.text = [Code.A.text stringByAppendingString:@" )"];
}
@end
