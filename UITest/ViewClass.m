//
//  ViewClass.m
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import "ViewClass.h"



#define Size 80
#define Width 440 + 100
#define Height 80

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
int LabelFlag;

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
//    self.backgroundColor = [UIColor cyanColor];
    [self setLabel];
    return self;
}

- (id) initWithPosition:(int)x :(int)y
{
    self = [super init];
    self.frame = CGRectMake(x, y, Width, Height);
//    self.backgroundColor = [UIColor cyanColor];
    [self setLabel];
    return self;
}

//各ラベルの生成
-(void)setLabel
{
    
    A = [self setText:50];
    B = [self setText:50];
    E = [self setText:50];
    X = [self setText:45];
    Y = [self setText:45];
    Equal = [self setText:45];
    Code = [self setText:45];
    Mul = [self setText:50];
    
    A.text = @"A";
    B.text = @"B";
    E.text = @"E";
    X.text = @"x";
    Y.text = @"y";
    Equal.text = @"=";
    Code.text = @"+";
    Mul.text = @"";
    
//    A.backgroundColor = [UIColor redColor];
}


- (UILabel *)setText :(int)textSize
{
    UILabel *origin = [[UILabel alloc] init];
    
    origin = [[UILabel alloc] init];
    origin.textAlignment = NSTextAlignmentCenter;
    origin.font = [UIFont systemFontOfSize:textSize];
    origin.textColor = [UIColor whiteChokeColor];
    origin.adjustsFontSizeToFitWidth = YES;
    origin.minimumScaleFactor = 20/50;
    
//    NSLog(@"setText");
    
    return origin;
}


- (void) initFont
{
    A = [self setFont:A];
    B = [self setFont:B];
    E = [self setFont:E];
    X = [self setFont:X];
    Y = [self setFont:Y];
    Equal = [self setFont:Equal];
    Code = [self setFont:Code];
    Mul = [self setFont:Mul];
}

- (UILabel *)setFont :(UILabel *)origin
{
    if ([origin.text isEqualToString:@"x"] || [origin.text isEqualToString:@"y"])
    {
        origin.font = [UIFont fontWithName:@"Palatino-Italic" size:origin.font.pointSize];
//        origin.font = [UIFont italicSystemFontOfSize:origin.font.pointSize];
    }else{
        origin.font = [UIFont fontWithName:@"Palatino" size:origin.font.pointSize];
//        origin.font = [UIFont systemFontOfSize:origin.font.pointSize];
    }
    
    return origin;
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
        CASE (@"transPositionSetMode"){
            [self transPositionSetMode];  //8
            break;
        }
        CASE (@"transPositionMode"){
            [self transPositionMode];  //9
            break;
        }
        CASE (@"transPositionHasMode"){
            [self transPositionHasMode];  //10
            break;
        }
        CASE (@"divisionLabel2"){  //11
            [self divisionLabel2];
            break;
        }
        CASE (@"divisionMode2"){
            [self divisionMode2];  //12
            break;
        }
        CASE (@"graphMode"){
            [self graphMode];  //13
            break;
        }
        CASE (@"graphFormulaMode"){
            [self graphFormulaMode];  //14
            break;
        }
        DEFAULT {
            NSLog(@"throght default");
            break;
        }
    }
    [self initFont];
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

    //入力受付
//    [self receiveValue:A :1];
//    [self receiveValue:B :22];
//    [self receiveValue:E :3];
//    [self receiveValue:Code :4];
    
//    [self initFont];
    
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
        
//        NSLog(@"val = %d B",Val);
        [self receiveValue:B :2];
        [self addSubview:B];
        
        
        [self receiveValue:E :3];
        
        
        [self addSubview:Y];
        [self addSubview:Equal];
        [self addSubview:E];
        
        //数値入力に必要
        A.text = @"0";
        A.hidden = YES;
        A.frame = CGRectMake(0, 0, 80, 80);
        [self addSubview:A];
        
        appDelegate = [[UIApplication sharedApplication] delegate];
        
        NSMutableArray *f = [NSMutableArray arrayWithObjects:A, B, E, nil];
        [appDelegate.toyBox setObject:f forKey:@"obj"];
        
        NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
        
        [appDelegate.toyBox setObject:list forKey:@"list"];
        [appDelegate setUpdateMode: @"upDate2"];
        
    }else{
        //xが残る
        //Ax = E
        
        A.text = @"";
        B.text = @"0";
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
        
        appDelegate = [[UIApplication sharedApplication] delegate];
        
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
    if([CommonMethod inputInteger:B.text :true] != 0){
        //        NSLog(@"enter");
        A.text = B.text;
        X.text = Y.text;
    }
    Code.text = @"÷";
    Y.text = @"=";
    
    //入力部分の設定
//    B.backgroundColor = [UIColor intoColor];
//    Mul.backgroundColor = [UIColor intoColor];
    
    //係数が1のとき
    if([CommonMethod inputInteger:A.text :true] == 1){
        
        int a = (int)[E.text integerValue];
        
        //解の格納
        Val = a;
        
        //解の保持
        Mul.text = E.text;
        
        X.frame = CGRectMake(0, 0, Size, Size);
        Equal.frame = CGRectMake(X.frame.origin.x + 50, 0, Size, Size);
        E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        
        [self addSubview:X];
        [self addSubview:Equal];
        [self addSubview:E];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - viewDist, self.frame.size.width, self.frame.size.height);
        
        self.hidden = YES;
        
        //おもちゃ箱への登録
        NSMutableArray *f = [NSMutableArray arrayWithObjects:A, Mul, nil];
        [appDelegate.toyBox setObject:f forKey:@"obj"];
        NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
        [appDelegate.toyBox setObject:list forKey:@"list"];
        
        appDelegate.form = self;
        //    NSLog(@"form to 4-2");
        
        NSLog(@"check from viewclass 4");
        [appDelegate setUpdateMode:@"upDate3"];
        [appDelegate upDate];
        
        return;
    }
    
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
    [self canMoving:@"divA"];
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
    
    if([B.text isEqualToString:@"-"]){
        B.text = @"-1";
    }
    
    
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
    [CommonMethod resetBorder:B];
