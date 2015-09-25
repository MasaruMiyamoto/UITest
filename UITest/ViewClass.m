//
//  ViewClass.m
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import "ViewClass.h"

//switch文にNSString型を入力可能
#define CASE(str) if ([__s__ isEqualToString:(str)])
#define SWITCH(s) for (NSString *__s__ = (s); __s__; __s__ = nil)
#define DEFAULT

#define Size 80
#define Width 440 + 100
#define Height 80
#define intoColor colorWithRed:0.2 green:0.8 blue:0.5 alpha:1.0
#define Custom colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0

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

//代入するための土台
UIView *Label;
int LabelPosition;
int LabelValue;

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
    self.frame = CGRectMake(0, 0, Width, Height);
    self.backgroundColor = [UIColor cyanColor];
    [self setLabel];
    return self;
}

- (id) initWithPosition:(int)x :(int)y
{
    self = [super init];
    self.frame = CGRectMake(x, y, Width, Height);
    self.backgroundColor = [UIColor cyanColor];
    [self setLabel];
    return self;
}

//- (void)initMul
//{
////    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width + 100, height);
////    A.tag = 0;
//    [self mulMode];
//    [self setMulPosition];
//    
//}

//各ラベルの生成
-(void)setLabel
{
    
    A = [[UILabel alloc] init];
    A.textAlignment = NSTextAlignmentCenter;
    A.font = [UIFont systemFontOfSize:50];
    A.frame = CGRectMake(0, 0, Size, Size);
    A.adjustsFontSizeToFitWidth = YES;
    A.minimumScaleFactor = 20/50;
    
    B = [[UILabel alloc] init];
    B.textAlignment = NSTextAlignmentCenter;
    B.font = [UIFont systemFontOfSize:50];
    B.adjustsFontSizeToFitWidth = YES;
    B.minimumScaleFactor = 20/50;
    
    E = [[UILabel alloc] init];
    E.textAlignment = NSTextAlignmentCenter;
    E.font = [UIFont systemFontOfSize:50];
    E.adjustsFontSizeToFitWidth = YES;
    E.minimumScaleFactor = 20/50;
    
    X = [[UILabel alloc] init];
    X.textAlignment = NSTextAlignmentCenter;
    X.font = [UIFont systemFontOfSize:45];
    X.adjustsFontSizeToFitWidth = YES;
    X.minimumScaleFactor = 20/50;
    
    Y = [[UILabel alloc] init];
    Y.textAlignment = NSTextAlignmentCenter;
    Y.font = [UIFont systemFontOfSize:45];
    Y.adjustsFontSizeToFitWidth = YES;
    Y.minimumScaleFactor = 20/50;
    
    Equal = [[UILabel alloc] init];
    Equal.textAlignment = NSTextAlignmentCenter;
    Equal.font = [UIFont systemFontOfSize:45];
    Equal.adjustsFontSizeToFitWidth = YES;
    Equal.minimumScaleFactor = 20/50;
    
    Code = [[UILabel alloc] init];
    Code.textAlignment = NSTextAlignmentCenter;
    Code.font = [UIFont systemFontOfSize:45];
    Code.adjustsFontSizeToFitWidth = YES;
    Code.minimumScaleFactor = 20/50;
    
    Mul = [[UILabel alloc] init];
    Mul.textAlignment = NSTextAlignmentCenter;
    Mul.font = [UIFont systemFontOfSize:50];
    Mul.adjustsFontSizeToFitWidth = YES;
    Mul.minimumScaleFactor = 20/50;
    Mul.text = @"";
    
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
-(void)changeMode:(NSString *)mode
{
    SWITCH (mode) {
        
        CASE (@"standardMode"){
            [self standardMode]; //1
            break;
        }
        CASE (@"uniformMode"){
            [self uniformMode];  //2
            break;
        }
        CASE (@"calculationModeX"){
            [self calculationMode:YES];  //3-1
            break;
        }
        CASE (@"calculationModeY"){
            [self calculationMode:NO];  //3-2
            break;
        }
        
        CASE (@"divisionLabel"){  //4-1
            [self divisionLabel];
            break;
        }
        
        CASE (@"divisionMode"){
            [self divisionMode];  //4-2
            break;
        }
        
        CASE (@"solutionMode"){
            [self solutionMode];  //5
            break;
        }
        CASE (@"substitutionMode"){
            [self substitutionMode];  //6
            break;
        }
        CASE (@"receptionMode"){
            [self receptionMode];  //7
            break;
        }
        CASE (@"transPositionMode"){
            [self transPositionMode];  //8
            break;
        }
        DEFAULT {
            NSLog(@"throght default");
            break;
        }
    }
}
/**********/


/**********改良型**********/
//ラベルの初期設定とself.frameの配置は終わっているので
//ラベル配置をモードによって設定

//①標準モード
- (void)standardMode
{
    NSLog(@"①StandardMode");
    //Ax+By=E
    
    A.frame = CGRectMake(0, 0, Size, Size);
    X.frame = CGRectMake(A.frame.origin.x + 60, 0, Size, Size);
    Code.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
    B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
    Y.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
    Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, Size, Size);
    E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);

