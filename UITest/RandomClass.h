//
//  RandomClass.h
//  UITest
//
//  Created by miyamoto masaru on 2015/04/16.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "CommonMethod.h"

@interface RandomClass : NSObject

//数値の保持
@property(nonatomic, readonly)int A;
@property(nonatomic, readonly)int B;
@property(nonatomic, readonly)int C;
@property(nonatomic, readonly)int D;
@property(nonatomic, readonly)int P;
@property(nonatomic, readonly)int Q;

- (int)enterFormula :(NSString *)str;
- (void)enterFormula;
- (BOOL)isIdefinite;
- (int)outAns :(BOOL)xy;

@end
