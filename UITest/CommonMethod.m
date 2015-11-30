//
//  CommonMethod.m
//  UITest
//
//  Created by miyamoto masaru on 2015/11/26.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import "CommonMethod.h"

@implementation CommonMethod

//文字抽出時における係数
//trueで空白係数の処理
+ (int)inputInteger :(NSString *)str :(BOOL)flag
{
    if([str isEqualToString:@"-"] || [str isEqualToString:@"+"]){
        str = [str stringByAppendingString:@"1"];
    }
    
    if(flag && [str isEqual:@""]){
        str = @"1";
    }
    
    int val = (int)[str integerValue];
    
//    NSLog(@"input %d",val);
    return val;
}

//文字出力における係数
//trueで空白係数の処理
+ (NSString *)outputString :(int)val :(BOOL)flag
{
    NSString *str;
    
    if(flag){
        if (val == 1) {
            str = @"";
        }else if(val == -1){
            str = @"-";
        }else{
            str = [NSString stringWithFormat:@"%d",val];
        }
    }else{
        str = [NSString stringWithFormat:@"%d",val];
    }
    
//    NSLog(@"output %@",str);
    return str;
}
@end