//    A.tag = 1;
//    B.tag = 2;
//    E.tag = 3;
//    Code.tag = 4;
    
//    A.backgroundColor = [UIColor intoColor];
//    B.backgroundColor = [UIColor intoColor];
//    E.backgroundColor = [UIColor intoColor];

    //入力受付
    [self receiveValue:A :1];
    [self receiveValue:B :22];
    [self receiveValue:E :3];
    [self receiveValue:Code :4];
    
    [self addSubview:A];
    [self addSubview:B];
    [self addSubview:E];
    [self addSubview:X];
    [self addSubview:Y];
    [self addSubview:Equal];
    [self addSubview:Code];

}

//②係数合わせモード
- (void)uniformMode
{
    NSLog(@"②UniformMode");
    
    A.frame = CGRectMake(0, 0, Size, Size);
    X.frame = CGRectMake(A.frame.origin.x + 60, 0, Size, Size);
    Code.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
    B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
    Y.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
    Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, Size, Size);
    E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
    Mul.frame = CGRectMake(E.frame.origin.x + 100, 0, Size, Size);
    
//    Mul.tag = 1;
//    Mul.backgroundColor = [UIColor intoColor];

    //入力受付
    [self receiveValue:Mul :5];
    
    [self addSubview:A];
    [self addSubview:B];
    [self addSubview:E];
    [self addSubview:X];
    [self addSubview:Y];
    [self addSubview:Equal];
    [self addSubview:Code];
    [self addSubview:Mul];
}

