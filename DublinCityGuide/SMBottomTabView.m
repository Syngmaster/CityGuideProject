//
//  SMBottomTabView.m
//  DublinCityGuide
//
//  Created by Syngmaster on 15/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMBottomTabView.h"

@implementation SMBottomTabView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    
    CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:195.0/255.0 green:195.0/255.0 blue:195.0/255.0 alpha:1.0].CGColor);
    CGContextStrokePath(context);
    
}

@end
