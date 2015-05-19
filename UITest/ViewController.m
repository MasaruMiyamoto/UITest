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

//ViewClass *formula1;
//ViewClass *formula2;

SetButton *button;
SelectButtons *selects;

AppDelegate *appDelegate;

CGPoint offset;


- (void)viewDidLoad
{
    [super viewDidLoad];
     //Do any additional setup after loading the view, typically from a nib.
    
    [self initLabels];
    [self initSelects];
    [self initButtons];
    
    RandomClass *ram = [[RandomClass alloc] init];
    [ram makeRandom];
    
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

    SetField *init = [[SetField alloc] init];
    [init firstSet:oya];
    [self initScroller:oya];
}

- (void)initButtons
{
    /*****ボタンの設置*****/
    // root viewに直接貼付ける
    button = [[SetButton alloc] init];
    [button move:713 :165];
    [appDelegate setUpdateMode:@"init"];
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
    sv.panGestureRecognizer.maximumNumberOfTouches = 2;
    [sv addSubview:view];
    sv.contentSize = view.bounds.size;
    [self.view addSubview:sv];
    /**********/
}

-(void)reStart:(id)sender
{
    [oya removeFromSuperview];
    [button removeFromSuperview];
    [selects removeFromSuperview];
    [appDelegate initToyBox];
    [self initLabels];
    [self initButtons];
    [self initSelects];
    NSLog(@"ひとがゴミのようだ！！！");
}

-(void)startAction :(id)sender
{
//    NSLog(@"start");
    if(selects.Sel1.alpha == 1.0){
//        [self keepVal];
        
//        NSLog(@"%@",formula1.A.text);
        
//        [self setVal];
        
        [self newScroll];
        [self secondLabels];
        [selects dontSelects:self];
        [appDelegate upDate];
    }else if(selects.Sel2.alpha == 1.0){
//        NSLog(@"Sel2");
    }else{
//        NSLog(@"Both");
    }
    
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
//    NSLog(@"%f", offset.y);
    oya.frame = CGRectMake(0, 0, 1024, oya.frame.size.height + 768);
}

- (void)newScroll
{
    [self scrollUpDate];
    [self upDate];
    [sv setContentOffset:offset animated:YES];
}

/**********/
/***** 2ページ目の動作 *****/

- (void)secondLabels
{
    SetField *init = [[SetField alloc] init];
    [init secondSet:oya];
    appDelegate.View = self;
}


/***** ランダム値の生成 *****/
- (void)randomAction :(id)sender
{
    RandomClass *ram = [[RandomClass alloc] init];
    [ram makeRandom];
}

@end
