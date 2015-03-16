//
//  ViewClass.m
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import "ViewClass.h"

#define size 80
#define width 440 + 100
#define height 80
#define chooseColor colorWithRed:0.2 green:0.8 blue:0.5 alpha:1.0
#define custom colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0

@implementation ViewClass

AppDelegate *appDelegate;

//クラス内に変数を定義
UILabel *A;
UILabel *B;
UILabel *E;
UILabel *X;
UILabel *Y;
UILabel *Equal;
UILabel *Code;

// 倍数の際や、式計算時の数字格納用ラベル
UILabel *Mul;

//筆算の結果を保持
int Val;
int Con;

//@propertyの設定を実装
@synthesize A;
@synthesize B;
@synthesize E;

@synthesize X;
@synthesize Y;
@synthesize Equal;
@synthesize Code;

@synthesize Mul;
@synthesize tmp;

//クラスの初期化メソッド  
- (id)init
{
    self = [super init];
    self.frame = CGRectMake(0, 0, width, height);
    self.backgroundColor = [UIColor cyanColor];
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

- (void)initMul
{
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width + 100, height);
//    A.tag = 0;
    [self mulMode];
    [self setMulPosition];
    
}

-(void)setLabel
{
    A = [[UILabel alloc] init];
    A.textAlignment = NSTextAlignmentCenter;
    A.font = [UIFont systemFontOfSize:50];
    A.frame = CGRectMake(0, 0, size, size);
    A.adjustsFontSizeToFitWidth = YES;
    A.minimumScaleFactor = 20/50;
    [self addSubview:A];
    
    B = [[UILabel alloc] init];
    B.textAlignment = NSTextAlignmentCenter;
    B.font = [UIFont systemFontOfSize:50];
    B.adjustsFontSizeToFitWidth = YES;
    B.minimumScaleFactor = 20/50;
    [self addSubview:B];
    
    E = [[UILabel alloc] init];
    E.textAlignment = NSTextAlignmentCenter;
    E.font = [UIFont systemFontOfSize:50];
    E.adjustsFontSizeToFitWidth = YES;
    E.minimumScaleFactor = 20/50;
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
    [self addSubview:Code];
    
    A.text = @"A";
    B.text = @"B";
    E.text = @"E";
    X.text = @"x";
    Y.text = @"y";
    Equal.text = @"=";
    Code.text = @"+";
}

/***** モード変更 *****/

//外部参照による選択
-(void)chengeMode:(int)mode
{
    switch (mode) {
        case 1:
            [self enterMode];
            break;
            
        case 2:
            [self initMul];
            break;
            
        case 31:
            [self culMode:YES];
            break;
            
        case 32:
            [self culMode:NO];
            break;
            
        default:
            NSLog(@"No");
            break;
    }
}

//入力モード
- (void)enterMode
{
    A.tag = 1;
    B.tag = 2;
    E.tag = 3;
    Code.tag = 4;
    
    A.backgroundColor = [UIColor chooseColor];
    B.backgroundColor = [UIColor chooseColor];
    E.backgroundColor = [UIColor chooseColor];
    
}


//倍数モード
-(void)mulMode
{
    Mul = [[UILabel alloc] init];
    Mul.textAlignment = NSTextAlignmentCenter;
    Mul.font = [UIFont systemFontOfSize:50];
    Mul.adjustsFontSizeToFitWidth = YES;
    Mul.minimumScaleFactor = 20/50;
    Mul.text = @"";
    
    A.tag = 0;
    Mul.tag = 5;
    
    Mul.backgroundColor = [UIColor chooseColor];
    
    [self addSubview:Mul];
}

