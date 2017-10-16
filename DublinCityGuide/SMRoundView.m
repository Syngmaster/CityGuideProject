//
//  SMRoundView.m
//  DublinCityGuide
//
//  Created by Syngmaster on 15/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMRoundView.h"

@implementation SMRoundView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = self.frame.size.width/2;
}

@end
