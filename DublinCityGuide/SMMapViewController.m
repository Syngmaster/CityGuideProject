//
//  SMMapViewController.m
//  DublinCityGuide
//
//  Created by Syngmaster on 13/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMMapViewController.h"
#import "SMBottomViewController.h"

@interface SMMapViewController ()

@end

@implementation SMMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(popBack:)];
    backBtn.image = [[UIImage imageNamed:@"back_button.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = backBtn;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addBottomVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)popBack:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addBottomVC {
    
    SMBottomViewController *bottomVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SMBottomViewController"];
    
    [self addChildViewController:bottomVC];
    [self.view addSubview:bottomVC.view];
    [bottomVC didMoveToParentViewController:self];
    
    CGFloat height = self.view.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    bottomVC.view.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame), width, height);
    
}

@end
