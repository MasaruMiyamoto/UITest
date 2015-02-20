//
//  ViewClass.m
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import "ViewClass.h"

#define size 80
#define width 440
#define height 80

@implementation ViewClass

//クラス内に変数を定義
UILabel* A;
UILabel* B;
UILabel* E;
UILabel* X;
UILabel* Y;
UILabel* Equal;
UILabel* Code;

//@propertyの設定を実装
@synthesize A;
@synthesize B;
@synthesize E;
@synthesize X;
@synthesize Y;
@synthesize Equal;
@synthesize Code;



//クラスの初期化メソッド  
- (id)init
{
    self = [super init];
    self.frame = CGRectMake(0, 0, width, height);
    [self setLabel];
    [self setPosition];
    return self;
}

- (id) initWithPosition:(int)x :(int)y
{
    self = [super init];
    self.frame = CGRectMake(x, y, width, height);
    self.backgroundColor = [UIColor cyanColor];
    [self setLabel];
    [self setPosition];
    
//    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//    [appDelegate.toyBox setObject:self forKey:@"obj"];
    
    return self;
}



-(void)setLabel
{
    
    A = [[UILabel alloc] init];
    A.textAlignment = NSTextAlignmentCenter;
    A.font = [UIFont systemFontOfSize:50];
    A.frame = CGRectMake(0, 0, size, size);
    A.adjustsFontSizeToFitWidth = YES;
    A.backgroundColor = [UIColor colorWithRed:0.2 green:0.8 blue:0.5 alpha:1.0];
    A.minimumScaleFactor = 20/50;
    
    A.tag = 1;
    [self addSubview:A];
    
    
    B = [[UILabel alloc] init];
    B.textAlignment = NSTextAlignmentCenter;
    B.font = [UIFont systemFontOfSize:50];
    B.adjustsFontSizeToFitWidth = YES;
    B.backgroundColor = [UIColor colorWithRed:0.2 green:0.8 blue:0.5 alpha:1.0];
    B.minimumScaleFactor = 20/50;
    B.tag = 2;
    [self addSubview:B];
    
    E = [[UILabel alloc] init];
    E.textAlignment = NSTextAlignmentCenter;
    E.font = [UIFont systemFontOfSize:50];
    E.adjustsFontSizeToFitWidth = YES;
    E.backgroundColor = [UIColor colorWithRed:0.2 green:0.8 blue:0.5 alpha:1.0];
    E.minimumScaleFactor = 20/50;
    E.tag = 3;
    [self addSubview:E];
    
    X = [[UILabel alloc] init];
    X.textAlignment = NSTextAlignmentCenter;
    X.font = [UIFont systemFontOfSize:45];
    X.adjustsFontSizeToFitWidth = YES;
    X.minimumScaleFactor = 20/50;
    [self addSubview:X];
    
    Y = [[UILabel alloc] init];
    Y.textAlignment = NSTextAlignmentCenter;
    Y.font = [UIFont systemFontOfSize:45];
    Y.adjustsFontSizeToFitWidth = YES;
    Y.minimumScaleFactor = 20/50;
    [self addSubview:Y];
    
    Equal = [[UILabel alloc] init];
    Equal.textAlignment = NSTextAlignmentCenter;
    Equal.font = [UIFont systemFontOfSize:45];
    Equal.adjustsFontSizeToFitWidth = YES;
    Equal.minimumScaleFactor = 20/50;
    [self addSubview:Equal];
    
    Code = [[UILabel alloc] init];
    Code.textAlignment = NSTextAlignmentCenter;
    Code.font = [UIFont systemFontOfSize:45];
    Code.adjustsFontSizeToFitWidth = YES;
    Code.minimumScaleFactor = 20/50;
    Code.tag = 4;
    [self addSubview:Code];
    
    A.text = @"A";
    B.text = @"B";
    E.text = @"E";
    X.text = @"x";
    Y.text = @"y";
    Equal.text = @"=";
    Code.text = @"+";
}

-(void)setPosition
{
    A.frame = CGRectMake(0, 0, 80, 80);
    X.frame = CGRectMake(A.frame.origin.x + 60, 0, size, size);
    Code.frame = CGRectMake(X.frame.origin.x +50, 0, size, size);
    B.frame = CGRectMake(Code.frame.origin.x + 70, 0, size, size);
    Y.frame = CGRectMake(B.frame.origin.x + 60, 0, size, size);
    Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, size, size);
    E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, size, size);
//    NSLog(@"%f",E.frame.origin.x);
}

- (void)move :(int)x :(int)y
{
    self.frame = CGRectOffset(self.frame, x, y);
}
-(void)setVariable:(int)a :(int)b :(int)e
{
    A.text = [NSString stringWithFormat:@"%d",a];
    B.text = [NSString stringWithFormat:@"%d",b];
    E.text = [NSString stringWithFormat:@"%d",e];
    
}

- (void)canMoving:(NSString *)str
{
    if([str isEqualToString:@"A"]){
        A.userInteractionEnabled = YES;
    }else if([str isEqualToString:@"B"]){
        B.userInteractionEnabled = YES;
    }else if([str isEqualToString:@"AB"]){
        A.userInteractionEnabled = YES;
        B.userInteractionEnabled = YES;
    }
}

- (void)cannotMoving:(NSString *)str
{
    if([str isEqualToString:@"A"]){
        A.userInteractionEnabled = NO;
    }else if([str isEqualToString:@"B"]){
        B.userInteractionEnabled = NO;
    }else if([str isEqualToString:@"AB"]){
        A.userInteractionEnabled = NO;
        B.userInteractionEnabled = NO;
    }
}
/*****タッチイベント*****/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];

//    CGPoint location = [touch previousLocationInView:self.view];
    [super touchesBegan:touches withEvent:event];
//    NSLog(@"%ld",(long)touch.view.tag);
    
//    NSLog(@"%f,%f",location.x,location.y);
    //    if([event touchesForView:oya] != nil){
    //        NSLog(@"oya");
    //    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInView:self];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
//    NSLog(@"formal");
}
/*****ここまで*****/

@end
