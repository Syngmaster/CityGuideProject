//
//  SMLocationDescriptionViewController.m
//  DublinCityGuide
//
//  Created by Syngmaster on 15/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMLocationDescriptionViewController.h"

@interface SMLocationDescriptionViewController ()

@property (assign, nonatomic) CGFloat viewPositionY;

@end

@implementation SMLocationDescriptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewPositionY = [UIScreen mainScreen].bounds.size.height - 305;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect frame = self.view.frame;
        CGFloat yComponent = self.viewPositionY;
        self.view.frame = CGRectMake(0, yComponent, frame.size.width, frame.size.height);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
