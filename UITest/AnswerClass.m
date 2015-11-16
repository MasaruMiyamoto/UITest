//
//  AnswerClass.m
//  UITest
//
//  Created by miyamoto masaru on 2015/10/07.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import "AnswerClass.h"


#define CASE(str) if ([__s__ isEqualToString:(str)])
#define SWITCH(s) for (NSString *__s__ = (s); __s__; __s__ = nil)
#define DEFAULT

#define Size 80

UIView *labelX;
UIView *labelY;

@implementation AnswerClass

//クラスの初期化メソッド
- (id)init
{
    self = [super init];
    self.frame = CGRectMake(0, 0, 200, 200);
//    self.backgroundColor = [UIColor cyanColor];
    return self;
}

- (id) initWithPosition:(int)x :(int)y
{
    self = [super init];
    self.frame = CGRectMake(x, y, 200, 200);
//    self.backgroundColor = [UIColor cyanColor];
    return self;
}

//解表示モードの選択
- (void)selectMode :(NSString *)mode
{
    SWITCH (mode) {
        
        CASE (@"Parenthesis"){
            [self setParenthesis];
            break;
        }
        
        DEFAULT {
            NSLog(@"throght default");
            break;
        }
    }
}



//x ,y への入力(外部参照)
- (void)setXY :(int)X :(int)Y
{
    labelX = [self setLabel:X :@"x"];
    labelY = [self setLabel:Y :@"y"];
}

//解の生成
- (UIView *)setLabel :(int)a :(NSString *)str
{
    UIView *origin = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 258, 168)];
    
    //A
    UILabel *A = [[UILabel alloc] init];
    A.textAlignment = NSTextAlignmentCenter;
    A.font = [UIFont fontWithName:@"Palatino-Italic" size:50];
//    A.font = [UIFont systemFontOfSize:50];
    A.frame = CGRectMake(0, 0, 80, 80);
    A.adjustsFontSizeToFitWidth = YES;
    A.minimumScaleFactor = 20/50;
    
    //=
    UILabel *Equal = [[UILabel alloc] init];
    Equal.textAlignment = NSTextAlignmentCenter;
    Equal.font = [UIFont fontWithName:@"Palatino" size:45];
//    Equal.font = [UIFont systemFontOfSize:45];
    Equal.adjustsFontSizeToFitWidth = YES;
    Equal.minimumScaleFactor = 20/50;
    
    //E
    UILabel *E = [[UILabel alloc] init];
    E.textAlignment = NSTextAlignmentCenter;
    E.font = [UIFont fontWithName:@"Palatino" size:50];
//    E.font = [UIFont systemFontOfSize:50];
    E.adjustsFontSizeToFitWidth = YES;
    E.minimumScaleFactor = 20/50;
    
    A.text = str;
    Equal.text = @"=";
    E.text = [NSString stringWithFormat:@"%d",a];
    
    A.textColor = [UIColor whiteChokeColor];
    Equal.textColor = [UIColor whiteChokeColor];
    E.textColor = [UIColor whiteChokeColor];
    
    A.frame = CGRectMake(0, 0, Size, Size);
    Equal.frame = CGRectMake(A.frame.origin.x + 50, 0, Size, Size);
    E.frame = CGRectMake(Equal.frame.origin.x + 70, 0, Size, Size);
    
    [origin addSubview:A];
    [origin addSubview:Equal];
    [origin addSubview:E];
    
    return origin;
}

//中括弧を使った表示
- (void)setParenthesis
{
    UILabel *Parenthesis = [[UILabel alloc] init];
    Parenthesis.textAlignment = NSTextAlignmentCenter;
    Parenthesis.font = [UIFont systemFontOfSize:150];
    Parenthesis.adjustsFontSizeToFitWidth = YES;
    Parenthesis.minimumScaleFactor = 20/50;
    
    Parenthesis.text = @"{";
    Parenthesis.textColor = [UIColor whiteChokeColor];
    
    Parenthesis.frame = CGRectMake(0, -27, 50, 200);
    labelX.frame = CGRectMake(58, 0, labelX.frame.size.width, labelX.frame.size.height);
    labelY.frame = CGRectMake(58, 88, labelY.frame.size.width, labelY.frame.size.height);
    
    [self addSubview:Parenthesis];
    [self addSubview:labelX];
    [self addSubview:labelY];
    
}
@end
