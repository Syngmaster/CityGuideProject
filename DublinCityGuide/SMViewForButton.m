//
//  SMViewForButton.m
//  DublinCityGuide
//
//  Created by Syngmaster on 16/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMViewForButton.h"

@implementation SMViewForButton

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 7.0;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1.0].CGColor;
    self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];

}

@end
