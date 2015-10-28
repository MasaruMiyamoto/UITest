//
//  CreatField.h
//  Draw
//
//  Created by miyamoto masaru on 2014/11/11.
//  Copyright (c) 2014年 MasaruMiyamoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateField : UIView{
    int X,Y,E;
    double A,B,C;
}



- (void) setPoint:(double)value1 :(double)value2 :(double)value3 :(int)choose;


@end