//    B.backgroundColor = [UIColor moveColor];
    
    //数値入力判定
    [self receiveValue:Mul :5];
    
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
//    NSLog(@"form to 4-2");
    
    [appDelegate setUpdateMode:@"upDate3"];
    [appDelegate upDate];
}

//⑤解モード
- (void)solutionMode
{
    NSLog(@"solutionMode");
    
    X.frame = CGRectMake(0, 0, Size, Size);
    Equal.frame = CGRectMake(self.X.frame.origin.x + 50, 0, Size, Size);
    E.frame = CGRectMake(self.Equal.frame.origin.x + 70, 0, Size, Size);
    
    E.text = Mul.text;
    
    [self addSubview:X];
    [self addSubview:Equal];
    [self addSubview:E];
    
//    NSLog(@"X = %@, Y = %@",X.text, Y.text);
    [appDelegate inputAns:[self isXY] :(int)[E.text integerValue]];
    
    appDelegate.form = self;
//    NSLog(@"form number 5");
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
    
    if([A.text isEqualToString:@"1"]){
        A.text = @"";
    }
    
    if([A.text isEqualToString:@"-1"]){
        A.text = @"-";
    }
    
    X.frame = [CommonMethod cleanPosition:X.frame :A.text];
//    if([A.text isEqualToString:@""]){
//        self.frame = CGRectOffset(self.frame, -Size, 0);
//    }
    
    Code.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
    B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
    Y.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
    
    if([B.text isEqualToString:@"1"]){
        B.text = @"";
    }
    
    Y.frame = [CommonMethod cleanPosition:Y.frame :B.text];
    
    Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, Size, Size);
    E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
    Mul.frame = CGRectMake(E.frame.origin.x + 100, 0, Size, Size);
    
    //代入受けるためのタグ
    X.tag = 1;
    Y.tag = 2;
    
    X.text = @"x";
    Y.text = @"y";
    
    [self addSubview:A];
    [self addSubview:B];
    [self addSubview:E];
    [self addSubview:X];
    [self addSubview:Y];
    [self addSubview:Equal];
    [self addSubview:Code];
    [self addSubview:Mul];

//    [self bringSubviewToFront:A];
    
    Mul.hidden = YES;
    
}

//⑧移項準備モード
- (void)transPositionSetMode
{
    NSLog(@"⑧TransPositionSetMode");
    
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
        Y.frame = [CommonMethod cleanPosition:Y.frame :B.text];

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
        X.frame = [CommonMethod cleanPosition:X.frame :A.text];
        
        Code.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
        B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
        
        Equal.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
        E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        
        Y.frame = CGRectMake(E.frame.origin.x + 70, 0, Size, Size);
        Mul.frame = CGRectMake(Y.frame.origin.x + 70, 0, Size, Size);
        
        //移行時に表示される
        Y.alpha = 0;
        Mul.alpha = 0;
        
        //正負の入力に気をつけよう
        Code.text = @"+";
        
    }else{
        //例外のとき（念のため）
        NSLog(@"error");
    }
    
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
    
    appDelegate.form = self;
//    NSLog(@"form number 8");
    NSLog(@"Val = %d",Val);
    
    [appDelegate setUpdateMode:@"upDate5"];
}

