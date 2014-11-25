//
//  SetButton.m
//  UITest
//
//  Created by miyamoto masaru on 2014/11/19.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import "SetButton.h"

#define locx 0
#define locy 0
#define side 70
#define during 79

@implementation SetButton

UILabel *btn,*btn0,*btn1,*btn2,*btn3,*btn4,*btn5,*btn6,*btn7,*btn8,*btn9,*btn_m;
UIImageView *img,*del;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(id)init{
    self = [super init];
    self.frame = CGRectMake(0, 0, 500, 500);
//    self.backgroundColor = [UIColor redColor];
    
    btn1 = [[UILabel alloc] init];
    btn1.userInteractionEnabled = YES;
    btn1.textAlignment = NSTextAlignmentCenter;
    btn1.font = [UIFont systemFontOfSize:50];
    btn1.frame = CGRectMake(locx,locy+during+during,side,side);
    btn1.text = @"1";
    btn1.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn1];
    
    btn2 = [[UILabel alloc] init];
    btn2.userInteractionEnabled = YES;
    btn2.textAlignment = NSTextAlignmentCenter;
    btn2.font = [UIFont systemFontOfSize:50];
    btn2.frame = CGRectMake(locx+during,locy+during+during,side,side);
    btn2.text = @"2";
    btn2.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn2];
    
    btn3 = [[UILabel alloc] init];
    btn3.userInteractionEnabled = YES;
    btn3.textAlignment = NSTextAlignmentCenter;
    btn3.font = [UIFont systemFontOfSize:50];
    btn3.frame = CGRectMake(locx+during+during,locy+during+during,side,side);
    btn3.text = @"3";
    btn3.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn3];
    
    btn4 = [[UILabel alloc] init];
    btn4.userInteractionEnabled = YES;
    btn4.textAlignment = NSTextAlignmentCenter;
    btn4.font = [UIFont systemFontOfSize:50];
    btn4.frame = CGRectMake(locx,locy+during,side,side);
    btn4.text = @"4";
    btn4.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn4];
    
    btn5 = [[UILabel alloc] init];
    btn5.userInteractionEnabled = YES;
    btn5.textAlignment = NSTextAlignmentCenter;
    btn5.font = [UIFont systemFontOfSize:50];
    btn5.frame = CGRectMake(locx+during,locy+during,side,side);
    btn5.text = @"5";
    btn5.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn5];
    
    btn6 = [[UILabel alloc] init];
    btn6.userInteractionEnabled = YES;
    btn6.textAlignment = NSTextAlignmentCenter;
    btn6.font = [UIFont systemFontOfSize:50];
    btn6.frame = CGRectMake(locx+during+during,locy+during,side,side);
    btn6.text = @"6";
    btn6.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn6];
    
    btn7 = [[UILabel alloc] init];
    btn7.userInteractionEnabled = YES;
    btn7.textAlignment = NSTextAlignmentCenter;
    btn7.font = [UIFont systemFontOfSize:50];
    btn7.frame = CGRectMake(locx,locy,side,side);
    btn7.text = @"7";
    btn7.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn7];
    
    btn8 = [[UILabel alloc] init];
    btn8.userInteractionEnabled = YES;
    btn8.textAlignment = NSTextAlignmentCenter;
    btn8.font = [UIFont systemFontOfSize:50];
    btn8.frame = CGRectMake(locx+during,locy,side,side);
    btn8.text = @"8";
    btn8.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn8];
    
    btn9 = [[UILabel alloc] init];
    btn9.userInteractionEnabled = YES;
    btn9.textAlignment = NSTextAlignmentCenter;
    btn9.font = [UIFont systemFontOfSize:50];
    btn9.frame = CGRectMake(locx+during+during,locy,side,side);
    btn9.text = @"9";
    btn9.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn9];
    
    btn0 = [[UILabel alloc] init];
    btn0.userInteractionEnabled = YES;
    btn0.textAlignment = NSTextAlignmentCenter;
    btn0.font = [UIFont systemFontOfSize:50];
    btn0.frame = CGRectMake(locx + during/2,locy+during+during+during,side,side);
    btn0.text = @"0";
    btn0.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn0];
    
    btn_m = [[UILabel alloc] init];
    btn_m.userInteractionEnabled = YES;
    btn_m.textAlignment = NSTextAlignmentCenter;
    btn_m.font = [UIFont systemFontOfSize:50];
    btn_m.frame = CGRectMake(locx +during+ during/2,locy+during+during+during,side,side);
    btn_m.text = @"-";
    btn_m.backgroundColor = [UIColor colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0];
    [self addSubview:btn_m];
    
    del = [[UIImageView alloc] init];
    del.userInteractionEnabled = YES;
    del.frame = CGRectMake(locx+during, locy+during+during+during+during, side,side);
    del.Image = [UIImage imageNamed:@"res.gif"];
    [self addSubview:del];
    
    btn = [[UILabel alloc] init];
    btn.textAlignment = NSTextAlignmentCenter;
    btn.font = [UIFont systemFontOfSize:50];
    
    
    img = [[UIImageView alloc] init];
    
    
    btn1.tag = 1;
    btn2.tag = 2;
    btn3.tag = 3;
    btn4.tag = 4;
    btn5.tag = 5;
    btn6.tag = 6;
    btn7.tag = 7;
    btn8.tag = 8;
    btn9.tag = 9;
    btn0.tag = 10;
    btn_m.tag = 11;
    del.tag = 12;
    
    return self;
}

@end
