//
//  SMRectangleView.m
//  DublinCityGuide
//
//  Created by Syngmaster on 15/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMRectangleView.h"

@implementation SMRectangleView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 3.0;
    
}

@end