//⑨移項実践モード
- (void)transPositionMode
{
    NSLog(@"⑨TransPositionMode");
    
    [self addSubview:A];
    [self addSubview:B];
    [self addSubview:E];
    [self addSubview:X];
    [self addSubview:Y];
    [self addSubview:Equal];
    [self addSubview:Code];
    [self addSubview:Mul];
    
    
    if(![self isXY]){
        
        //ラベルの配置
        A.frame = CGRectMake(0, 0, Size, Size);
        
        Code.frame = CGRectMake(A.frame.origin.x +60, 0, Size, Size);
        B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
        
        Y.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
        Y.frame = [CommonMethod cleanPosition:Y.frame :B.text];
        
        Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, Size, Size);
        E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        
        X.frame = CGRectMake(E.frame.origin.x + 70, 0, Size, Size);
        Mul.frame = CGRectMake(X.frame.origin.x + 70, 0, Size, Size);
        
        //Aを移項する
        [self canMoving:@"transA"];
        [self setBack:A];
        [self bringSubviewToFront:A];
        
        //隠す
        X.alpha = 0;
        
    }else{
        
        //ラベルの配置
        A.frame = CGRectMake(0, 0, Size, Size);
        
        X.frame = CGRectMake(A.frame.origin.x + 60, 0, Size, Size);
        X.frame = [CommonMethod cleanPosition:X.frame :A.text];
        
        Code.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
        B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
        
        Equal.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
        E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        
        Y.frame = CGRectMake(E.frame.origin.x + 70, 0, Size, Size);
        Mul.frame = CGRectMake(Y.frame.origin.x + 70, 0, Size, Size);

        //Bを移項する
        [self canMoving:@"transB"];
        [self setBack:B];
        [self bringSubviewToFront:B];
        
        //隠す
        Y.alpha = 0;
        
    }
    
    //初期化と代入準備
//    Mul.text = @"";
    [self receiveValue:Mul :5];
    
    //隠す
    Mul.alpha = 0;
    
}

//⑩移項完了モード
- (void)transPositionHasMode
{
    NSLog(@"⑩TranspositionHasMode");
    
    int moving;
    
    //Mulに代入されたから色変更
    Mul.backgroundColor = [UIColor  clearColor];
    [CommonMethod resetBorder:Mul];
    
    //動かないように
    [self cannotMoving:@"AB"];
    
    //場合分け
    if([self isXY]){    //Bを移項した場合
        
        Mul.text = B.text;
        
        B.frame = E.frame;
        B.text = E.text;
        B.backgroundColor = [UIColor clearColor];
        [CommonMethod resetBorder:B];
        
        /*********************ここの問題作成*******************/
        if ([self isPMlabel:Mul]) {
            Y.text = @"-";
        }else{
            Mul.text = [Mul.text substringFromIndex:1];
            Y.text = @"+";
        }
        /****************************************************/
        
        [AnimationClass fadeIn:Y :0];
        
        //移動距離の算出
        moving = Equal.frame.origin.x - Code.frame.origin.x;
        
    }else{  //Aを移項した場合
        
        Mul.text = A.text;
        
        A.frame = E.frame;
        A.text = E.text;
        A.backgroundColor = [UIColor clearColor];
        [CommonMethod resetBorder:A];
        
        /*********************ここの問題作成*******************/
        if ([self isPMlabel:Mul]) {
            X.text = @"-";
        }else{
            X.text = @"+";
            Mul.text = [Mul.text substringFromIndex:1];
        }
        /****************************************************/
        
        
        [AnimationClass fadeIn:X :0];
        
        //Bがマイナスの時の処理
        if ([Code.text isEqualToString:@"-"]) {
            B.text = [Code.text stringByAppendingString:B.text];
        }
//        [AnimationClass fadeIn:B :0.5];
        [AnimationClass fadeOut:Code :0];
        
        moving = B.frame.origin.x;
    }
    
    //初期化
    E.text = @"";
    
    [AnimationClass fadeIn:Mul :0];
    [AnimationClass delay:1];
    
    //初期化(フェードアウトとの関係)
    Code.text = @"=";
    //詰める
    
    if (![self isXY]){  //Aを移行した場合
        //横移動
        [AnimationClass moveAnime:A:-moving :0];
        [AnimationClass moveAnime:X :-moving :0];
    }
    
    //横移動（共通）
    [AnimationClass moveAnime:B :-moving :0];
    [AnimationClass moveAnime:E :-moving :0];
    [AnimationClass moveAnime:Y :-moving :0];
    [AnimationClass moveAnime:Code :-moving :0];
    [AnimationClass moveAnime:Equal :-moving :0];
    [AnimationClass moveAnime:Mul :-moving :0];

    Code.frame = CGRectMake(Mul.frame.origin.x + 70, 0, Size, Size);
    E.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
    
    
    
//    E.backgroundColor = [UIColor intoColor];
    
    
    [AnimationClass delay:1];
    
    //表示
    [AnimationClass fadeIn:Code :0];
    [AnimationClass fadeIn:E :0];
    
    
    //Valへ値の格納(Eとの正否判定)
    if ([self isXY]) {
        int valB = (int)[B.text integerValue];
        int valE = (int)[[Y.text stringByAppendingString:Mul.text] integerValue];
        
        Val = valB + valE;
    }else{
        int valA = (int)[A.text integerValue];
        int valE = (int)[[X.text stringByAppendingString:Mul.text] integerValue];
        
        Val = valA + valE;
    }
    //値の確認
//    NSLog(@"Val = %d",Val);
    
    
    //書き込み許可
    [self deReceiveValue:Mul];
    [self receiveValue:E :3];
    
    NSMutableArray *f;
    if([self isXY]){
        f = [NSMutableArray arrayWithObjects:A, E, nil];
//        A.backgroundColor = [UIColor intoColor];
    }else{
        f = [NSMutableArray arrayWithObjects:B, E, nil];
    }
    [appDelegate.toyBox setObject:f forKey:@"obj"];
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
    [appDelegate.toyBox setObject:list forKey:@"list"];
    
    appDelegate.form = self;
//    NSLog(@"form number 10");
//    NSLog(@"Val = %d",Val);
    
    NSLog(@"self.frame = %d in transHas",(int)self.frame.origin.y);
    
    [appDelegate setUpdateMode:@"upDate6"];
    [appDelegate upDate];
    
    //移動確認用
//    A.backgroundColor = [UIColor Custom];
//    B.backgroundColor = [UIColor Custom];
    
}


