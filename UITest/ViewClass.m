//
//  ViewClass.m
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import "ViewClass.h"

@implementation ViewClass

//クラス内に変数を定義
UILabel* label1;
UILabel* label2;
UILabel* label3;

//@propertyの設定を実装
//@synthesize label1;
//@synthesize label2;
//@synthesize label3;

//クラスの初期化メソッド  
- (id)init{
    self = [super init];
    
    self.frame = CGRectMake(0, 0, 320, 480);
    
    label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(10, 50, 300, 20);
    [self addSubview:label1];
    
    label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(10, 100, 300, 20);
    [self addSubview:label2];
    
    label3 = [[UILabel alloc] init];
    label3.frame = CGRectMake(10, 150, 300, 20);
    [self addSubview:label3];
    
    label1.text = @"LABEL1";
    label2.text = @"LABEL2";
    label3.text = @"LABEL3";
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