//筆算モード
- (void) culMode :(BOOL)chenge
{
    A.text = @"";
    Code.text = @"";
    B.text = @"";
    E.text = @"";
    
    E.backgroundColor = [UIColor chooseColor];
    E.tag = 3;
    
    appDelegate = [[UIApplication sharedApplication] delegate];
//    [appDelegate initToyBox];
//    [appDelegate.toyBox setObject:self forKey:@"formula"];
    
    
    if(chenge){
        //yが残る
        X.text = @"";
        B.backgroundColor = [UIColor chooseColor];
        B.tag = 5;
    }else{
        //xが残る
        Y.text = @"";
        A.backgroundColor = [UIColor chooseColor];
        A.tag = 1;
    }
    
    NSMutableArray *f = [NSMutableArray arrayWithObjects:self.A, self.Code, self.B, self.E, nil];
    [appDelegate.toyBox setObject:f forKey:@"obj"];
    
//    NSMutableArray *list = [appDelegate.toyBox objectForKey:@"list"];
//    [list addObject:@"obj"];
    
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
//    [appDelegate.toyBox setObject:list forKey:@"list"];
    
    [appDelegate.toyBox setObject:list forKey:@"list"];
    [appDelegate.Button setUpdateMode: @"upDate2"];
//    appDelegate.formula = self;
    NSLog(@"cul");
    
}

/**********/


-(void)setMulPosition
{
    Mul.frame = CGRectMake(E.frame.origin.x + 100, 0, size, size);
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
    _ValA = a;
    _ValB = b;
    _ValE = e;
    
    A.text = [NSString stringWithFormat:@"%d",a];
    E.text = [NSString stringWithFormat:@"%d",e];
    
    if(b>0){
        Code.text = @"+";
        B.text = [NSString stringWithFormat:@"%d",b];
    }else if(b<0){
        Code.text = @"-";
        B.text = [NSString stringWithFormat:@"%d",-b];
    }
    
//    NSLog(@"a = %d, b = %d, e = %d",_ValA,_ValB,_ValE);
}

- (void) setResult:(int)val :(int)con
{
    Val = val;
    Con = con;
//    NSLog(@"val = %d, con = %d",Val,Con);
}

- (void)canMoving:(NSString *)str
{
    if([str isEqualToString:@"A"]){
        A.userInteractionEnabled = YES;
        A.backgroundColor = [UIColor redColor];
    }else if([str isEqualToString:@"B"]){
        B.userInteractionEnabled = YES;
        B.backgroundColor = [UIColor redColor];
    }else if([str isEqualToString:@"AB"]){
        A.userInteractionEnabled = YES;
        B.userInteractionEnabled = YES;
        A.backgroundColor = [UIColor redColor];
        B.backgroundColor = [UIColor redColor];
    }
}

- (void)cannotMoving:(NSString *)str
{
    if([str isEqualToString:@"A"]){
        A.userInteractionEnabled = NO;
        A.backgroundColor = [UIColor clearColor];
    }else if([str isEqualToString:@"B"]){
        B.userInteractionEnabled = NO;
        B.backgroundColor = [UIColor clearColor];
    }else if([str isEqualToString:@"AB"]){
        A.userInteractionEnabled = NO;
        B.userInteractionEnabled = NO;
        A.backgroundColor = [UIColor clearColor];
        B.backgroundColor = [UIColor clearColor];
    }
}


/*****タッチイベント*****/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch previousLocationInView:self];
    [super touchesBegan:touches withEvent:event];
    NSLog(@"tag = %ld",(long)touch.view.tag);
    switch (touch.view.tag) {
        case 1:
            A.center = location;
            self.Code.text = @"÷";
            self.B.backgroundColor = [UIColor chooseColor];
            break;
        case 2:
            break;
            
        default:
            break;
    }
//    NSLog(@"began");
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    [super touchesMoved:touches withEvent:event];
    
    switch (touch.view.tag) {
        case 1:
            A.center = location;
            break;
        case 2:
            B.center = location;
            break;
        default:
            break;
    }
//    NSLog(@"move");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInView:self];
    
    switch (touch.view.tag) {
        case 1:
            if (CGRectContainsPoint(self.B.frame, self.A.center)) {
                
                self.B.text = self.A.text;
                self.A.text = @"";
                
                if ([self.B.text hasPrefix:@"-"]) {
                    self.B.text = [@"(" stringByAppendingString:self.B.text];
                    self.B.text = [self.B.text stringByAppendingString:@")"];
                    self.B.frame = CGRectMake(self.B.frame.origin.x, self.B.frame.origin.y, 100, size);
                    self.B.textAlignment = NSTextAlignmentLeft;
                }
                
                self.A.backgroundColor = [UIColor clearColor];
                self.B.backgroundColor = [UIColor clearColor];
                
                self.Y.text = @"=";
                self.Y.frame = CGRectMake(self.B.frame.origin.x + 70, 0, size, size);
                [self mulMode];
                self.Mul.frame = CGRectOffset(self.Y.frame, 70, 0);
                
            }else{
                [self back:A];
                self.Code.text = @"";
                self.B.backgroundColor = [UIColor clearColor];
            }
            break;
        case 2:
            break;
            
        default:
            break;
    }
