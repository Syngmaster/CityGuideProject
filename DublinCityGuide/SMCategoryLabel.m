//
//  SMCategoryLabel.m
//  DublinCityGuide
//
//  Created by Syngmaster on 12/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCategoryLabel.h"

@implementation SMCategoryLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.borderColor = [UIColor colorWithRed:80/255.0 green:100/255.0 blue:210/255.0 alpha:1.0].CGColor;
    self.layer.borderWidth = 0.8;
    self.layer.cornerRadius = self.bounds.size.width/2;

    
}

@end