//⑪ 割り算準備モード2
- (void)divisionLabel2
{
    NSLog(@"DivisionLabel2");
    
    //ラベル値の設定
    if(![self isXY]){
        //        NSLog(@"enter");
        A.text = B.text;
        X.text = Y.text;
    }
    Code.text = @"÷";
    Y.text = @"=";
    
    //入力部分の設定
    //    B.backgroundColor = [UIColor intoColor];
    //    Mul.backgroundColor = [UIColor intoColor];
    
    //係数が1のとき
    if([CommonMethod inputInteger:A.text :true] == 1){
        
        int a = (int)[E.text integerValue];
        
        //解の格納
        Val = a;
        
        //解の保持
        Mul.text = E.text;
        
        X.frame = CGRectMake(0, 0, Size, Size);
        Equal.frame = CGRectMake(X.frame.origin.x + 50, 0, Size, Size);
        E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        
        [self addSubview:X];
        [self addSubview:Equal];
        [self addSubview:E];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - viewDist, self.frame.size.width, self.frame.size.height);
        
        self.hidden = YES;
        
        [appDelegate inputAns:[self isXY] :[CommonMethod inputInteger:E.text :false]];
        
        //おもちゃ箱への登録
        NSMutableArray *f = [NSMutableArray arrayWithObjects:A, Mul, nil];
        [appDelegate.toyBox setObject:f forKey:@"obj"];
        NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
        [appDelegate.toyBox setObject:list forKey:@"list"];
        
        appDelegate.form = self;
        //    NSLog(@"form to 4-2");
        
        NSLog(@"check from viewclass 11");
        [appDelegate setUpdateMode:@"upDate7"];
        [appDelegate upDate];
        
        return;
    }
    
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
    [self canMoving:@"divA2"];
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

//⑫ 割り算モードその２
- (void)divisionMode2
{
    NSLog(@"⑫DivisionMode2");
    
    B.text = A.text;
    //    self.A.text = @"";
    
    if([B.text isEqualToString:@"-"]){
        B.text = @"-1";
    }
    
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
    [CommonMethod resetBorder:B];
//    B.backgroundColor = [UIColor moveColor];
    
    //数値入力判定
    [self receiveValue:Mul :5];
    
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
    
    [appDelegate inputAns:[self isXY] :Val];
    
    //おもちゃ箱への登録
    NSMutableArray *f = [NSMutableArray arrayWithObjects:A, Mul, nil];
    [appDelegate.toyBox setObject:f forKey:@"obj"];
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"obj", nil];
    [appDelegate.toyBox setObject:list forKey:@"list"];
    
    appDelegate.form = self;
//    NSLog(@"form to 12");
    
    [appDelegate setUpdateMode:@"upDate7"];
    [appDelegate upDate];
}

- (void)graphMode
{
    NSLog(@"⑬GraphMode");
    //Ax+By=E
    
    A.frame = CGRectMake(0, 0, Size, Size);
    X.frame = CGRectMake(A.frame.origin.x + 60, 0, Size, Size);
    Code.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
    B.frame = CGRectMake(Code.frame.origin.x + 70, 0, Size, Size);
    Y.frame = CGRectMake(B.frame.origin.x + 60, 0, Size, Size);
    Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, Size, Size);
    E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
    
    [self addSubview:A];
    [self addSubview:B];
    [self addSubview:E];
    [self addSubview:X];
    [self addSubview:Y];
    [self addSubview:Equal];
    [self addSubview:Code];
    
}

