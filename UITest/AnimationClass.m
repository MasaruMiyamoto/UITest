//
//  AnimationClass.m
//  UITest
//
//  Created by miyamoto masaru on 2015/05/22.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import "AnimationClass.h"

@implementation AnimationClass

//**********アニメーション関係**********//

//移動アニメーション
//相対移動
+ (void)moveAnime :(UIView *)lbl :(int)x :(int)y
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    lbl.frame = CGRectOffset(lbl.frame, x, y);
    [UIView commitAnimations];
}

//絶対移動
+ (void)movePosition :(UIView *)lbl :(int)x :(int)y
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.7];
    lbl.frame = CGRectMake(x, y, lbl.frame.size.width, lbl.frame.size.height);
    [UIView commitAnimations];
}

//フェードイン、アウト
//xは反映したいオブジェクト、yは透明度(0~1.0)
+ (void)fadeIn :(id)x :(double)y
{
    UILabel *z = (UILabel *)x;
    //フェードイン
    z.alpha = y;
    //アニメーションのタイプを指定
    [UIView beginAnimations:@"fadeIn" context:nil];
    //イージング指定
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //アニメーション秒数を指定
    [UIView setAnimationDuration:0.7];
    //目標のアルファ値を指定
    z.alpha = 1;
    //アニメーション実行
    [UIView commitAnimations];
}

+ (void)fadeOut :(id)x :(double)y
{
    UILabel *z = (UILabel *)x;
    //フェードアウト
    [UIView beginAnimations:@"fadeOut" context:nil];
    //イージング指定
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    //アニメーション秒数を指定
    [UIView setAnimationDuration:0.7];
    //目標のアルファ値を指定
    z.alpha = y;
    [UIView setAnimationDelay:0.5];
    //アニメーション実行
    [UIView commitAnimations];
}

//遅延処理
+ (void) delay :(int)time
{
    int interval = 0;
    while(interval != time){
        [[NSRunLoop currentRunLoop]runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.9f]];
        interval = interval +1 ;
    }
}

@end