//③筆算モード
- (void)calculationMode :(BOOL)Change
{
    NSLog(@"③CalculationMode");
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    if(Change){
        //yが残る
        //By = E
        
        B.text = @"";
        E.text = @"";
        
        B.frame = CGRectMake(110 + 70, 0, Size, Size);
        Y.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
        Equal.frame = CGRectMake(240 + 50, 0, Size, Size);
        E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        
//        B.backgroundColor = [UIColor intoColor];
//        E.backgroundColor = [UIColor intoColor];
        
//        B.tag = 1;
//        E.tag = 3;
        
        //入力受付
        [self receiveValue:B :2];
        [self receiveValue:E :3];
        
        [self addSubview:B];
        [self addSubview:Y];
        [self addSubview:Equal];
        [self addSubview:E];
        
        //数値入力に必要
        A.text = @"";
        A.frame = CGRectMake(0, 0, 80, 80);
        [self addSubview:A];
        
        NSMutableArray *f = [NSMutableArray arrayWithObjects:A, B, E, nil];
        [appDelegate.toyBox setObject:f forKey:@"obj"];
        
        NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
        
        [appDelegate.toyBox setObject:list forKey:@"list"];
        [appDelegate setUpdateMode: @"upDate2"];
        
    }else{
        //xが残る
        //Ax = E
        
        A.text = @"";
        E.text = @"";
        
        A.frame = CGRectMake(0, 0, 80, 80);
        X.frame = CGRectMake(A.frame.origin.x + 60, 0, Size, Size);
        Equal.frame = CGRectMake(240 + 50, 0, Size, Size);
        E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        
//        A.backgroundColor = [UIColor intoColor];
//        E.backgroundColor = [UIColor intoColor];
        
//        A.tag = 1;
//        E.tag = 3;
        
        //入力受付
        [self receiveValue:A :1];
        [self receiveValue:E :3];
        
        [self addSubview:A];
        [self addSubview:X];
        [self addSubview:Equal];
        [self addSubview:E];
        
        NSMutableArray *f = [NSMutableArray arrayWithObjects:A, E, nil];
        [appDelegate.toyBox setObject:f forKey:@"obj"];
        
        NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
        
        [appDelegate.toyBox setObject:list forKey:@"list"];
        [appDelegate setUpdateMode: @"upDate2"];
    }
    
}

//④-1 割り算準備モード
- (void)divisionLabel
{
    NSLog(@"④-1DivisionLabel");
    
    //ラベル値の設定
    if([A.text isEqualToString:@""]){
        //        NSLog(@"enter");
        A.text = B.text;
        X.text = Y.text;
    }
    Code.text = @"÷";
    Y.text = @"=";
    
    //入力部分の設定
//    B.backgroundColor = [UIColor intoColor];
//    Mul.backgroundColor = [UIColor intoColor];
    
    //入力受付
    [self receiveValue:B :2];
    [self receiveValue:Mul :5];
    
    //全体のラベル設定
    A.frame = CGRectMake(0, 0, Size, Size);
    X.frame = CGRectMake(A.frame.origin.x + 60, 0, Size, Size);
    Equal.frame = CGRectMake(X.frame.origin.x + 50, 0, Size, Size);
    E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
    Code.frame = CGRectMake(E.frame.origin.x + 70, 0, Size, Size);
    B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
    Y.frame = CGRectMake(B.frame.origin.x + 70, 0, Size, Size);
    Mul.frame = CGRectMake(Y.frame.origin.x + 70, 0, Size, Size);
    
    //移動アニメーション対応設定
    [self canMoving:@"A"];
    [self setBack:A];
    
    //    NSLog(@" code = %lf", mine.Code.frame.origin.x);
    //    NSLog(@" mul = %lf", mine.Mul.frame.origin.x);
    
    //始めは隠している
    Code.alpha = 0;
    B.alpha = 0;
    Y.alpha = 0;
    Mul.alpha = 0;
    
    //self.frameへのはりつけ
    [self addSubview:B];
    [self addSubview:E];
    [self addSubview:X];
    [self addSubview:Y];
    [self addSubview:Equal];
    [self addSubview:Code];
    [self addSubview:Mul];
    //最前面に置く
    [self addSubview:A];
    
}

