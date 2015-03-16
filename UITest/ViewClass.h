//
//  ViewClass.h
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "SetButton.h"

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
- (void)chengeMode:(int)mode;
- (void)setVariable:(int)a :(int)b :(int)e;
- (void) setResult:(int)val :(int)con;
- (void)canMoving :(NSString *)str;
- (void)cannotMoving :(NSString *)str;
- (void)upDate;
- (void)upDate2;
-(BOOL)checkSum;
- (ViewClass *)copyWithPosition: (ViewClass *)origin :(int)x :(int)y;
- (void)levelingLabel:(ViewClass *)mine;


@end
