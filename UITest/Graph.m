//
//  Graph.m
//  UITest
//
//  Created by miyamoto masaru on 2016/01/25.
//  Copyright (c) 2016年 MasaruMiyamoto. All rights reserved.
//

#import "Graph.h"
#import "ViewClass.h"

#define Width 1024/1.1
#define Height 756/1.1

@implementation Graph

int a1,b1,e1;
int a2,b2,e2;

int ansX,ansY;

UIView *view1, *view2;
UILabel *Parenthesis, *Parenthesis2, *Yajirusi1;
AnswerClass *ans;
CreateField *field;

- (id)init{
    
    self = [super init];
    NSLog(@"call graph");
    self.frame = CGRectMake((1024 - Width)/2 + 5, (756 - Height)/2, Width, Height);
    self.backgroundColor = [UIColor graphColor];
    
    [self setCloseButton];
    
    return self;
}

- (void)setCloseButton
{
    UIButton *Close = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Close.frame = CGRectMake(self.frame.size.width - 45, 0, 45, 45);
    [Close.titleLabel setFont:[UIFont systemFontOfSize:35]];
    Close.backgroundColor = [UIColor redColor];
    [Close setTitle:@"×" forState:UIControlStateNormal];
    [Close setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Close addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    Close.alpha = 0.75;
    
    [self addSubview:Close];
}

- (void)initFormula :(ViewClass *)f1 :(ViewClass *)f2
{
//    f1.backgroundColor = [UIColor yellowColor];
    
    /****************元の式の表示*******************/
    view1 = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - f1.frame.size.width + 100, 60, f1.frame.size.width - 100, f1.frame.size.height + viewDist)];
//    view1.backgroundColor = [UIColor blueColor];
    
    [f2 move:0 :viewDist/2];
    
    Parenthesis = [[UILabel alloc] init];
    Parenthesis.textAlignment = NSTextAlignmentCenter;
    Parenthesis.font = [UIFont systemFontOfSize:120];
    Parenthesis.adjustsFontSizeToFitWidth = YES;
    Parenthesis.minimumScaleFactor = 20/50;
//    Parenthesis.backgroundColor = [UIColor redColor];
    
    Parenthesis.text = @"{";
    Parenthesis.textColor = [UIColor whiteChokeColor];
    
    Parenthesis.frame = CGRectMake(-30, -42, 50, 200);
    
    [view1 addSubview:f1];
    [view1 addSubview:f2];
    [view1 addSubview:Parenthesis];
    [self addSubview:view1];
    /*********************************************/
    
    
    Yajirusi1 = [[UILabel alloc] init];
    Yajirusi1.textAlignment = NSTextAlignmentCenter;
    Yajirusi1.font = [UIFont systemFontOfSize:80];
    Yajirusi1.adjustsFontSizeToFitWidth = YES;
    Yajirusi1.minimumScaleFactor = 20/50;
    //    Parenthesis.backgroundColor = [UIColor redColor];
    
    Yajirusi1.text = @"↓";
    Yajirusi1.textColor = [UIColor whiteChokeColor];
    
    Yajirusi1.frame = CGRectMake(view1.frame.origin.x + 150, view1.frame.origin.y + 150, 80, 20);
    [self addSubview:Yajirusi1];
    
    /****************グラフの式の表示*******************/
    view2 = [[UIView alloc] initWithFrame:CGRectMake(view1.frame.origin.x, view1.frame.origin.y + 220, view1.frame.size.width, view1.frame.size.height)];
//    view2.backgroundColor = [UIColor blueColor];
    
    ViewClass *f3 = [[ViewClass alloc] init];
    f3 = [f3 copyWithPosition: f1: f1.frame.origin.x: f1.frame.origin.y];

    ViewClass *f4 = [[ViewClass alloc] init];
    f4 = [f4 copyWithPosition: f2: f2.frame.origin.x: f2.frame.origin.y + 50];
    
    
    Parenthesis2 = [[UILabel alloc] init];
    Parenthesis2.textAlignment = NSTextAlignmentCenter;
    Parenthesis2.font = [UIFont systemFontOfSize:120];
    Parenthesis2.adjustsFontSizeToFitWidth = YES;
    Parenthesis2.minimumScaleFactor = 20/50;
    
    Parenthesis2.text = @"{";
    Parenthesis2.textColor = [UIColor whiteChokeColor];
//    Parenthesis2.backgroundColor = [UIColor redColor];
    
    Parenthesis2.frame = CGRectOffset(Parenthesis.frame, 0, 30);
    
    
    [f3 changeMode:@"graphFormulaMode"];
    [f4 changeMode:@"graphFormulaMode"];
    
    [view2 addSubview:f3];
    [view2 addSubview:f4];
    [view2 addSubview:Parenthesis2];
    [self addSubview:view2];
    /*********************************************/
    
    
    /****************解の表示*******************/
    
    ans = [[AnswerClass alloc] initWithPosition: 100: view2.frame.origin.y + 220];
    [ans setXY:ansX :ansY];
    [ans selectMode:@"Parenthesis"];
    [self addSubview:ans];
    
    /*********************************************/
    
    
    /*****************グラフの表示*******************/
    field = [[CreateField alloc] initWithFrame:CGRectMake(0, 0, 450, 450)];
//    field.backgroundColor = [UIColor redColor];
    [[field layer] setBorderColor:[[UIColor whiteChokeColor] CGColor]];
    [[field layer] setBorderWidth:1.5];
    
    
    [field setPoint:a1 :b1 :e1 :1];
    [field setPoint:a2 :b2 :e2 :2];
    
    [self addSubview:field];
    /*********************************************/
    
    
//    view1.alpha = 0;
//    view2.alpha = 0;
//    Parenthesis.alpha = 0;
//    Parenthesis2.alpha = 0;
//    Yajirusi1.alpha = 0;
//    ans.alpha = 0;
//    field.alpha = 0;
    
    
}

- (void)closeAction :(id)sender
{
//    NSLog(@"push");
    
    [AnimationClass fadeOut:self :0];
    [AnimationClass delay:2];
    [self removeFromSuperview];

}

- (void)setPoint :(int)a :(int)b :(int)c :(int)x :(int)y :(int)z
{
    a1 = a;
    b1 = b;
    e1 = c;
    
    a2 = x;
    b2 = y;
    e2 = z;
}

- (void) getAns :(int)x :(int)y
{
    ansX = x;
    ansY = y;
}

- (void) animationGraph
{
//    [AnimationClass fadeIn:view1 :0];
//    [AnimationClass delay:1];
//    
//    [AnimationClass fadeIn:Yajirusi1 :0];
//    [AnimationClass delay:1];
//    
//    [AnimationClass fadeIn:view2 :0];
//    [AnimationClass delay:1];
//    
//    [AnimationClass fadeIn:field :0];
//    [AnimationClass delay:1];
//    
//    [AnimationClass fadeIn:ans :0];
    
    
    double y = self.frame.origin.y;
    
    self.frame = CGRectMake(self.frame.origin.x, -(self.frame.origin.y + self.frame.size.height), self.frame.size.width, self.frame.size.height);
    
    [AnimationClass movePosition:self :self.frame.origin.x :y];
    
    
    
}
@end
