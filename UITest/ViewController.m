//
//  ViewController.m
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import "ViewController.h"

#import "AppDelegate.h"
//#import "ViewClass.h"
#import "SetButton.h"
#import "SelectButtons.h"
#import "SetField.h"
#import "RandomClass.h"

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
RandomClass *ram;

AppDelegate *appDelegate;

int svLocation;

CGPoint offset;


- (void)viewDidLoad
{
    [super viewDidLoad];
     //Do any additional setup after loading the view, typically from a nib.
    
    [self initLabels];
    [self initSelects];
    [self initButtons];
    ram = [[RandomClass alloc] init];
    [ram enterFormula];
    
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
    oya.backgroundColor = [UIColor boardColor];
    
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
    
    [button isMove:false];
//    appDelegate.Button = [[SetButton alloc] init];
//    appDelegate.Button = button;
    /**********/
}

- (void)initScroller :(UIView *)oyaView
{
    /*****スクロールの設定*****/
    sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
//    sv = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
//        sv.backgroundColor = [UIColor cyanColor];
    sv.bounces = NO;
    sv.panGestureRecognizer.minimumNumberOfTouches = 2;
    sv.panGestureRecognizer.maximumNumberOfTouches = 2;
    [sv addSubview:oyaView];
    sv.contentSize = oyaView.bounds.size;
    offset = CGPointMake(0, 0);
    [self.view addSubview:sv];
    /**********/
}

- (void)initSelects
{
    selects = [[SelectButtons alloc] initWithPosition: 161: 380];
    [selects btnPushed:self];
    [selects randomAction:self];
    [oya addSubview:selects];
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
    [ram enterFormula];
    NSLog(@"ひとがゴミのようだ！！！");
}

-(void)startAction :(id)sender
{
    //    NSLog(@"start");
    if([selects isMode]){
        if(![ram isIdefinite]){
            
            if(selects.Sel1.alpha == 1.0){
                
                //        [self keepVal];
                //        NSLog(@"%@",formula1.A.text);
                //        [self setVal];
                
                [self addScroll: 768];
                [self secondLabels];
                [selects dontSelects:self];
                [appDelegate upDate];
            }else if(selects.Sel2.alpha == 1.0){
                //        NSLog(@"Sel2");
            }else{
                //        NSLog(@"Both");
            }
        }
        
    }else{
        
        if(![ram isIdefinite]){
            [self addScroll: 768];
            [self secondLabels];
            [selects dontSelects:self];
            [appDelegate upDate];
        }else{
            [self addScroll: 768];
            [self graphLabels];
            [selects dontSelects:self];
            [appDelegate upDate];
        }
    }
}


/**********/


//変更点の更新
//- (void)upDate
//{
//    [self.view addSubview:oya];
//    [self initScroller:oya];
//    [self.view addSubview:button];
//}
//
//- (void)scrollUpDate
//{
//    offset.y = oya.frame.size.height;
////    NSLog(@"%f", offset.y);
//    oya.frame = CGRectMake(0, 0, 1024, oya.frame.size.height + 768);
//    
//}
//
//- (void)scrollUpDate :(int)distY
//{
//    offset.y += distY;
//    //    NSLog(@"%f", offset.y);
//    oya.frame = CGRectMake(0, 0, 1024, oya.frame.size.height + distY);
//}
//
//- (void)newScroll
//{
//    
//    [self scrollUpDate];
//    [self upDate];
//    
//    sv.contentOffset = CGPointMake(0, oya.frame.size.height - 768*2);
//    [sv setContentOffset:offset animated:YES];
//}
//
//
//- (void)addScroll :(int)distY
//{
//    
//    [self scrollUpDate:distY];
//    [self upDate];
//    
//    sv.contentOffset = CGPointMake(0, oya.frame.size.height  - distY);
//    [sv setContentOffset:offset animated:YES];
//}

- (void)scrollUpDate
{
    [sv setContentOffset:offset animated:YES];
}

- (void)addScroll:(int)distY
{
    NSLog(@"offset = %d",(int)offset.y);
    NSLog(@"oya.height = %d",(int)oya.frame.size.height);
    NSLog(@"contentoffset = %d",(int)sv.contentOffset.y);
    
    //offset上書き
    offset.y += distY;
    
    //viewとscrollviewをのばす
    oya.frame = CGRectMake(0, 0, 1024, oya.frame.size.height + distY);
    sv.contentSize = oya.bounds.size;
    
    NSLog(@"offset = %d",(int)offset.y);
    NSLog(@"oya.height = %d",(int)oya.frame.size.height);
    NSLog(@"contentoffset = %d",(int)sv.contentOffset.y);
    
    //self.viewにadd button too
//    [sv addSubview:oya];
//    [self.view addSubview:sv];
    [self.view addSubview:button];
    
    //追加部分まで移動、content保存
    [sv setContentOffset:offset animated:YES];
//    sv.contentOffset = CGPointMake(0, sv.contentOffset.y + distY);
    
    NSLog(@"移動後");
    NSLog(@"offset = %d",(int)offset.y);
    NSLog(@"oya.height = %d",(int)oya.frame.size.height);
    NSLog(@"contentoffset = %d",(int)sv.contentOffset.y);
}

/**********/
/***** 2ページ目の動作 *****/

- (void)secondLabels
{
    SetField *init = [[SetField alloc] init];
    [init secondSet:oya];
    appDelegate.View = self;
}

//グラフ表示の動作
- (void)graphLabels
{
    SetField *init = [[SetField alloc] init];
    [init graphSet:oya :50+768];
    appDelegate.View = self;
}


/***** ランダム値の生成 *****/
- (void)randomAction :(id)sender
{
    ram = [[RandomClass alloc] init];
    [ram enterFormula];
}

@end
