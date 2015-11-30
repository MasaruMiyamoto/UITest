//
//  ViewClass.h
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AnimationClass.h"
#include "CommonMethod.h"

//式の作成用クラス(予定)
@interface ViewClass : UIView

//外部参照できるようにする
@property(nonatomic, readonly)UILabel *A;
@property(nonatomic, readonly)UILabel *B;
@property(nonatomic, readonly)UILabel *E;

@property(nonatomic, readonly)UILabel *X;
@property(nonatomic, readonly)UILabel *Y;
@property(nonatomic, readonly)UILabel *Equal;
@property(nonatomic, readonly)UILabel *Code;

@property(nonatomic, readonly)UILabel *Mul;

@property(nonatomic, readonly)int ValA;
@property(nonatomic, readonly)int ValB;
@property(nonatomic, readonly)int ValE;

@property(nonatomic, readonly)CGPoint tmp;



- (id)initWithPosition:(int)x :(int)y;

- (void)changeMode:(NSString *)mode;
//- (void)changeMode:(NSString *)mode :(ViewClass *)main;

- (void)setVariable:(int)a :(int)b :(int)e;
- (void)setResult:(int)val :(int)con;

//ラベルの動作可能判定と不可判定
- (void)canMoving :(NSString *)str;
//- (void)cannotMoving :(NSString *)str;

- (void)upDate;
//- (void)upDate2;

//クラスの値のコピーとselfの位置の設定
- (ViewClass *)copyWithPosition: (ViewClass *)origin :(int)x :(int)y;

//枠線の無効
- (void)resetBorder :(UILabel *)origin;

//計算チェック
- (BOOL)checkSum;
- (BOOL)checkDiv :(NSString *)str;
- (BOOL)checkMul;

- (void)substitution;
//一方解の判定
- (BOOL)isXY;

@end
