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

UIView *btn;

- (void)viewDidLoad
{
    [super viewDidLoad];
     //Do any additional setup after loading the view, typically from a nib.
    
    [self initLabels];
    [self initButtons];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*****タッチイベント*****/
/*****基本的にこれが更新*****/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch previousLocationInView:self.view];
    [super touchesBegan:touches withEvent:event];
    
//    NSLog(@"%ld",(long)touch.view.tag);
//    NSLog(@"%f,%f",location.x,location.y);
    
    if([event touchesForView:formula1] != nil){
        NSLog(@"oya");
    }
    
    
    btn = [button labelCopy:(int)touch.view.tag];
    btn.center = CGPointMake(location.x, location.y);
    [self.view addSubview:btn];
    
//    NSLog(@"view");

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    [super touchesMoved:touches withEvent:event];
    
    btn.center = CGPointMake(location.x, location.y);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    if (CGRectIntersectsRect(btn.frame, formula1.A.frame)) {
        NSLog(@"OK");
    }
    [button back];
//    [btn removeFromSuperview];
}


/*****初期設定*****/
- (void)initLabels
{
    //ラベルを貼付けるViewを作成
    oya = [[UIView alloc]init];
    oya.frame = CGRectMake(0, 0, 1024, 1200);
//    oya.frame = CGRectMake(0, 0, 700, 768);
    oya.backgroundColor = [UIColor yellowColor];

    formula1 = [[ViewClass alloc] initWithPosition:91:123];
    //oya に　formula1　を追加、表示
    [formula1 setVariable:6 :2 :-10];
//    formula1.userInteractionEnabled = YES;
    [oya addSubview:formula1];
    [self.view addSubview:oya];
    
    formula2 = [[ViewClass alloc] initWithPosition:91:252];
    //oya に　formula2　を追加、表示
    [formula2 setVariable:2 :6 :2];
    [oya addSubview:formula2];
    [self.view addSubview:oya];
    
//    [self initScroller:oya];
}

- (void)initButtons
{
    /*****ボタンの設置*****/
    // root viewに直接貼付ける
    
//    buField = [[UIView alloc] initWithFrame:CGRectMake(713, 165, 228, 386)];
//    buField.backgroundColor = [UIColor greenColor];
    
    button = [[SetButton alloc] init];
    [button move:713 :165];
    [self.view addSubview:button];
//    [buField addSubview:button];
//    [self.view addSubview:buField];
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
