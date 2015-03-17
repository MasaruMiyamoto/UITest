//
//  SelectButtons.m
//  UITest
//
//  Created by miyamoto masaru on 2015/02/19.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import "SelectButtons.h"

#define width 150
#define height 80
@implementation SelectButtons

@synthesize Sel1;
@synthesize Sel2;

UIButton *Sel1;
UIButton *Sel2;
UIButton *Random;
UIButton *Start;

- (id)init
{
    self = [super init];
    self.frame = CGRectMake(0, 0, width*2, height*3 + 70);
    [self setSelects];
    return self;
}

- (id)initWithPosition :(int)x :(int)y
{
    self = [super init];
    self.frame = CGRectMake(0, 0, width*2, height*3 + 70);
//    self.backgroundColor = [UIColor whiteColor];
    [self setSelects];
    [self move:x :y];
    return self;
}

- (void)setSelects
{
    Sel1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Sel1.frame = CGRectMake(0, 0, width, height);
    [Sel1.titleLabel setFont:[UIFont systemFontOfSize:35]];
    Sel1.backgroundColor = [UIColor colorWithRed:1.0 green:0.36 blue:0.22 alpha:1.0];
    [Sel1 setTitle:@"加減法" forState:UIControlStateNormal];
    [Sel1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Sel1 addTarget:self action:@selector(sel1Action:) forControlEvents:UIControlEventTouchUpInside];
    Sel1.alpha = 0.6;
    
    Sel2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Sel2.frame = CGRectMake(0, 0, width, height);
    [Sel2.titleLabel setFont:[UIFont systemFontOfSize:35]];
    Sel2.backgroundColor = [UIColor colorWithRed:0.0 green:0.47 blue:1.0 alpha:1.0];
    [Sel2 setTitle:@"代入法" forState:UIControlStateNormal];
    [Sel2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Sel2 addTarget:self action:@selector(sel2Action:) forControlEvents:UIControlEventTouchUpInside];
    Sel2.alpha = 0.6;
    
    Start = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Start.frame = CGRectMake(0, 0, 250, 110);
    [Start.titleLabel setFont:[UIFont systemFontOfSize:50]];
    Start.backgroundColor = [UIColor colorWithRed:0.62 green:0.07 blue:0.15 alpha:1.0];
    [Start setTitle:@"けいさん!" forState:UIControlStateNormal];
    [Start setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [Start addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    
    Random = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Random.frame = CGRectMake(0, 0, width, height);
    [Random.titleLabel setFont:[UIFont systemFontOfSize:35]];
    Random.backgroundColor = [UIColor colorWithRed:1.0 green:0.47 blue:1.0 alpha:1.0];
    [Random setTitle:@"もんだい" forState:UIControlStateNormal];
    [Random setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [Random addTarget:self action:@selector(randomAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setLocation];
    
    [self addSubview:Sel1];
    [self addSubview:Sel2];
    [self addSubview:Start];
    [self addSubview:Random];
}

- (void)setLocation
{
    Random.frame = CGRectOffset(Random.frame, 75, 0);
    Sel1.frame = CGRectOffset(Sel1.frame, 0, 100);
    Sel2.frame = CGRectOffset(Sel2.frame, 150, 100);
    Start.frame = CGRectOffset(Start.frame, 25, 200);
}

- (void)move :(int)x :(int)y
{
    self.frame = CGRectOffset(self.frame, x, y);
}
/*****ボタンアクション*****/
-(void)sel1Action :(id)sender
{
//    NSLog(@"push");
    Sel1.alpha = 1.0;
    Sel2.alpha = 0.6;
}

-(void)sel2Action :(id)sender
{
//    NSLog(@"push2");
    Sel1.alpha = 0.6;
    Sel2.alpha = 1.0;
}

- (void)btnPushed:(id)mainView{
    [Start addTarget:mainView action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
}



-(void)randomAction :(id)mainView
{
//        NSLog(@"random");
    [Random addTarget:mainView action:@selector(randomAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)dontSelects:(id)mainView
{
    Sel1.userInteractionEnabled = NO;
    Sel2.userInteractionEnabled = NO;
    Random.userInteractionEnabled = NO;
    [Start setTitle:@"やりなおし" forState:UIControlStateNormal];
    
    [Start removeTarget:mainView action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [Start addTarget:mainView action:@selector(reStart:) forControlEvents:UIControlEventTouchUpInside];
}


@end
