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

BOOL flag = false;

AppDelegate *appDelegate;

@synthesize btn;
@synthesize img;
@synthesize tmp;


-(id)init
{
    self = [super init];
    self.frame = CGRectMake(0, 0, side + during*2, side+during*4);
//    self.backgroundColor = [UIColor redColor];
    
    
    btn1 = [self setButton:1];
    btn2 = [self setButton:2];
    btn3 = [self setButton:3];
    btn4 = [self setButton:4];
    btn5 = [self setButton:5];
    btn6 = [self setButton:6];
    btn7 = [self setButton:7];
    btn8 = [self setButton:8];
    btn9 = [self setButton:9];
    btn0 = [self setButton:10];
    btn_m = [self setButton:11];
    
    
    del = [[UIImageView alloc] init];
    del.userInteractionEnabled = YES;
    del.frame = CGRectMake(locx+during, locy+during+during+during+during, side,side);
    del.Image = [UIImage imageNamed:@"res.gif"];
    del.tag = 12;
    [self addSubview:del];
    
    btn = [[UILabel alloc] init];
    btn.textAlignment = NSTextAlignmentCenter;
    btn.font = [UIFont systemFontOfSize:50];
    
    
    img = [[UIImageView alloc] init];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    btn1.frame = CGRectMake(locx,locy+during+during,side,side);
    btn2.frame = CGRectMake(locx+during,locy+during+during,side,side);
    btn3.frame = CGRectMake(locx+during+during,locy+during+during,side,side);
    btn4.frame = CGRectMake(locx,locy+during,side,side);
    btn5.frame = CGRectMake(locx+during,locy+during,side,side);
    btn6.frame = CGRectMake(locx+during+during,locy+during,side,side);
    btn7.frame = CGRectMake(locx,locy,side,side);
    btn8.frame = CGRectMake(locx+during,locy,side,side);
    btn9.frame = CGRectMake(locx+during+during,locy,side,side);
    btn0.frame = CGRectMake(locx + during/2,locy+during+during+during,side,side);
    btn_m.frame = CGRectMake(locx +during+ during/2,locy+during+during+during,side,side);
    
    [self isMove:true];
    
    return self;
}

- (UILabel *)setButton :(int)tag
{
    UILabel *origin = [[UILabel alloc] init];
    origin.userInteractionEnabled = YES;
    origin.textAlignment = NSTextAlignmentCenter;
    origin.font = [UIFont fontWithName:@"Palatino" size:50];
//    origin.font = [UIFont systemFontOfSize:50];
    origin.frame = CGRectMake(locx,locy,side,side);
    
    //色
    origin.backgroundColor = [UIColor custom];
    origin.textColor = [UIColor blackColor];
    
    origin.tag = tag;
    
    switch (tag) {
        case 10:
            origin.text = @"0";
            break;
        case 11:
            origin.text = @"-";
            break;
        default:
            origin.text = [NSString stringWithFormat:@"%d",tag];
            break;
    }
    
    [self addSubview:origin];
    
    return origin;
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

- (void)isMove :(BOOL)f
{
    if (!f) {
        
        [AnimationClass fadeOut:btn0 :0.5];
        [AnimationClass fadeOut:btn1 :0.5];
        [AnimationClass fadeOut:btn2 :0.5];
        [AnimationClass fadeOut:btn3 :0.5];
        [AnimationClass fadeOut:btn4 :0.5];
        [AnimationClass fadeOut:btn5 :0.5];
        [AnimationClass fadeOut:btn6 :0.5];
        [AnimationClass fadeOut:btn7 :0.5];
        [AnimationClass fadeOut:btn8 :0.5];
        [AnimationClass fadeOut:btn9 :0.5];
        [AnimationClass fadeOut:btn_m :0.5];
        [AnimationClass fadeOut:del :0.5];
        
    }else{
        
        [AnimationClass fadeIn:btn0 :btn0.alpha];
        [AnimationClass fadeIn:btn1 :btn1.alpha];
        [AnimationClass fadeIn:btn2 :btn2.alpha];
        [AnimationClass fadeIn:btn3 :btn3.alpha];
        [AnimationClass fadeIn:btn4 :btn4.alpha];
        [AnimationClass fadeIn:btn5 :btn5.alpha];
        [AnimationClass fadeIn:btn6 :btn6.alpha];
        [AnimationClass fadeIn:btn7 :btn7.alpha];
        [AnimationClass fadeIn:btn8 :btn8.alpha];
        [AnimationClass fadeIn:btn9 :btn9.alpha];
        [AnimationClass fadeIn:btn_m :btn_m.alpha];
        [AnimationClass fadeIn:del :del.alpha];
//        NSLog(@"call true");
        
    }
    
    flag = f;
}

//- (void)

- (BOOL)canMove
{
    return flag;
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
    duplicateLabel.textColor = label.textColor;
    duplicateLabel.textAlignment = NSTextAlignmentCenter;
    
    duplicateLabel.font = [UIFont fontWithName:@"Palatino" size:50];
//    duplicateLabel.font = [UIFont systemFontOfSize:50];
    duplicateLabel.tag  = label.tag;
    duplicateLabel.backgroundColor = label.backgroundColor;
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




/*****タップ操作*****/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [btn removeFromSuperview];
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch previousLocationInView:self];
    
//    NSLog(@"%ld",(long)touch.view.tag);
//    NSLog(@"%f,%f",location.x,location.y);

    if ([self canMove]) {
        
        btn = [self labelCopy:(int)touch.view.tag];
        btn.center = CGPointMake(location.x - 30, location.y - 30);
        
        [self addSubview:btn];
        
    }
//    NSLog(@"view");

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    
    if([self canMove])
    btn.center = CGPointMake(location.x - 30, location.y - 30);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    if([self canMove]){
        NSMutableArray *list = [appDelegate.toyBox objectForKey:@"list"];
        for (NSString *str in list) {
            //        NSLog(@"Throgh");
            [self isTrriger :str];
        }
        
        [appDelegate upDate];
        [self back];
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
//        NSLog(@"str %@",NSStringFromCGPoint(convertStr));
//        NSLog(@"btn %@",NSStringFromCGRect(btn.frame));
        
        if(CGRectContainsPoint(btn.frame, convertStr)){
            
//            NSLog(@"In App");
//            member.text = [NSString stringWithFormat:@"%@",btn.text];
            
            //文字数制限
            if(member.text.length > 3 && btn.tag != 12){
                break;
            }
            
            
            if(member.tag == 0){
                break;
            }
            if(member.tag != 4){
//                NSLog(@"tag");
                member.text = [self chengeMember:member.text :btn.tag];
                
                if(member.tag == 22){
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
