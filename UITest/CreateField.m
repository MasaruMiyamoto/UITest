//
//  CreatField.m
//  Draw
//
//  Created by miyamoto masaru on 2014/11/11.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import "CreateField.h"

@implementation CreateField

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    int p = self.frame.size.height;
    
    // x軸
    CGContextRef x = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(x, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(x, 2.0);
    CGContextMoveToPoint(x, 0, p/2);
    CGContextAddLineToPoint(x, p, p/2);
    CGContextStrokePath(x);
    
    //メモリ
    for(int i=0; i<p; i=i+25){
        CGContextMoveToPoint(x, i, p/2 - 5);
        CGContextAddLineToPoint(x, i, p/2 + 5);
        CGContextStrokePath(x);
    }
    
    //y軸
    CGContextRef y = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(y, 255/255.0, 255/255.0, 255/255.0, 1);
    CGContextMoveToPoint(y, p/2, 0);
    CGContextAddLineToPoint(y, p/2, p);
    CGContextStrokePath(y);
    

    //メモリ
    for(int i=0; i<p; i=i+25){
        CGContextMoveToPoint(y, p/2 - 5, i);
        CGContextAddLineToPoint(y, p/2 + 5, i);
        CGContextStrokePath(x);
    }
    
    [self drawLiner1 :p];
    [self drawLiner2 :p];
//    [self drawQuadratic];
    
}


- (void) setPoint:(double)value1 :(double)value2 :(double)value3 :(int)choose{
    
    switch(choose){
        case 1:
            X = value1;
            Y = value2;
            E = value3;
            break;
        case 2:
            A = value1;
            B = value2;
            C = value3;
            break;
        default:
            break;
    }
}

-(void) drawLiner1 :(int)p{
    CGPoint start,end;
    
    int a1,b1,c1;
    a1 = X;
    b1 = Y;
    c1 = E;
    
//    NSLog(@"%d %d %d",a1,b1,c1);
    //グラフの座標系での座標の設定
    start.x = -p/2;
    start.y = ((-1*a1)*start.x+c1*25)/b1;
    
    end.x = p/2;
    end.y = -1*((-1*a1)*end.x+c1*25)/b1;
    
    //Viewに表示するために変換する
    start = CGPointMake((int)start.x + p/2 , (int)((-1)*(start.y - p/2)));
    end = CGPointMake((int)end.x + p/2, (int)(end.y + p/2));
    
//    NSLog(@"start(%f, %f)",start.x,start.y);
//    NSLog(@"end(%f, %f)",end.x,end.y);
    
    //Viewに描く
    CGContextRef draw = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(draw, start.x, start.y);
    CGContextAddLineToPoint(draw, end.x, end.y);
    CGContextSetLineWidth(draw, 2.5);
    CGContextSetRGBStrokeColor(draw, 126/255.0, 203/255.0, 220/255.0, 0.85);
    CGContextStrokePath(draw);

}

-(void) drawLiner2 :(int)p{
    CGPoint start,end;
    
    int a1,b1,c1;
    a1 = A;
    b1 = B;
    c1 = C;
    
//    NSLog(@"%d %d %d",a1,b1,c1);
    //グラフの座標系での座標の設定
    start.x = -p/2;
    start.y = ((-1*a1)*start.x+c1*25)/b1;
    
    end.x = p/2;
    end.y = -1*((-1*a1)*end.x+c1*25)/b1;
    
    //Viewに表示するために変換する
    start = CGPointMake((int)start.x + p/2 , (int)((-1)*(start.y - p/2)));
    end = CGPointMake((int)end.x + p/2, (int)(end.y + p/2));
    
//    NSLog(@"start(%f, %f)",start.x,start.y);
//    NSLog(@"end(%f, %f)",end.x,end.y);
    
    //Viewに描く
    CGContextRef draw = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(draw, start.x, start.y);
    CGContextAddLineToPoint(draw, end.x, end.y);
    CGContextSetLineWidth(draw, 2.5);
    CGContextSetRGBStrokeColor(draw, 247/255.0, 171/255.0, 173/255.0, 0.85);
    CGContextStrokePath(draw);
    
}

-(void)drawQuadratic{
    CGPoint point,pointPre;
    CGContextRef draw2 = UIGraphicsGetCurrentContext();
    
    // y = ax^2 + bx + c
    // y = a(x^2 + bx ) + c
    // y = a(x + b/2)^2 - b^2/4+c
    
    double a2,b2,c2;
    
    a2 = A;
    b2 = B/2;
    c2 = (-1*B*B)/4 + C;
    
    pointPre.x = -250;
    pointPre.y = ((a2/25)*(pointPre.x - b2*25)*(pointPre.x - b2*25) + c2*25);
    
    for(int i=1; i<500;i++){
        
        point.x = -250 + i;
        point.y = ((a2/25)*(point.x - b2*25)*(point.x - b2*25) + c2*25);
        point = CGPointMake(point.x +250 , ((-1)*(point.y -250)));
        
        CGContextMoveToPoint(draw2, pointPre.x, pointPre.y);
        CGContextAddLineToPoint(draw2, point.x, point.y);
        CGContextStrokePath(draw2);
        
        pointPre = point;
    }
}



@end
