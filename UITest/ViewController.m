//
//  ViewController.m
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


UIView *oya;
UIScrollView *sv;

@synthesize oya;

ViewClass *formula1;
ViewClass *formula2;
SetButton *button;
SelectButtons *selects;

AppDelegate *appDelegate;

CGPoint offset;

UIView *btn;

int a1 = 6;
int b1 = -2;
int e1 = -10;

int a2 = 2;
int b2 = 6;
int e2 = 2;

//int fa1;
//int fb1;
//int fe1;
//
//int fa2;
//int fb2;
//int fe2;



- (void)viewDidLoad
{
    [super viewDidLoad];
     //Do any additional setup after loading the view, typically from a nib.
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    [self initLabels];
    [self initSelects];
    [self initButtons];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*****初期設定*****/
- (void)initLabels
{
    //ラベルを貼付けるViewを作成
    oya = [[UIView alloc]init];
    oya.frame = CGRectMake(0, 0, 1024, 768);
//    oya.backgroundColor = [UIColor yellowColor];

    formula1 = [[ViewClass alloc] initWithPosition:91:123];
    //oya に　formula1　を追加、表示
    [formula1 setVariable:a1 :b1 :e1];
    [formula1 chengeMode:1];
    [oya addSubview:formula1];
//    [self.view addSubview:oya];
    
    formula2 = [[ViewClass alloc] initWithPosition:91:252];
    //oya に　formula2　を追加、表示
    [formula2 setVariable:a2 :b2 :e2];
    [formula2 chengeMode:1];
    [oya addSubview:formula2];
//    [self.view addSubview:oya];
    
    /*****おもちゃ箱に式のデータを保存*****/
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSMutableArray *f1 = [NSMutableArray arrayWithObjects:formula1.A ,formula1.Code, formula1.B, formula1.E, nil];
    [appDelegate.toyBox setObject:f1 forKey:@"formula1"];
    
    NSMutableArray *f2 = [NSMutableArray arrayWithObjects:formula2.A , formula2.Code, formula2.B, formula2.E, nil];
    [appDelegate.toyBox setObject:f2 forKey:@"formula2"];
    
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"formula1", @"formula2", nil];
    [appDelegate.toyBox setObject:list forKey:@"list"];
    /**********/
    [button setUpdateMode:@"upDate"];
    
    [self initScroller:oya];
}

- (void)initButtons
{
    /*****ボタンの設置*****/
    // root viewに直接貼付ける
    
    button = [[SetButton alloc] init];
    [button move:713 :165];
    [button setUpdateMode:@"init"];
    [self.view addSubview:button];
    appDelegate.Button = button;

    /**********/
}

- (void)initScroller :(UIView *)view
{
    /*****スクロールの設定*****/
    sv = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //    sv.backgroundColor = [UIColor cyanColor];
    sv.bounces = NO;
    sv.panGestureRecognizer.minimumNumberOfTouches = 2;
    [sv addSubview:view];
    sv.contentSize = view.bounds.size;
    [self.view addSubview:sv];
    /**********/
}

-(void)reStart:(id)sender
{
    [oya removeFromSuperview];
    [button removeFromSuperview];
    
    [self initLabels];
    [self initButtons];
    [self initSelects];
    NSLog(@"ひとがゴミのようだ！！！");
}

-(void)startAction :(id)sender
{
//    NSLog(@"start");
    if(selects.Sel1.alpha == 1.0){
//        NSLog(@"Sel1");
        [self setVal];
        [self scrollUpDate];
        [self secondLabels];
        [self upDate];
        
        [sv setContentOffset:offset animated:YES];
        [selects dontSelects:self];
        
    }else if(selects.Sel2.alpha == 1.0){
//        NSLog(@"Sel2");
    }else{
//        NSLog(@"Both");
    }
    
}

- (void)randomAction :(id)sender
{
    [self makeRandom];
    
    [formula1 setVariable:a1 :b1 :e1];
//    formula1.A.text = [NSString stringWithFormat:@"%d",a1];
//    formula1.B.text = [NSString stringWithFormat:@"%d",b1];
//    formula1.E.text = [NSString stringWithFormat:@"%d",e1];

    [formula2 setVariable:a2 :b2 :e2];
//    formula2.A.text = [NSString stringWithFormat:@"%d",a2];
//    formula2.B.text = [NSString stringWithFormat:@"%d",b2];
//    formula2.E.text = [NSString stringWithFormat:@"%d",e2];
}

