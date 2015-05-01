//
//  FirstSet.m
//  UITest
//
//  Created by miyamoto masaru on 2015/04/16.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import "SetField.h"

@implementation SetField


//クラス内の値の保存
//絶対に外部参照すんなよ！？
int a1,b1,e1;
int a2,b2,e2;

- (void)firstSet :(UIView *)oya
{
    ViewClass *formula1 = [[ViewClass alloc] initWithPosition:91:123];
    
    //oya に　formula1　を追加、表示
//    [formula1 setVariable:1 :2 :3];
    [formula1 chengeMode:1];
    [oya addSubview:formula1];
    
    ViewClass *formula2 = [[ViewClass alloc] initWithPosition:91:252];
    //oya に　formula2　を追加、表示
//    [formula2 setVariable:1 :2 :3];
    [formula2 chengeMode:1];
    [oya addSubview:formula2];
    
    /*****おもちゃ箱に式のデータを保存*****/
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSMutableArray *f1 = [NSMutableArray arrayWithObjects:formula1.A ,formula1.Code, formula1.B, formula1.E, nil];
    [appDelegate.toyBox setObject:f1 forKey:@"formula1"];
    
    NSMutableArray *f2 = [NSMutableArray arrayWithObjects:formula2.A , formula2.Code, formula2.B, formula2.E, nil];
    [appDelegate.toyBox setObject:f2 forKey:@"formula2"];
    
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"formula1", @"formula2", nil];
    [appDelegate.toyBox setObject:list forKey:@"list"];
    /**********/
    
}

- (void)secondSet :(UIView *)oya
{
    ViewClass *formula1 = [[ViewClass alloc] initWithPosition: 91: 123 + 768];
    //oya に　formula1　を追加、表示
    
    [self getVal:@"formula1"];
    [formula1 setVariable: a1: b1: e1];
    [formula1 chengeMode:2];
    [oya addSubview:formula1];
    
    //    NSLog(@"-------------");
    ViewClass *formula2 = [[ViewClass alloc] initWithPosition: 91: 252 + 768];
    //oya に　formula2　を追加、表示
    
    [self getVal:@"formula2"];
    [formula2 setVariable: a2: b2: e2];
    [formula2 chengeMode:2];
    [oya addSubview:formula2];
    
    /*****おもちゃ箱に式のデータを保存*****/
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate initToyBox];
    NSMutableArray *f1 = [NSMutableArray arrayWithObjects:formula1.A, formula1.Mul, nil];
    [appDelegate.toyBox setObject:f1 forKey:@"formula1"];
    NSMutableArray *f2 = [NSMutableArray arrayWithObjects:formula2.A, formula2.Mul, nil];
    [appDelegate.toyBox setObject:f2 forKey:@"formula2"];
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"formula1", @"formula2", nil];
    [appDelegate.toyBox setObject:list forKey:@"list"];
    NSMutableArray *f = [NSMutableArray arrayWithObjects:formula1, formula2, nil];
    [appDelegate.toyBox setObject:f forKey:@"formula"];
    /**********/
    
    [appDelegate setUpdateMode:@"upDate1"];
}


- (void)thirdSet :(UIView *)oya :(ViewClass *)view
{
    //求めた一方解　[view] を表示する
    ViewClass *View = [[ViewClass alloc] init];
    NSLog(@"view.position = %f",view.frame.origin.y);
    View = [View copyWithPosition:view :91 :100 + 768 + 768];
    NSLog(@"View.position = %f",view.frame.origin.y);
    [oya addSubview:View];
    
    ViewClass *formula1 = [[ViewClass alloc] initWithPosition: 91: 268 + 768 +768];
    //oya に　formula1　を追加、表示
    
    [formula1 setVariable: a1: b1: e1];
//    [formula1 chengeMode:2];
    [oya addSubview:formula1];
    
    ViewClass *formula2 = [[ViewClass alloc] initWithPosition: 91: 397 + 768 +768];
    //oya に　formula2　を追加、表示
    
    [formula2 setVariable: a2: b2: e2];
//    [formula2 chengeMode:2];
    [oya addSubview:formula2];
    
    /*****おもちゃ箱に式のデータを保存*****/
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    /**********/
    
    [appDelegate setUpdateMode:@"upDate4"];
}


//大域変数に格納　原則secondSet内でのみの呼び出し
- (void)getVal :(NSString *)str
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableArray *member = [appDelegate.toyBox objectForKey:str];
    
    UILabel *la = member[0];
    UILabel *lc = member[1];
    UILabel *lb = member[2];
    UILabel *le = member[3];
    
    int a = (int)[la.text integerValue];
    
    int b = (int)[lb.text integerValue];
    if( [lc.text hasPrefix:@"-"]){
        b = -1 * b;
    }
    
    int e = (int)[le.text integerValue];
    
    if([str hasPrefix:@"formula1"]){
        a1 = a;
        b1 = b;
        e1 = e;
    }else{
        a2 = a;
        b2 = b;
        e2 = e;
    }
    
}
@end
