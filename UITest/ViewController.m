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
UIView *buField;
ViewClass *view;

- (void)viewDidLoad {
    [super viewDidLoad];
     //Do any additional setup after loading the view, typically from a nib.
    
    [self initLabels];
    [self initButtons];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*****タッチイベント*****/
/*****基本的にこれが更新*****/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    switch (touch.view.tag) {
        case 1:
            // タグが1のビュー
            NSLog(@"hoge");
//            oya.frame = CGRectMake(0, 0, 700, 1200);
            [self scrollUpDate];
            view.label1.text = @"label1";
            [self upDate];
            break;
            
        case 2:
            // タグが2のビュー
            break;
            
        default:
            break;
    }
}

/*****初期設定*****/
- (void)initLabels{
    //ラベルを貼付けるViewを作成
    oya = [[UIView alloc]init];
    //    oya.frame = CGRectMake(0, 0, 1024, 1200);
    oya.frame = CGRectMake(0, 0, 700, 768);
    oya.backgroundColor = [UIColor yellowColor];
    
    //ラベルのViewを呼び出す
    view = [[ViewClass alloc]init];
    
    //oya に　view　を追加、表示
    [oya addSubview:view];
    [self.view addSubview:oya];
    
    [self initScroller:oya];
}

- (void)initButtons{
    /*****ボタンの設置*****/
    buField = [[UIView alloc] initWithFrame:CGRectMake(713, 165, 228, 386)];
    buField.backgroundColor = [UIColor redColor];
    
    SetButton *button = [[SetButton alloc] init];
    [buField addSubview:button];
    [self.view addSubview:buField];
    /**********/
}

- (void)initScroller :(UIView *)oya{
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
- (void)upDate{
    [self.view addSubview:oya];
    [self initScroller:oya];
    [self.view addSubview:buField];
}

- (void)scrollUpDate{
    oya.frame = CGRectMake(0, 0, 1024, oya.frame.size.height + 768);
}
@end
