//
//  ViewClass.h
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

//式の作成用クラス(予定)
@interface ViewClass : UIView

//外部参照できるようにする
@property(nonatomic, readonly)UILabel* A;
@property(nonatomic, readonly)UILabel* B;
@property(nonatomic, readonly)UILabel* E;
@property(nonatomic, readonly)UILabel* X;
@property(nonatomic, readonly)UILabel* Y;
@property(nonatomic, readonly)UILabel* Equal;
@property(nonatomic, readonly)UILabel* Code;

-(id)initWithPosition:(int)x :(int)y;
-(void)setVariable:(int)a :(int)b :(int)e;

@end