//    NSLog(@"formal");
}
/*****ここまで*****/

-(BOOL)checkSum
{
    int a = (int)[A.text integerValue];
    int b = (int)[B.text integerValue];
    int e = (int)[E.text integerValue];
    
    if (e == Con) {
        if(a == Val)
            return YES;
        else if(b == Val)
            return YES;
    }
    return NO;
}

/***** 更新処理 *****/
//係数の乗法
-(void)upDate
{
    
//    NSLog(@"update");
//    NSLog(@"valA = %d",_ValA);
    int mul;
    
    if([Mul.text isEqualToString:@""]){
        mul = 1;
    }else if([Mul.text isEqualToString:@"-"]){
        mul = -1;
    }else{
        mul = (int)[Mul.text integerValue];
    }
    
    A.text = [NSString stringWithFormat:@"%d",_ValA*mul];
    E.text = [NSString stringWithFormat:@"%d",_ValE*mul];
    
    if(_ValB*mul >= 0){
        Code.text = @"+";
        B.text = [NSString stringWithFormat:@"%d",_ValB*mul];
    }else if(_ValB*mul < 0){
        Code.text = @"-";
        B.text = [NSString stringWithFormat:@"%d",-_ValB*mul];
    }
    
}

- (void)upDate2
{
    if([self checkSum]){
        NSLog(@"checkSum");
//        appDelegate.formulaR = self;
    }
}

- (ViewClass *)copyWithPosition: (ViewClass *)origin :(int)x :(int)y
{
    ViewClass *Copy = [[ViewClass alloc] init];
//    Copy = [Copy initWithFrame:origin.frame];
    Copy.A.text = origin.A.text;
    Copy.B.text = origin.B.text;
    Copy.E.text = origin.E.text;
    
    Copy.X.text = origin.X.text;
    Copy.Y.text = origin.Y.text;
    
    Copy.Code.text = origin.Code.text;
    Copy.Equal.text = origin.Equal.text;
    
    Copy.A.backgroundColor = origin.A.backgroundColor;
    Copy.B.backgroundColor = origin.B.backgroundColor;
    Copy.E.backgroundColor = origin.E.backgroundColor;
    
    [Copy move: x:y];
    return Copy;
}
/*****  *****/

- (void)levelingLabel:(ViewClass *)mine
{
//    NSLog(@"leveling");
    if([mine.A.text isEqualToString:@""]){
        NSLog(@"enter");
        
        mine.A.text = mine.B.text;
        mine.B.text = @"";
//        mine.B.backgroundColor = [UIColor clearColor];
        mine.X.text = mine.Y.text;
        mine.Y.text = @"";
        
    }
    
    [self bringSubviewToFront:mine.A];
    mine.Equal.frame = CGRectOffset(mine.Equal.frame, -180, 0);
    mine.E.frame = CGRectOffset(mine.E.frame, -180, 0);
    mine.E.backgroundColor = [UIColor clearColor];
    [self canMoving:@"A"];
    A.tag = 1;
    [self setBack:A];
    
    
    // 計算領域の生成
    mine.Code.frame = CGRectOffset(mine.E.frame, 70, 0);
    mine.B.frame = CGRectOffset(mine.Code.frame, 70, 0);
    mine.B.backgroundColor = [UIColor clearColor];
    NSLog(@" code = %lf", mine.Code.frame.origin.x);
//    NSLog(@" mul = %lf", mine.Mul.frame.origin.x);
    
}

- (void)setBack:(UIView *)obj
{
    //    tmp = CGPointMake(self.frame.origin.x + obj.center.x, self.frame.origin.y + obj.center.y);
    
    tmp = CGPointMake(obj.center.x, obj.center.y);
    
    //    NSLog(@"%f",self.frame.origin.x);
}

- (void)back:(UILabel *)lbl
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    lbl.center = tmp;
    [UIView commitAnimations];
}
@end
