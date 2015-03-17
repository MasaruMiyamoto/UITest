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
#define lenge 30

#define custom colorWithRed:0.95 green:0.9 blue:0.0 alpha:1.0

@implementation SetButton

UILabel *btn,
        *btn0,
        *btn1,
        *btn2,
        *btn3,
        *btn4,
        *btn5,
        *btn6,
        *btn7,
        *btn8,
        *btn9,
        *btn_m;

UIImageView *img,
            *del;

AppDelegate *appDelegate;

int IsUpdate;

@synthesize btn;
@synthesize img;
@synthesize tmp;


-(id)init
{
    self = [super init];
    self.frame = CGRectMake(0, 0, side + during*2, side+during*4);
//    self.backgroundColor = [UIColor redColor];
    
    btn1 = [[UILabel alloc] init];
    btn1.userInteractionEnabled = YES;
    btn1.textAlignment = NSTextAlignmentCenter;
    btn1.font = [UIFont systemFontOfSize:50];
    btn1.frame = CGRectMake(locx,locy+during+during,side,side);
    btn1.text = @"1";
    btn1.backgroundColor = [UIColor custom];
    [self addSubview:btn1];
    
    btn2 = [[UILabel alloc] init];
    btn2.userInteractionEnabled = YES;
    btn2.textAlignment = NSTextAlignmentCenter;
    btn2.font = [UIFont systemFontOfSize:50];
    btn2.frame = CGRectMake(locx+during,locy+during+during,side,side);
    btn2.text = @"2";
    btn2.backgroundColor = [UIColor custom];
    [self addSubview:btn2];
    
    btn3 = [[UILabel alloc] init];
    btn3.userInteractionEnabled = YES;
    btn3.textAlignment = NSTextAlignmentCenter;
    btn3.font = [UIFont systemFontOfSize:50];
    btn3.frame = CGRectMake(locx+during+during,locy+during+during,side,side);
    btn3.text = @"3";
    btn3.backgroundColor = [UIColor custom];
    [self addSubview:btn3];
    
    btn4 = [[UILabel alloc] init];
    btn4.userInteractionEnabled = YES;
    btn4.textAlignment = NSTextAlignmentCenter;
    btn4.font = [UIFont systemFontOfSize:50];
    btn4.frame = CGRectMake(locx,locy+during,side,side);
    btn4.text = @"4";
    btn4.backgroundColor = [UIColor custom];
    [self addSubview:btn4];
    
    btn5 = [[UILabel alloc] init];
    btn5.userInteractionEnabled = YES;
    btn5.textAlignment = NSTextAlignmentCenter;
    btn5.font = [UIFont systemFontOfSize:50];
    btn5.frame = CGRectMake(locx+during,locy+during,side,side);
    btn5.text = @"5";
    btn5.backgroundColor = [UIColor custom];
    [self addSubview:btn5];
    
    btn6 = [[UILabel alloc] init];
    btn6.userInteractionEnabled = YES;
    btn6.textAlignment = NSTextAlignmentCenter;
    btn6.font = [UIFont systemFontOfSize:50];
    btn6.frame = CGRectMake(locx+during+during,locy+during,side,side);
    btn6.text = @"6";
    btn6.backgroundColor = [UIColor custom];
    [self addSubview:btn6];
    
    btn7 = [[UILabel alloc] init];
    btn7.userInteractionEnabled = YES;
    btn7.textAlignment = NSTextAlignmentCenter;
    btn7.font = [UIFont systemFontOfSize:50];
    btn7.frame = CGRectMake(locx,locy,side,side);
    btn7.text = @"7";
    btn7.backgroundColor = [UIColor custom];
    [self addSubview:btn7];
    
    btn8 = [[UILabel alloc] init];
    btn8.userInteractionEnabled = YES;
    btn8.textAlignment = NSTextAlignmentCenter;
    btn8.font = [UIFont systemFontOfSize:50];
    btn8.frame = CGRectMake(locx+during,locy,side,side);
    btn8.text = @"8";
    btn8.backgroundColor = [UIColor custom];
    [self addSubview:btn8];
    
    btn9 = [[UILabel alloc] init];
    btn9.userInteractionEnabled = YES;
    btn9.textAlignment = NSTextAlignmentCenter;
    btn9.font = [UIFont systemFontOfSize:50];
    btn9.frame = CGRectMake(locx+during+during,locy,side,side);
    btn9.text = @"9";
    btn9.backgroundColor = [UIColor custom];
    [self addSubview:btn9];
    
    btn0 = [[UILabel alloc] init];
    btn0.userInteractionEnabled = YES;
    btn0.textAlignment = NSTextAlignmentCenter;
    btn0.font = [UIFont systemFontOfSize:50];
    btn0.frame = CGRectMake(locx + during/2,locy+during+during+during,side,side);
    btn0.text = @"0";
    btn0.backgroundColor = [UIColor custom];
    [self addSubview:btn0];
    
    btn_m = [[UILabel alloc] init];
    btn_m.userInteractionEnabled = YES;
    btn_m.textAlignment = NSTextAlignmentCenter;
    btn_m.font = [UIFont systemFontOfSize:50];
    btn_m.frame = CGRectMake(locx +during+ during/2,locy+during+during+during,side,side);
    btn_m.text = @"-";
    btn_m.backgroundColor = [UIColor custom];
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
    
   appDelegate = [[UIApplication sharedApplication] delegate];
    
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

- (void)move :(int)x :(int)y
{
    
    self.frame = CGRectOffset(self.frame,x, y);
//    btn1.frame = CGRectMake(x,y+during+during,side,side);
//    btn2.frame = CGRectMake(x+during,y+during+during,side,side);
//    btn3.frame = CGRectMake(x+during+during,y+during+during,side,side);
//    btn4.frame = CGRectMake(x,y+during,side,side);
//    btn5.frame = CGRectMake(x+during,y+during,side,side);
//    btn6.frame = CGRectMake(x+during+during,y+during,side,side);
//    btn7.frame = CGRectMake(x,y,side,side);
//    btn8.frame = CGRectMake(x+during,y,side,side);
//    btn9.frame = CGRectMake(x+during+during,y,side,side);
//    btn0.frame = CGRectMake(x + during/2,y+during+during+during,side,side);
//    btn_m.frame = CGRectMake(x +during+ during/2,y+during+during+during,side,side);
//    del.frame = CGRectMake(x+during, y+during+during+during+during, side,side);

}

- (id)labelCopy :(int)a
{
    
    switch (a) {
        case 1:
            btn = [self deepLabelCopy:btn1];
            break;
        case 2:
            btn = [self deepLabelCopy:btn2];
            break;
        case 3:
            btn = [self deepLabelCopy:btn3];
            break;
        case 4:
            btn = [self deepLabelCopy:btn4];
            break;
        case 5:
            btn = [self deepLabelCopy:btn5];
            break;
        case 6:
            btn = [self deepLabelCopy:btn6];
            break;
        case 7:
            btn = [self deepLabelCopy:btn7];
            break;
        case 8:
            btn = [self deepLabelCopy:btn8];
            break;
        case 9:
            btn = [self deepLabelCopy:btn9];
            break;
        case 10:
            btn = [self deepLabelCopy:btn0];
            break;
        case 11:
            btn = [self deepLabelCopy:btn_m];
            break;
        case 12:
            img = [self deepImageCopy:del];
            [self setBack:img];
            return img;
            break;
        default:
            btn = [self labelReset];
            break;
    }
    [self setBack:btn];
    return btn;
}

- (UILabel *)deepLabelCopy:(UILabel *)label
{
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:label.frame];
    duplicateLabel.text = label.text;
    duplicateLabel.textAlignment = NSTextAlignmentCenter;
    duplicateLabel.font = [UIFont systemFontOfSize:50];
    duplicateLabel.tag  = label.tag;
    duplicateLabel.backgroundColor = [UIColor custom];
    //    NSLog(@"DEEP");
    
    return duplicateLabel;
}

