//
//  SMCustomView.m
//  DublinCityGuide
//
//  Created by Syngmaster on 11/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCustomView.h"

@implementation SMCustomView

- (void)awakeFromNib {
    [super awakeFromNib];

    self.layer.cornerRadius = 5.0;
    self.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 1.0;
    
}


@end