//④-2 割り算モード
- (void)divisionMode
{
    NSLog(@"④-2DivisionMode");
    
    B.text = A.text;
    //    self.A.text = @"";
    
    int b = (int)[B.text integerValue];
    if ([B.text hasPrefix:@"-"]) {
        B.text = [@"( " stringByAppendingString:self.B.text];
        B.text = [B.text stringByAppendingString:@" )"];
        B.frame = CGRectMake(self.B.frame.origin.x, B.frame.origin.y, 120, Size);
        Y.frame = CGRectOffset(Y.frame, 30, 0);
        Mul.frame = CGRectOffset(Mul.frame, 30, 0);
        B.textAlignment = NSTextAlignmentLeft;
    }
    
    //入力完了
    B.backgroundColor = [UIColor clearColor];
    
    //数値入力判定
    Mul.tag = 1;
    
    //フェードイン/アウト
//    [AnimationClass fadeOut:A :0];
    A.alpha = 0;
    [AnimationClass fadeIn:B :0];
    [AnimationClass fadeIn:Y :0];
    [AnimationClass fadeIn:Mul :0];
    
    [AnimationClass delay:1];
    
    //横移動
    [AnimationClass moveAnime:A:-60 :0];
    [AnimationClass moveAnime:B :-60 :0];
    [AnimationClass moveAnime:E :-60 :0];
    [AnimationClass moveAnime:X :-60 :0];
    [AnimationClass moveAnime:Y :-60 :0];
    [AnimationClass moveAnime:Code :-60 :0];
    [AnimationClass moveAnime:Equal :-60 :0];
    [AnimationClass moveAnime:Mul :-60 :0];
    
    int a = (int)[E.text integerValue];
    
    //解の格納
    Val = a/b;
    
    //おもちゃ箱への登録
    NSMutableArray *f = [NSMutableArray arrayWithObjects:A, Mul, nil];
    [appDelegate.toyBox setObject:f forKey:@"obj"];
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
    [appDelegate.toyBox setObject:list forKey:@"list"];
    
    appDelegate.form = self;
    
    [appDelegate setUpdateMode:@"upDate3"];
    [appDelegate upDate];
}

//⑤解モード
- (void)solutionMode
{
    NSLog(@"⑤SolutionMode");
    
    X.frame = CGRectMake(0, 0, Size, Size);
    Equal.frame = CGRectMake(self.X.frame.origin.x + 50, 0, Size, Size);
    E.frame = CGRectMake(self.Equal.frame.origin.x + 70, 0, Size, Size);
    
    E.text = Mul.text;
    
    [self addSubview:X];
    [self addSubview:Equal];
    [self addSubview:E];
    
    appDelegate.form = self;
}

//⑥代入モード
- (void)substitutionMode
{
    NSLog(@"⑥SubstitutionMode");
    
    X.frame = CGRectMake(0, 0, Size, Size);
    Equal.frame = CGRectMake(self.X.frame.origin.x + 50, 0, Size, Size);
    E.frame = CGRectMake(self.Equal.frame.origin.x + 70, 0, Size, Size);
    
    Label = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.E.frame.origin.x + Size, Size)];
    
    Label.layer.cornerRadius = 30.0;
    Label.clipsToBounds = YES;
    
    LabelPosition = Label.center.x - X.center.x;
    LabelValue = (int)[E.text integerValue];
    
    [Label addSubview:X];
    [Label addSubview:Equal];
    [Label addSubview:E];
    [self setBack:Label];
    
    [self addSubview:Label];
    [self canMoving:@"Label"];
}

//⑦代入受付モード
- (void)receptionMode
{
    NSLog(@"⑦ReceptionMode");
    
    A.frame = CGRectMake(0, 0, Size, Size);
    X.frame = CGRectMake(A.frame.origin.x + 60, 0, Size, Size);
    Code.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
    B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
    Y.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
    Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, Size, Size);
    E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
    Mul.frame = CGRectMake(E.frame.origin.x + 100, 0, Size, Size);
    
    //代入受けるためのタグ
    X.tag = 1;
    Y.tag = 2;
    
    [self addSubview:A];
    [self addSubview:B];
    [self addSubview:E];
    [self addSubview:X];
    [self addSubview:Y];
    [self addSubview:Equal];
    [self addSubview:Code];
    [self addSubview:Mul];

    Mul.hidden = YES;
    
}