- (void)graphFormulaMode
{
    NSLog(@"⑭GraphFormulaMode");
    //y = の形にする
    
    int a = -[CommonMethod inputInteger:A.text :true];
    int b1 = [CommonMethod inputInteger:B.text :true];
    if([Code.text isEqualToString:@"-"]){
        b1 = -b1;
    }
    int b2 = [CommonMethod inputInteger:B.text :true];
    if([Code.text isEqualToString:@"-"]){
        b2 = -b2;
    }
    int e = [CommonMethod inputInteger:E.text :false];
    
    A.text = [CommonMethod outputString:a/b1 :true];
    E.text = [CommonMethod outputString:e/b2 :false];
    
    
    NSLog(@"a = %d",a);
    NSLog(@"b = %d",b1);
    NSLog(@"e = %d",e);
    
    
    UILabel *Code2 = [self setText:45];
    
    Code.text = @"+";
    Code2.text = @"+";

    UIView *dView1 = [[UIView alloc]init];
    UIView *dView2 = [[UIView alloc]init];
    
//    dView1.backgroundColor = [UIColor cyanColor];
    
    
    //座標の確定
    Y.frame = CGRectMake(10, 0, Size, Size);
    Equal.frame = CGRectMake(Y.frame.origin.x + 50, 0, Size, Size);
    
    
    //変数項
    if (a%b1 == 0) {
        NSLog(@"OK 0");
        A.frame = CGRectMake(0, 0, Size, Size);
        dView1.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        [dView1 addSubview:A];
    }else{
        //正負の処理
        
        if (a < 0) {
            a = -a;
            Code.text = @"-";
        }
        
        if (b1 < 0) {
            b1 = -b1;
            if([Code.text isEqualToString:@"+"]){
//                NSLog(@"Code = -");
                Code.text = @"-";
            }else{
                Code.text = @"+";
            }
        }
        
        int child = [CommonMethod getChild:a :b1];
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor whiteChokeColor];
        line.frame = CGRectMake(0, Size/2, Size, 2);
        
        A = [self setText:45];
        B = [self setText:45];
        
        A.text = [CommonMethod outputString:a/child :false];
        B.text = [CommonMethod outputString:b1/child :false];
        
        A.frame = CGRectMake(0, 0, Size, Size/2);
        B.frame = CGRectMake(0, Size/2 + 10, Size, Size/2);
        
        if([Code.text isEqualToString:@"-"]){
//            NSLog(@"OK -");
            Code.frame = CGRectMake(Equal.frame.origin.x + 50, 0, Size, Size);
            dView1.frame = CGRectMake(Code.frame.origin.x + 60, 0, Size, Size);
            [self addSubview:Code];
            
        }else{
            dView1.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
        }
        
        [dView1 addSubview:line];
        [dView1 addSubview:A];
        [dView1 addSubview:B];
        
        
    }
    
    //定数項
    dView2.frame = CGRectMake(0, 0, Size, Size);
    
    if(e%b2 == 0){
        if(e/b2 < 0){
            Code2.text = @"-";
            E.text = [E.text substringFromIndex:1];
        }
//        NSLog(@"OK");
        E.frame = CGRectMake(0, 0, Size, Size);
        [dView2 addSubview:E];
        
    }else{
        
        if (e < 0) {
            e = -e;
            Code2.text = @"-";
        }
        
        if (b2 < 0) {
            b2 = -b2;
            if([Code2.text isEqualToString:@"+"]){
                Code2.text = @"-";
            }else{
                Code2.text = @"+";
            }
        }
        
        int child = [CommonMethod getChild:e :b2];
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor whiteChokeColor];
        line.frame = CGRectMake(0, Size/2, Size, 2);
        
        E = [self setText:45];
        Mul = [self setText:45];
        
        E.text = [CommonMethod outputString:e/child :false];
        Mul.text = [CommonMethod outputString:b2/child :false];
        
        E.frame = CGRectMake(0, 0, Size, Size/2);
        Mul.frame = CGRectMake(0, Size/2 + 10, Size, Size/2);
        
        dView2.frame = CGRectMake(0, 0, Size, Size);
        
        [dView2 addSubview:line];
        [dView2 addSubview:E];
        [dView2 addSubview:Mul];
    }
    
    X.frame = CGRectMake(dView1.frame.origin.x + 60, 0, Size, Size);
    
    Code2.frame = CGRectMake(X.frame.origin.x +50, 0, Size, Size);
    dView2.frame = CGRectMake(Code2.frame.origin.x + 70, 0, Size, Size);
    
    NSLog(@"E = %@",E.text);
    NSLog(@"Mul = %@",Mul.text);
//    NSLog(@"%lf",[[Code2 text] sizeWithFont:[Code2 font]]);
//    NSLog(@"%lf",[[Code text] sizeWithFont:[Code font]]);
//    NSLog(@"x = %lf",dView2.frame.origin.x);
    
    
    [self addSubview:Y];
    [self addSubview:Equal];
    [self addSubview:dView1];
    [self addSubview:X];
    [self addSubview:Code2];
    [self addSubview:dView2];
    
    
}
/*************************/
/*************************/

//self.frame（クラス自身の位置）を動かす
- (void)move :(int)x :(int)y
{
    self.frame = CGRectOffset(self.frame, x, y);
}


