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
ViewClass *formula1;
ViewClass *formula2;
SetButton *button;
SelectButtons *selects;

UIView *btn;

- (void)viewDidLoad
{
    [super viewDidLoad];
     //Do any additional setup after loading the view, typically from a nib.
    
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
//    oya.frame = CGRectMake(0, 0, 1024, 1200);
    oya.frame = CGRectMake(0, 0, 1024, 768);
    oya.backgroundColor = [UIColor yellowColor];

    formula1 = [[ViewClass alloc] initWithPosition:91:123];
    //oya に　formula1　を追加、表示
    [formula1 setVariable:6 :2 :-10];
    [oya addSubview:formula1];
    [self.view addSubview:oya];
    
    formula2 = [[ViewClass alloc] initWithPosition:91:252];
    //oya に　formula2　を追加、表示
    [formula2 setVariable:2 :6 :2];
    [oya addSubview:formula2];
    [self.view addSubview:oya];
    
    /*****おもちゃ箱に式のデータを保存*****/
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSMutableArray *f1 = [NSMutableArray arrayWithObjects:formula1.A ,formula1.Code, formula1.B, formula1.E, nil];
    [appDelegate.toyBox setObject:f1 forKey:@"formula1"];
    
    NSMutableArray *f2 = [NSMutableArray arrayWithObjects:formula2.A , formula2.Code, formula2.B, formula2.E, nil];
    [appDelegate.toyBox setObject:f2 forKey:@"formula2"];
    
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"formula1", @"formula2", nil];
    [appDelegate.toyBox setObject:list forKey:@"list"];
    /**********/
    
    [self initScroller:oya];
}

- (void)initButtons
{
    /*****ボタンの設置*****/
    // root viewに直接貼付ける
    
    button = [[SetButton alloc] init];
    [button move:713 :165];
    [self.view addSubview:button];

    /**********/
}

- (void)initScroller :(UIView *)oya
{
    /*****スクロールの設定*****/
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //    sv.backgroundColor = [UIColor cyanColor];
    sv.bounces = NO;
    [sv addSubview:oya];
    sv.contentSize = oya.bounds.size;
    [self.view addSubview:sv];
    /**********/
}

-(void)hoge:(id)sender
{
    NSLog(@"hoge");
}

-(void)startAction :(id)sender
{
    NSLog(@"start");
    if(selects.Sel1.alpha == 1.0){
        NSLog(@"Sel1");
        [self scrollUpDate];
        [self upDate];
    }else if(selects.Sel2.alpha == 1.0){
        NSLog(@"Sel2");
    }else{
        NSLog(@"Both");
    }
}


- (void)initSelects
{
    selects = [[SelectButtons alloc] initWithPosition: 161: 380];
    [selects btnPushed:self];
    [oya addSubview:selects];
    
}
/**********/


//変更点の更新
- (void)upDate
{
    [self.view addSubview:oya];
    [self initScroller:oya];
//    [self.view addSubview:buField];
}

- (void)scrollUpDate
{
    oya.frame = CGRectMake(0, 0, 1024, oya.frame.size.height + 768);
}


@end
