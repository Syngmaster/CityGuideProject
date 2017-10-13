//
//  SMAddLocationButton.m
//  DublinCityGuide
//
//  Created by Syngmaster on 12/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMAddLocationButton.h"

@implementation SMAddLocationButton

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    self.layer.cornerRadius = 5.0;
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 1.0;
    
    [self setImage:[UIImage imageNamed:@"add_new_location_button_pressed.png"] forState:UIControlStateHighlighted];
    
    //self.contentMode = UIViewContentModeScaleAspectFill;
    
}


@end
