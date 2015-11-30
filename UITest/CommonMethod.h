//
//  CommonMethod.h
//  UITest
//
//  Created by miyamoto masaru on 2015/11/26.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonMethod : NSObject

+ (int)inputInteger :(NSString *)str :(BOOL)flag;
+ (NSString *)outputString :(int)val :(BOOL)flag;


@end