//⑧移項モード
- (void)transPositionMode
{
    NSLog(@"⑧TransPositionMode");
    
    //*このメソッドでは移項に入るための数値入力待機状態を作成
    //xかyの値が変わっていたら分岐
    
    if(![X.text isEqualToString:@"x"]){
        //xに代入されたときの処理
        [self receiveValue:A :1];
        
        //ラベルの配置
        A.frame = CGRectMake(0, 0, Size, Size);
        
        Code.frame = CGRectMake(A.frame.origin.x +60, 0, Size, Size);
        B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
        Y.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
        Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, Size, Size);
        E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        
        X.frame = CGRectMake(E.frame.origin.x + 70, 0, Size, Size);
        Mul.frame = CGRectMake(X.frame.origin.x + 70, 0, Size, Size);
        
        //移項時に表示される
        X.alpha = 0;
        Mul.alpha = 0;
        
    }else if(![Y.text isEqualToString:@"y"]){
        //yに代入されたときの処理
        [self receiveValue:Code :4];
        [self receiveValue:B :22];
        
        //ラベルの配置
        A.frame = CGRectMake(0, 0, Size, Size);
        X.frame = CGRectMake(A.frame.origin.x + 60, 0, Size, Size);
        Code.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
        B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
        
        Equal.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
        E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        
        Y.frame = CGRectMake(E.frame.origin.x + 70, 0, Size, Size);
        Mul.frame = CGRectMake(Y.frame.origin.x + 70, 0, Size, Size);
        
        //移行時に表示される
        Y.alpha = 0;
        Mul.alpha = 0;
        
    }else{
        //例外のとき（念のため）
        NSLog(@"error");
    }
    
//　7/28　保留
//    A.frame = CGRectMake(0, 0, Size, Size);
//    X.frame = CGRectMake(A.frame.origin.x + 60, 0, Size, Size);
//    Code.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
//    B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
//    Y.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
//    Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, Size, Size);
//    E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
//    Mul.frame = CGRectMake(E.frame.origin.x + 100, 0, Size, Size);
    
    [self addSubview:A];
    [self addSubview:B];
    [self addSubview:E];
    [self addSubview:X];
    [self addSubview:Y];
    [self addSubview:Equal];
    [self addSubview:Code];
    [self addSubview:Mul];
    
    NSMutableArray *f = [NSMutableArray arrayWithObjects:A, Code, B, nil];
    [appDelegate.toyBox setObject:f forKey:@"obj"];
    
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
    
    [appDelegate.toyBox setObject:list forKey:@"list"];
    
    [appDelegate setUpdateMode:@"upDate5"];
}

/*************************/
/*************************/


//-(void)setMulPosition
//{
//    Mul.frame = CGRectMake(E.frame.origin.x + 100, 0, Size, Size);
//}

//-(void)setPosition
//{
//    A.frame = CGRectMake(0, 0, 80, 80);
//    X.frame = CGRectMake(A.frame.origin.x + 60, 0, Size, Size);
//    Code.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
//    B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
//    Y.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
//    Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, Size, Size);
//    E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
////    NSLog(@"%f",E.frame.origin.x);
//}

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
        A.backgroundColor = [UIColor orangeColor];
        A.tag = 101;
    }else if([str isEqualToString:@"B"]){
        B.userInteractionEnabled = YES;
        B.backgroundColor = [UIColor orangeColor];
        B.tag = 102;
    }else if([str isEqualToString:@"X"]){
        X.userInteractionEnabled = YES;
        X.backgroundColor = [UIColor orangeColor];
        X.tag = 103;
    }else if([str isEqualToString:@"Label"]){
        Label.userInteractionEnabled = YES;
        Label.backgroundColor = [UIColor orangeColor];
        Label.tag = 104;
    }else if([str isEqualToString:@"AB"]){
        A.userInteractionEnabled = YES;
        B.userInteractionEnabled = YES;
        A.backgroundColor = [UIColor orangeColor];
        B.backgroundColor = [UIColor orangeColor];
        A.tag = 101;
        B.tag = 102;
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
    }else if([str isEqualToString:@"X"]){
        X.userInteractionEnabled = NO;
        X.backgroundColor = [UIColor clearColor];
    }else if([str isEqualToString:@"Label"]){
        Label.userInteractionEnabled = NO;
        Label.backgroundColor = [UIColor clearColor];
    }else if([str isEqualToString:@"AB"]){
        A.userInteractionEnabled = NO;
        B.userInteractionEnabled = NO;
        A.backgroundColor = [UIColor clearColor];
        B.backgroundColor = [UIColor clearColor];
    }
}

