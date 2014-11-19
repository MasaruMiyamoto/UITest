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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIView* oya = [[UIView alloc]init];
    oya.frame = CGRectMake(0, 0, 350, 1200);
    oya.backgroundColor = [UIColor yellowColor];
    
    ViewClass* view = [[ViewClass alloc]init];
    
    [oya addSubview:view];
    [self.view addSubview:oya];
    
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    sv.backgroundColor = [UIColor cyanColor];
    sv.bounces = NO;
    [sv addSubview:oya];
    sv.contentSize = oya.bounds.size;
    [self.view addSubview:sv];
    
    UIView *buField = [[UIView alloc] initWithFrame:CGRectMake(713, 165, 0, 0)];
    buField.backgroundColor = [UIColor redColor];
    
    SetButton *button = [[SetButton alloc] init];
    
    [buField addSubview:button];
    [self.view addSubview:buField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    switch (touch.view.tag) {
        case 1:
            // タグが1のビュー
            NSLog(@"hoge");
            break;
            
        case 2:
            // タグが1のビュー
            break;
            
        default:
            break;
    }
}

@end