- (UIImageView *)deepImageCopy :(UIImageView *)image
{
    UIImageView *duplicateImage = [[UIImageView alloc] initWithFrame:image.frame];
    duplicateImage.image = image.image;
    duplicateImage.tag = image.tag;
    return duplicateImage;
}

- (UILabel *)labelReset
{
    UILabel *resetLabel = [[UILabel alloc] init];
    return resetLabel;
}

- (void)setBack:(UIView *)obj
{
//    tmp = CGPointMake(self.frame.origin.x + obj.center.x, self.frame.origin.y + obj.center.y);
    
    tmp = CGPointMake(obj.center.x, obj.center.y);
    
//    NSLog(@"%f",self.frame.origin.x);
}

- (void)back
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    btn.center = tmp;
    [UIView commitAnimations];
}

- (void)setUpdateMode:(NSString *)mode
{
    int x;
    if([mode isEqualToString:@"upDate"]){
        [appDelegate upDate];
        x = 1;
    }
    else if([mode isEqualToString:@"upDate2"])
        x = 2;
    else if([mode isEqualToString:@"upDate3"])
        x = 3;
    else
        x = 0;
    IsUpdate = x;
}


/*****タップ操作*****/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [btn removeFromSuperview];
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch previousLocationInView:self];
    
//    NSLog(@"%ld",(long)touch.view.tag);
//    NSLog(@"%f,%f",location.x,location.y);

    btn = [self labelCopy:(int)touch.view.tag];
    btn.center = CGPointMake(location.x, location.y);
    [self addSubview:btn];
    
