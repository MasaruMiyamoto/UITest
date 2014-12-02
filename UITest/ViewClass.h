//
//  ViewClass.h
//  UITest
//
//  Created by MasaruMiyamoto on 2014/11/18.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewClass : UIView
//外部参照できる用にする
@property(nonatomic, readonly)UILabel* label1;
@property(nonatomic, readonly)UILabel* label2;
@property(nonatomic, readonly)UILabel* label3;


@end
