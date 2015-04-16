//
//  RandomClass.m
//  UITest
//
//  Created by miyamoto masaru on 2015/04/16.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import "RandomClass.h"

@implementation RandomClass

- (void)makeRandom
{
    int min = -10;
    int max = 10;
    
    int x,y;
    int a,b,c,d;
    
    int p = -100;
    int q = -100;
    
    while (YES){
        
        x = arc4random_uniform(max + 1 - min) + min;
        y = arc4random_uniform(max + 1 - min) + min;
        
        a = arc4random_uniform(max + 1 - min) + min;
        b = arc4random_uniform(max + 1 - min) + min;
        c = arc4random_uniform(max + 1 - min) + min;
        d = arc4random_uniform(max + 1 - min) + min;
        
        p = a*x + b*y;
        q = c*x + d*y;
//        NSLog(@"p = %d, q = %d",p,q);
        
        if( ((p> -20 && p < 20) && (q <20 && q > -20))
           && (x != 0 && y != 0 && a != 0 && b != 0 && c != 0 && d != 0))
            break;
    }
    
    //    NSLog(@"p = %d, q = %d",p,q);
    NSLog(@"a = %d, b = %d, p = %d",a,b,p);
    NSLog(@"c = %d, d = %d, q = %d",c,d,q);
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSMutableArray *member = [appDelegate.toyBox objectForKey:@"formula1"];
    
    UILabel *la1 = member[0];
    UILabel *lc1 = member[1];
    UILabel *lb1 = member[2];
    UILabel *le1 = member[3];
    
    la1.text = [NSString stringWithFormat:@"%d",a];
    
    if(b < 0){
        lc1.text = [NSString stringWithFormat:@"-"];
        b = -1 * b;
    }
    lb1.text = [NSString stringWithFormat:@"%d",b];
    
    le1.text = [NSString stringWithFormat:@"%d",p];
    
    
    member = [appDelegate.toyBox objectForKey:@"formula2"];
    
    UILabel *la2 = member[0];
    UILabel *lc2 = member[1];
    UILabel *lb2 = member[2];
    UILabel *le2 = member[3];
    
    la2.text = [NSString stringWithFormat:@"%d",c];
    
    if(d < 0){
        lc2.text = [NSString stringWithFormat:@"-"];
        d = -1 * d;
    }
    lb2.text = [NSString stringWithFormat:@"%d",d];
    
    le2.text = [NSString stringWithFormat:@"%d",q];
}

@end