- (void)setVal
{
    a1 = (int)[formula1.A.text integerValue];
    if([formula1.Code.text isEqual:@"+"]){
//        NSLog(@"+");
        b1 = (int)[formula1.B.text integerValue];
    }else{
        b1 = -(int)[formula1.B.text integerValue];
    }
    e1 = (int)[formula1.E.text integerValue];
    
    a2 = (int)[formula2.A.text integerValue];
    if([formula2.Code.text isEqual:@"+"]){
//        NSLog(@"+");
        b2 = (int)[formula2.B.text integerValue];
    }else{
        b2 = -(int)[formula2.B.text integerValue];
    }
    e2 = (int)[formula2.E.text integerValue];
    
}
- (void)initSelects
{
    selects = [[SelectButtons alloc] initWithPosition: 161: 380];
    [selects btnPushed:self];
    [selects randomAction:self];
    [oya addSubview:selects];
}
/**********/


//変更点の更新
- (void)upDate
{
    [self.view addSubview:oya];
    [self initScroller:oya];
    [self.view addSubview:button];
}

- (void)scrollUpDate
{
    offset.y = oya.frame.size.height;
    oya.frame = CGRectMake(0, 0, 1024, oya.frame.size.height + 768);
}


/**********/
/***** 2ページ目の動作 *****/

- (void)secondLabels
{
    formula1 = [[ViewClass alloc] initWithPosition: 91: 123 + 768];
    //oya に　formula1　を追加、表示
    [formula1 setVariable: a1: b1: e1];
    [formula1 chengeMode:2];
    [oya addSubview:formula1];
//    [self.view addSubview:oya];
    
//    NSLog(@"-------------");
    formula2 = [[ViewClass alloc] initWithPosition: 91: 252 + 768];
    //oya に　formula2　を追加、表示
    [formula2 setVariable: a2: b2: e2];
    [formula2 chengeMode:2];
    [oya addSubview:formula2];
    [self.view addSubview:oya];
    
    /*****おもちゃ箱に式のデータを保存*****/
    appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate initToyBox];
    
    NSMutableArray *f1 = [NSMutableArray arrayWithObjects:formula1.A, formula1.Mul, nil];
    [appDelegate.toyBox setObject:f1 forKey:@"formula1"];
    
    NSMutableArray *f2 = [NSMutableArray arrayWithObjects:formula2.A, formula2.Mul, nil];
    [appDelegate.toyBox setObject:f2 forKey:@"formula2"];
    
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"formula1", @"formula2", nil];
    [appDelegate.toyBox setObject:list forKey:@"list"];
    
    NSMutableArray *f = [NSMutableArray arrayWithObjects:formula1, formula2, nil];
    [appDelegate.toyBox setObject:f forKey:@"formula"];
    
    appDelegate.View = self;
    [button setUpdateMode:@"upDate"];
    /**********/
    
//    [self initScroller:oya];
}

/***** ランダム値の生成 *****/
- (void)makeRandom
{
    int min = -10;
    int max = 10;
    
    int x,y;
    int a,b,c,d;
    
    int p = -100;
    int q = -100;
    
    while (YES){
    
        x = arc4random_uniform(max + 1 - min) + min;
        y = arc4random_uniform(max + 1 - min) + min;
        
        a = arc4random_uniform(max + 1 - min) + min;
        b = arc4random_uniform(max + 1 - min) + min;
        c = arc4random_uniform(max + 1 - min) + min;
        d = arc4random_uniform(max + 1 - min) + min;
        
        p = a*x + b*y;
        q = c*x + d*y;
        NSLog(@"p = %d, q = %d",p,q);
        
        if((p> -20 && p < 20) && (q <20 && q > -20))
           break;
    }
    
//    NSLog(@"p = %d, q = %d",p,q);
    
    a1 = a;
    b1 = b;
    e1 = p;
    
    a2 = c;
    b2 = d;
    e2 = q;
}

@end