//    NSLog(@"view");

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    btn.center = CGPointMake(location.x, location.y);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    NSMutableArray *list = [appDelegate.toyBox objectForKey:@"list"];
    for (NSString *str in list) {
//        NSLog(@"Throgh");
        [self isTrriger :str];
    }
    [self back];
    
    switch (IsUpdate) {
        case 1:
            [appDelegate upDate];
            break;
            
        case 2:
            [appDelegate upDate2];
            break;
            
        case 3:
            [appDelegate upDate3];
            break;
            
        default:
            break;
    }
    
}

/*****タップ操作　ここまで*****/

- (void)isTrriger :(NSString *)str{
    BOOL isCode = false;
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableArray *fmember = [appDelegate.toyBox objectForKey:str];
    for (UILabel *member in fmember){
        
        CGPoint convertStr = [self convertPoint:member.center fromView:[fmember objectAtIndex:0]];
        
//        NSLog(@"%@",str);
        NSLog(@"str %@",NSStringFromCGPoint(convertStr));
        NSLog(@"btn %@",NSStringFromCGRect(btn.frame));
        
        if(CGRectContainsPoint(btn.frame, convertStr)){
            
//            NSLog(@"In App");
//            member.text = [NSString stringWithFormat:@"%@",btn.text];
            if(member.tag == 0){
                break;
            }
            if(member.tag != 4){
//                NSLog(@"tag");
                member.text = [self chengeMember:member.text :btn.tag];
                
                if(member.tag == 2){
                    if([member.text hasPrefix:@"-"]){
                        member.text = [member.text substringFromIndex:1];
                        isCode = true;
                    }
                }
                
            }
        }
    }
    if(isCode){
        for (UILabel *member in fmember){
            if (member.tag == 4 ){
                if([member.text isEqualToString:@"+"]){
                    member.text = @"-";
                }else{
                    member.text = @"+";
                }
            }
        }
    }
}

- (NSString *)chengeMember :(NSString *)x :(NSInteger)y{
    NSString *a = [NSString stringWithFormat:@"%ld",(long)y];
    
    if(y == 10){
        a = @"0";
    }
    
    if(y == 11){
        a = @"-";
        if(![x hasPrefix:@"0"] && ![x hasPrefix:@"-"]){
//            NSLog(@"1");
            [btn removeFromSuperview];
            return x = [@"-" stringByAppendingString:x];
        }else if([x hasPrefix:@"-"]){
//            NSLog(@"2");
            [btn removeFromSuperview];
            return [x substringFromIndex:1];
        }else{
//            NSLog(@"3");
            return x;
        }
    }
    
    if(y == 12){
        [btn removeFromSuperview];
        return x = @"";
    }
    
    if([x isEqualToString:@"0"] && y == 10){
        return x;
    }
    
    if([x hasPrefix:@"0"]){
        x = [x stringByAppendingString:a];
        [btn removeFromSuperview];
        return [x substringFromIndex:1];
    }
    
    [btn removeFromSuperview];
    return [x stringByAppendingString:a];
}

@end