/*****数値入力設定*****/
- (void)receiveValue :(UILabel *)origin :(short int)index{
    origin.tag = index;
    
    //Codeだけがここ適用されない
    if(index != 4){
        origin.text = @"";
        origin.backgroundColor = [UIColor intoColor];
    }
    
}
/********************/

/*****タッチイベント*****/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch previousLocationInView:self];
    [super touchesBegan:touches withEvent:event];
    
//    NSLog(@"tag = %ld",(long)touch.view.tag);
    
    switch (touch.view.tag) {
        case 101:
            A.center = location;
//            self.Code.text = @"÷";
//            self.B.backgroundColor = [UIColor intoColor];
            
            [AnimationClass fadeIn:Code :0];
            [AnimationClass fadeIn:B :0];
            
            break;
        case 2:
            break;
        case 104:
            Label.center = [self labelLocation: location];
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
        case 101:
            A.center = location;
            break;
        case 2:
            B.center = location;
            break;
        case 104:
            Label.center = [self labelLocation: location];
            Label.backgroundColor = [self subJudge:Label];
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
        case 101:
            if (CGRectContainsPoint(self.B.frame, self.A.center)) {
                [self changeMode:@"divisionMode"];
            }else{
//                self.Code.text = @"";
//                self.B.backgroundColor = [UIColor clearColor];
                
                [AnimationClass fadeOut:Code :0];
                [AnimationClass fadeOut:B :0];
            }
            [self back:A];
            break;
        case 2:
            break;
        case 104:
            // 代入判定メソッド
            if (Label.backgroundColor == [UIColor redColor]) {
                NSMutableArray *list = [appDelegate.toyBox objectForKey:@"list"];
                for (NSString *str in list) {
                    //        NSLog(@"Throgh");
                    [self subStart :str :Label];
                }
            }
            [self back:Label];
            
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

- (BOOL)checkDiv
{
    int e = (int)[self.Mul.text integerValue];
    
//    NSLog(@"Val = %d, e = %d",Val,e);
    if(Val == e)
        return YES;
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

//labelの内容とself.frameの位置の設定
- (ViewClass *)copyWithPosition: (ViewClass *)origin :(int)x :(int)y
{
    ViewClass *Copy = [[ViewClass alloc] init];
    
    Copy.A.text = origin.A.text;
    Copy.B.text = origin.B.text;
    Copy.E.text = origin.E.text;
    
    Copy.X.text = origin.X.text;
    Copy.Y.text = origin.Y.text;
    
    Copy.Code.text = origin.Code.text;
    Copy.Equal.text = origin.Equal.text;
    
    Copy.Mul.text = origin.Mul.text;
    
    [Copy move: x:y];
    return Copy;
}
/*****  *****/


//**********アニメーション関係**********//

//バックアニメーション
- (void)setBack:(UIView *)obj
{
    tmp = CGPointMake(obj.center.x, obj.center.y);
}

- (void)back:(UIView *)lbl
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    lbl.center = tmp;
    [UIView commitAnimations];
}

//********************//

-(CGPoint)labelLocation :(CGPoint)location
{
    return CGPointMake(location.x + LabelPosition, location.y);
}


//****************************代入ステージ****************************//
//代入判定メソッド
- (UIColor *)subJudge :(UIView *)XY
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableArray *list = [appDelegate.toyBox objectForKey:@"list"];
    
    CGPoint point = CGPointMake(XY.center.x - LabelPosition, XY.center.y);
    
    for (NSString *str in list) {
        //        NSLog(@"Throgh");
        NSMutableArray *fmember = [appDelegate.toyBox objectForKey:str];
        for (UILabel *member in fmember){
            
            CGRect convertStr = [self convertRect:member.frame fromView:[fmember objectAtIndex:0]];
            if(CGRectContainsPoint(convertStr, point)){
                
                if(member.tag == 0){
                    break;
                }
                
                return [UIColor redColor];
            }
        }
    }
    
    return [UIColor orangeColor];
}