-(void)setVariable:(int)a :(int)b :(int)e
{
    _ValA = a;
    _ValB = b;
    _ValE = e;
    
//    A.text = [NSString stringWithFormat:@"%d",a];
//    E.text = [NSString stringWithFormat:@"%d",e];

    A.text = [CommonMethod outputString:a :true];
    E.text = [CommonMethod outputString:e :false];
    
    if(b>0){
        Code.text = @"+";
//        B.text = [NSString stringWithFormat:@"%d",b];
        B.text = [CommonMethod outputString:b :true];
    }else if(b<0){
        Code.text = @"-";
//        B.text = [NSString stringWithFormat:@"%d",-b];
        B.text = [CommonMethod outputString:-b :true];
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
    //divisionMode
    if([str isEqualToString:@"divA"]){
        A.userInteractionEnabled = YES;
        A.backgroundColor = [UIColor moveColor];
        A.tag = 101;
    }else if([str isEqualToString:@"divA2"]){//divisionMode2
        A.userInteractionEnabled = YES;
        A.backgroundColor = [UIColor moveColor];
        A.tag = 102;
        
    //transpositionMode
    }else if([str isEqualToString:@"transA"]){
        A.userInteractionEnabled = YES;
        A.backgroundColor = [UIColor moveColor];
        A.tag = 201;
    }else if([str isEqualToString:@"transB"]){
        B.userInteractionEnabled = YES;
        B.backgroundColor = [UIColor moveColor];
        B.tag = 202;
        
        
        
    //未定
    }else if([str isEqualToString:@"X"]){
        X.userInteractionEnabled = YES;
        X.backgroundColor = [UIColor moveColor];
        X.tag = 103;
    }else if([str isEqualToString:@"Label"]){
        Label.userInteractionEnabled = YES;
        Label.backgroundColor = [UIColor moveColor];
        Label.tag = 104;
    }else if([str isEqualToString:@"AB"]){
        A.userInteractionEnabled = YES;
        B.userInteractionEnabled = YES;
        A.backgroundColor = [UIColor moveColor];
        B.backgroundColor = [UIColor moveColor];
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
//        origin.backgroundColor = [UIColor intoColor];
        [CommonMethod setBorder:origin];
    }
    
}

- (void)deReceiveValue :(UILabel *)origin
{
    origin.tag = 0;
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
        
        //divisionMode
        case 101:
            A.center = [self setLocation:location];
//            self.Code.text = @"÷";
//            self.B.backgroundColor = [UIColor intoColor];
            
            [AnimationClass fadeIn:Code :0];
            [AnimationClass fadeIn:B :0];
            break;
            
        //divisionMode2
        case 102:
            A.center = [self setLocation:location];
            
            
            //            self.Code.text = @"÷";
            //            self.B.backgroundColor = [UIColor intoColor];
            
            [AnimationClass fadeIn:Code :0];
            [AnimationClass fadeIn:B :0];
            break;
            
        //transpositionMode
        case 201:
            Val = [CommonMethod inputInteger:A.text :false];
            A.center = [self setLocation:location];
            [AnimationClass fadeIn:Mul :0];
            break;
            
        case 202:
            if([Code.text isEqualToString:@"-"])
                B.text = [Code.text stringByAppendingString:B.text];
            Val = [CommonMethod inputInteger:B.text :false];
            [AnimationClass fadeOut:Code :0];
            [AnimationClass fadeIn:Mul :0];
            B.center = [self setLocation:location];
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
            
        //divisionMode
        case 101:
            A.center = [self setLocation:location];
            break;
            
        //divisionMode2
        case 102:
            A.center = [self setLocation:location];
            break;
            
        //transpositionMode
        case 201:
            A.center = [self setLocation:location];
            
            if(A.center.x > Equal.center.x){
                A.text = [NSString stringWithFormat:@"%d", -Val];
                A.backgroundColor = [UIColor moveColor2];
            }else{
                A.text = [NSString stringWithFormat:@"%d", Val];
                A.backgroundColor = [UIColor moveColor];
            }
            
            break;
            
        case 202:
            B.center = [self setLocation:location];
            
            if(B.center.x > Equal.center.x){
                B.text = [NSString stringWithFormat:@"%d", -Val];
                B.backgroundColor = [UIColor moveColor2];
            }else{
                B.text = [NSString stringWithFormat:@"%d", Val];
                B.backgroundColor = [UIColor moveColor];
            }
            
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
            //divisionMode
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
            
        //divisionMode2
        case 102:
            if (CGRectContainsPoint(self.B.frame, self.A.center)) {
                [self changeMode:@"divisionMode2"];
            }else{
                [AnimationClass fadeOut:Code :0];
                [AnimationClass fadeOut:B :0];
            }
            [self back:A];
            break;
            
        //transpositionMode
        case 201:
            A.text = [NSString stringWithFormat:@"%d", Val];
            A.backgroundColor = [UIColor moveColor];
            if (CGRectContainsPoint(self.A.frame, self.Mul.center)) {
                [self changeMode:@"transPositionHasMode"];
            }else{
                [self back:A];
                [AnimationClass fadeOut:Mul :0];
            }
            break;
        
        case 202:
            B.text = [NSString stringWithFormat:@"%d", Val];
            B.backgroundColor = [UIColor moveColor];
            if (CGRectContainsPoint(self.B.frame, self.Mul.center)) {
                [self changeMode:@"transPositionHasMode"];
            }else{
                [self back:B];
                if([Code.text isEqualToString:@"-"])
                    B.text = [B.text substringFromIndex:1];
                [AnimationClass fadeOut:Mul :0];
                [AnimationClass fadeIn:Code :0];
            }
            break;
        
        
        case 104:
            // 代入判定メソッド
//            if (Label.backgroundColor == [UIColor intoColor]) {
            if(LabelFlag){
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

//タッチイベントキャンセル時の挙動
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesCancelled:touches withEvent:event];
    [super touchesCancelled:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    //    CGPoint location = [touch locationInView:self];
    
    switch (touch.view.tag) {
            //divisionMode
        case 101:
            [self back:A];
            break;
            
            //divisionMode2
        case 102:
            [self back:A];
            break;
            
            //transpositionMode
        case 201:
            [self back:A];
            [AnimationClass fadeOut:Mul :0];
            break;
            
        case 202:
            [self back:B];
            if([Code.text isEqualToString:@"-"])
                B.text = [B.text substringFromIndex:1];
            [AnimationClass fadeOut:Mul :0];
            [AnimationClass fadeIn:Code :0];
            break;
            
            
        case 104:
            // 代入判定メソッド
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
//    int a = (int)[A.text integerValue];
//    int b = (int)[B.text integerValue];
//    int e = (int)[E.text integerValue];
    
    int a = [CommonMethod inputInteger:A.text :false];
    int b = [CommonMethod inputInteger:B.text :false];
    int e = [CommonMethod inputInteger:E.text :false];
    
    NSLog(@"a=%d, b=%d, e=%d",a,b,e);
    
    if (e == Con) {
        if(a == Val)
            return YES;
        else if(b == Val)
            return YES;
    }
    return NO;
}

- (BOOL)checkDiv :(NSString *)str
{
    int e;
    if ([str isEqualToString:@"Mul"]) {
        e = (int)[Mul.text integerValue];
    }else if([str isEqualToString:@"E"]){
        e = (int)[E.text integerValue];
    }else{
        NSLog(@"error");
    }
    
//    NSLog(@"Val = %d, e = %d",Val,e);
    
    if(Val == e)
        return YES;
    
    return NO;
}

- (BOOL)checkMul
{
    int e;
    if (![self isXY]) {
//        e = (int)[A.text integerValue];
        e = [CommonMethod inputInteger:A.text :false];
        NSLog(@"Ae = %d",e);
    }else{
        NSString *cb = [Code.text stringByAppendingString:B.text];
//        e = (int)[cb integerValue];
        e = [CommonMethod inputInteger:cb :false];
        NSLog(@"Be = %d",e);
    }
    
    if (e == Val) {
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
    
//    A.text = [NSString stringWithFormat:@"%d",_ValA*mul];
//    E.text = [NSString stringWithFormat:@"%d",_ValE*mul];
    A.text = [CommonMethod outputString:_ValA*mul :true];
    E.text = [CommonMethod outputString:_ValE*mul :false];
    
    if(_ValB*mul >= 0){
        Code.text = @"+";
//        B.text = [NSString stringWithFormat:@"%d",_ValB*mul];
        B.text = [CommonMethod outputString:_ValB*mul :true];
    }else if(_ValB*mul < 0){
        Code.text = @"-";
//        B.text = [NSString stringWithFormat:@"%d",-_ValB*mul];
        B.text = [CommonMethod outputString:-_ValB*mul :true];
    }
//    NSLog(@"B = %@ in update from viewclass",B.text);
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

- (void)setRect:(UIView *)obj
{
    tmp = CGPointMake(obj.frame.origin.x, obj.frame.origin.y);
}

- (void)back:(UIView *)lbl
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    lbl.center = tmp;
    [UIView commitAnimations];
}

//********************//

- (CGPoint) setLocation :(CGPoint)location
{
    return CGPointMake(location.x - 30, location.y - 30);
}

-(CGPoint)labelLocation :(CGPoint)location
{
    return CGPointMake(location.x, location.y - 30);
}

-(CGPoint)codeLocation :(UILabel *)lbl
{
    return CGPointMake(lbl.center.x - 70, lbl.center.y);
}

//****************************代入ステージ****************************//
//代入判定メソッド
//色が変わる
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
            
//            NSLog(@"str %@",NSStringFromCGRect(convertStr));
//            NSLog(@"btn %@",NSStringFromCGPoint(point));
            
            if(CGRectContainsPoint(convertStr, point)){
                
                if(member.tag == 0){
                    break;
                }
                LabelFlag = true;
                return [UIColor intoColor];
            }
        }
    }
    LabelFlag = false;
    return [UIColor moveColor];
}

//代入メソッド
//実際に代入する
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
            
            //call update4
            [appDelegate upDate];
            
        }
    }
}

