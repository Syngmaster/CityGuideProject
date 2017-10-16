//
//  SMMapViewController.m
//  DublinCityGuide
//
//  Created by Syngmaster on 13/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMMapViewController.h"
#import "SMBottomViewController.h"
#import "SMLocationDescriptionViewController.h"

@interface SMMapViewController () <MKMapViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation SMMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(popBack:)];
    //backBtn.image = [[UIImage imageNamed:@"back_button.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    backBtn.image = [[UIImage alloc] init];
    self.navigationItem.leftBarButtonItem = backBtn;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
    tap.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[self addBottomVC];
    [self addDescriptionVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapAction:(UITapGestureRecognizer *)sender {
    
    
    //[self removeBottomVC];
    [self removeDescriptionVC];
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

- (void)addDescriptionVC {
    SMLocationDescriptionViewController *bottomVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SMLocationDescriptionViewController"];
    
    [self addChildViewController:bottomVC];
    [self.view addSubview:bottomVC.view];
    [bottomVC didMoveToParentViewController:self];
    
    CGFloat height = self.view.frame.size.height;
    CGFloat width = self.view.frame.size.width;
    bottomVC.view.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame), width, height);
}

- (void)removeBottomVC {
    
    if ([self.childViewControllers count] > 0) {
        
        SMBottomViewController *bottomVC = self.childViewControllers[0];
        [bottomVC willMoveToParentViewController:nil];
        
        [UIView animateWithDuration:0.5 animations:^{
            
            bottomVC.view.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame), self.view.frame.size.width, self.view.frame.size.height);
            
        } completion:^(BOOL finished) {
            [bottomVC.view removeFromSuperview];
            [bottomVC removeFromParentViewController];
        }];
    }
}

- (void)removeDescriptionVC {
    
    if ([self.childViewControllers count] > 0) {
        
        SMLocationDescriptionViewController *bottomVC = self.childViewControllers[0];
        [bottomVC willMoveToParentViewController:nil];
        
        [UIView animateWithDuration:0.5 animations:^{
            
            bottomVC.view.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame), self.view.frame.size.width, self.view.frame.size.height);
            
        } completion:^(BOOL finished) {
            [bottomVC.view removeFromSuperview];
            [bottomVC removeFromParentViewController];
        }];
    }
}

- (BOOL)validationCheckOfTouches:(UITouch *)touch inView:(UIView *)view andViewController:(UIViewController *)viewController {
    
    CGPoint point = [touch locationInView:view];
    if (CGRectContainsPoint(viewController.view.frame, point)) {
        return NO;
    } else {
        return YES;
    }

}

- (BOOL)gestureRecognizer:(UITapGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if ([self.childViewControllers count] > 0) {
        UIViewController *bottomVC = self.childViewControllers[0];
        return [self validationCheckOfTouches:touch inView:self.view andViewController:bottomVC];
    } else {
        return YES;
    }

    
}

@end
