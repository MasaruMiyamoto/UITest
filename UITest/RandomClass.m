//
//  RandomClass.m
//  UITest
//
//  Created by miyamoto masaru on 2015/04/16.
//  Copyright (c) 2015年 MasaruMiyamoto. All rights reserved.
//

#import "RandomClass.h"


@implementation RandomClass

int A, B, C, D, P, Q;

//ランダム問題にするかどうか。falseならランダム
bool stop = false;

- (id)init
{
    self = [super init];
    if(!stop){
        [self makeRandom];
    }else{
        [self makeValue];
    }
    return self;
}

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
        
        if( ((p> -40 && p < 40) && (q < 40 && q > -40))
           && (x != 0 && y != 0 && a != 0 && b != 0 && c != 0 && d != 0 && p != 0 && q != 0))
            break;
    }
    
    //    NSLog(@"p = %d, q = %d",p,q);
//    NSLog(@"a = %d, b = %d, p = %d",a,b,p);
//    NSLog(@"c = %d, d = %d, q = %d",c,d,q);
    
    
    
    //問題の保持
//    a1 = a;
//    b1 = b;
//    e1 = p;
//    
//    a2 = c;
//    b2 = d;
//    e2 = q;
    
    int gcd1 = [self gcd:[self gcd:a :b] :p];
    int gcd2 = [self gcd:[self gcd:c :d] :q];
    
    
    
    A = a/gcd1;
    B = b/gcd1;
    C = c/gcd2;
    D = d/gcd2;
    P = p/gcd1;
    Q = q/gcd2;
}

- (void)makeValue
{
//    A = 1;
//    B = 1;
//    C = 1;
//    D = 1;
//    P = 1;
//    Q = 1;
    
    A = 3;
    B = 4;
    C = 3;
    D = 4;
    P = 10;
    Q = 4;
    
}

- (void)enterFormula
{
    int a = A;
    int b = B;
    int c = C;
    int d = D;
    int p = P;
    int q = Q;
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSMutableArray *member = [appDelegate.toyBox objectForKey:@"formula1"];
    
    UILabel *la1 = member[0];
    UILabel *lc1 = member[1];
    UILabel *lb1 = member[2];
    UILabel *le1 = member[3];
    
//    la1.text = [NSString stringWithFormat:@"%d",a];
    la1.text = [CommonMethod outputString:a :true];
    
    if(b < 0){
        lc1.text = [NSString stringWithFormat:@"-"];
        b = -1 * b;
    }else{
        lc1.text = [NSString stringWithFormat:@"+"];
    }
    
//    lb1.text = [NSString stringWithFormat:@"%d",b];
    lb1.text = [CommonMethod outputString:b :true];
    
//    le1.text = [NSString stringWithFormat:@"%d",p];
    le1.text = [CommonMethod outputString:p :false];
    
    member = [appDelegate.toyBox objectForKey:@"formula2"];
    
    UILabel *la2 = member[0];
    UILabel *lc2 = member[1];
    UILabel *lb2 = member[2];
    UILabel *le2 = member[3];
    
//    la2.text = [NSString stringWithFormat:@"%d",c];
    la2.text = [CommonMethod outputString:c :true];
    
    if(d < 0){
        lc2.text = [NSString stringWithFormat:@"-"];
        d = -1 * d;
    }else{
        lc2.text = [NSString stringWithFormat:@"+"];
    }
    
//    lb2.text = [NSString stringWithFormat:@"%d",d];
    lb2.text = [CommonMethod outputString:d :true];
    
//    le2.text = [NSString stringWithFormat:@"%d",q];
    le2.text = [CommonMethod outputString:q :false];
}

//解の判別
- (BOOL)isIdefinite
{
    int delt = A*D - B*C;
    if(delt == 0){
        NSLog(@"解なしです");
        if(A == C && B == D){
            NSLog(@"重なる");
        }
        return true;
    }
    return false;
}

- (int) gcd :(int)x :(int)y
{
    while (1) {
        x = x % y;
        if(x == 0)
            return y;
        y = y % x;
        if (y == 0)
            return x;
    }
}
@end