//代入と式の整理　（外部参照）
- (void)substitution
{
    self.alpha = 1.0;
    [self setMode :LabelValue];
//    [appDelegate setUpdateMode:@"upDate5"];
}


- (void)setMode :(int)val
{
    NSLog(@"Call setMode");
    //移動距離
    int MoveDistance = 80;
    
    //数値入力領域の表示
    Mul.hidden = NO;
//    Mul.backgroundColor = [UIColor moveColor];
    
    if(self.frame.origin.x < 91){
        self.frame = CGRectOffset(self.frame, Size, 0);
    }
    
    //値の入力
    Mul.text = [NSString stringWithFormat:@"%d",val];
    
    if ([Mul.text hasPrefix:@"-"]) {
        Mul.text = [@"( " stringByAppendingString:Mul.text];
        Mul.text = [Mul.text stringByAppendingString:@" )"];
        Mul.frame = CGRectMake(Mul.frame.origin.x, Mul.frame.origin.y, 120, Size);
        Mul.textAlignment = NSTextAlignmentLeft;
        MoveDistance += 30;
    }
    
    if (![self isXY]) {     //x部分に代入するため、x部分の変更を判定
        //x部分に代入
        if([A.text isEqualToString:@""]){
            X.frame = CGRectOffset(X.frame, 60, 0);
            Mul.frame = CGRectMake(X.frame.origin.x + 70, 0, Mul.frame.size.width, Size);
            MoveDistance += 60;
        }else{
            Mul.frame = CGRectMake(X.frame.origin.x + 70, 0, Mul.frame.size.width, Size);
        }
        
        [AnimationClass moveAnime:Code :MoveDistance :0];
        [AnimationClass moveAnime:B :MoveDistance :0];
        [AnimationClass moveAnime:Y :MoveDistance :0];
        
//        Val = val * (int)[A.text integerValue];
        Val = val * [CommonMethod inputInteger:A.text :true];
        
    }else{
        //y部分に代入
        if([B.text isEqualToString:@""]){
            Y.frame = CGRectOffset(Y.frame, 60, 0);
            Mul.frame = CGRectMake(Y.frame.origin.x + 70, 0, Mul.frame.size.width, Size);
            MoveDistance += 60;
        }else{
            Mul.frame = CGRectMake(Y.frame.origin.x + 70, 0, Mul.frame.size.width, Size);
        }
        
        //Code + B でValを求める
//        Val = val * (int)[[Code.text stringByAppendingString:B.text] integerValue];
        int b = [CommonMethod inputInteger:B.text :true];
        if([Code.text isEqualToString:@"-"]){
            b = -b;
        }
        
        Val = val * b;
        
    }
    
    //係数が１の処理
    if([Y.text isEqualToString:@"y"]){
        if([A.text isEqualToString:@""]){
            A.text = @"1";
            NSLog(@"A to 1");
        }else if([A.text isEqualToString:@"-"]){
            A.text = @"-1";
        }
    }else{
        if([B.text isEqualToString:@""]){
            B.text = @"1";
            NSLog(@"B to 1");
        }else if([B.text isEqualToString:@"-"]){
            B.text = @"-1";
        }
    }
    
    [AnimationClass moveAnime:Equal :MoveDistance :0];
    [AnimationClass moveAnime:E :MoveDistance :0];
        
    [AnimationClass delay:1.5];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
//    NSLog(@"form.y = %d", (int));
    
    NSLog(@"tmp %@",NSStringFromCGPoint(tmp));
    
//    if(self.frame.origin.y >= 1668){
//        [AnimationClass movePosition:self :91 :1668];
//    }else{
//        [AnimationClass movePosition:self :91 :1668 - viewDist];
//    }
    
    [AnimationClass movePosition:self :91 :tmp.y + viewDist];
    appDelegate.form = self;
    
//    NSLog(@"form number 7");
//    NSLog(@"Val = %d",Val);
}


//****************************代入ステージ終了****************************//

//一方解がXかYかの判定
//Xがあるときtrue
- (BOOL)isXY
{
    
//    NSLog(@"X = %@, Y = %@",X.text,Y.text);
    
    //Xのラベルの判定
    if ([X.text isEqualToString:@"x"]) {
        return true;
    }else if([Y.text isEqualToString:@"y"]){
        return false;
    }
    NSLog(@"something error");
    return false;
}

- (BOOL)isPMlabel :(UILabel *)label
{
    int l = (int)[label.text integerValue];
    
    if(l > 0){
        return true;
    }else{
        return false;
    }
    
}



@end