//代入メソッド
- (void)subStart :(NSString *)str :(UIView *)XY
{
//    BOOL isCode = false;
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableArray *fmember = [appDelegate.toyBox objectForKey:str];
    
    CGPoint point = CGPointMake(XY.center.x - LabelPosition, XY.center.y);
    
    for (UILabel *member in fmember){
        
        CGRect convertStr = [self convertRect:member.frame fromView:[fmember objectAtIndex:0]];
        
        if(CGRectContainsPoint(convertStr,point)){
            
//            NSLog(@"In App");
//            member.text = [NSString stringWithFormat:@"%@",btn.text];
            if(member.tag == 0){
                break;
            }
            
//            NSLog(@"Label tag = %ld",XY.tag);
//            NSLog(@"Label Val = %d",LabelValue);
            //代入開始
            member.text = @"×";
            
            appDelegate.form = fmember[2];
            [XY removeFromSuperview];
            NSMutableArray *formula = [appDelegate.toyBox objectForKey:@"formula"];
            for (ViewClass *str in formula) {
                [AnimationClass fadeOut:str :0];
            }
            
            [appDelegate upDate];
            
        }
    }
}

//代入と式の整理　（外部参照）
- (void)substitution
{
    self.alpha = 1.0;
    [self setMode :LabelValue];
    [appDelegate setUpdateMode:@"upDate5"];
}


- (void)setMode :(int)Val
{
    NSLog(@"Call setMode");
    //移動距離
    int MoveDistance = 80;
    
    //数値入力領域の表示
    Mul.hidden = NO;
    
    //値の入力
    Mul.text = [NSString stringWithFormat:@"%d",Val];
    
    if ([Mul.text hasPrefix:@"-"]) {
        Mul.text = [@"( " stringByAppendingString:Mul.text];
        Mul.text = [Mul.text stringByAppendingString:@" )"];
        Mul.frame = CGRectMake(Mul.frame.origin.x, Mul.frame.origin.y, 120, Size);
        Mul.textAlignment = NSTextAlignmentLeft;
        MoveDistance += 20;
    }
    
    if (![self isXY]) {     //x部分に代入するため、x部分の変更を判定
        //x部分に代入
        Mul.frame = CGRectMake(X.frame.origin.x + 70, 0, Mul.frame.size.width, Size);
        
        [AnimationClass moveAnime:Code :MoveDistance :0];
        [AnimationClass moveAnime:B :MoveDistance :0];
        [AnimationClass moveAnime:Y :MoveDistance :0];
        
    }else{
        //y部分に代入
        Mul.frame = CGRectMake(Y.frame.origin.x + 70, 0, Mul.frame.size.width, Size);
    }
    
    [AnimationClass moveAnime:Equal :MoveDistance :0];
    [AnimationClass moveAnime:E :MoveDistance :0];
    
    [AnimationClass fadeIn:Mul :1.0];
    
    [AnimationClass delay:1.5];
    
    [AnimationClass movePosition:self :91 :100 + 768 + 768];
    
}


//一方解がXかYかの判定
- (BOOL)isXY
{
    
    NSLog(@"X = %@, Y = %@",X.text,Y.text);
    
    if ([X.text isEqualToString:@"x"]) {
        return true;
    }else if([Y.text isEqualToString:@"y"]){
        return false;
    }
    NSLog(@"something error");
    return false;
}

//****************************代入ステージ終了****************************//
@end
