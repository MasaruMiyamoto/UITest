//
//  ViewClass.h
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewClass : UIView{
    //クラス内に変数を定義
    UILabel* label1;
    UILabel* label2;
    UILabel* label3;
}
//外部参照できる用にする
@property(nonatomic, readonly)UILabel* label1;
@property(nonatomic, readonly)UILabel* label2;
@property(nonatomic, readonly)UILabel* label3;


@end
