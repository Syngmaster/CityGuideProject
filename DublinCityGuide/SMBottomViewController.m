//
//  SMBottomViewController.m
//  DublinCityGuide
//
//  Created by Syngmaster on 14/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMBottomViewController.h"
#import "SMMapViewController.h"
#import "SMCategoryDescriptionTableViewCell.h"

@interface SMBottomViewController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (assign, nonatomic) CGFloat minPositionY;
@property (assign, nonatomic) CGFloat maxPositionY;
@property (assign, nonatomic) CGFloat progress;

@end

@implementation SMBottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.maxPositionY = 70.0;
    self.minPositionY = [UIScreen mainScreen].bounds.size.height - 150;
    self.progress = 0.0;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.3 animations:^{
       
        CGRect frame = self.view.frame;
        CGFloat yComponent = self.minPositionY;
        self.view.frame = CGRectMake(0, yComponent, frame.size.width, frame.size.height - 70);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)panGesture:(UIPanGestureRecognizer *)sender {
    
    CGPoint translation = [sender translationInView:self.view];
    CGPoint velocity = [sender velocityInView:self.view];
    self.progress = MAX(self.progress, fabs([sender translationInView:self.view].y / (self.view.frame.size.width * 1.0)));

    CGFloat minY = CGRectGetMinY(self.view.frame);
    
    if ((minY + translation.y >= self.maxPositionY) &&(minY + translation.y <= self.minPositionY)) {
        self.view.frame = CGRectMake(0, minY + translation.y, self.view.frame.size.width, self.view.frame.size.height);
        [sender setTranslation:CGPointZero inView:self.view];
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        CGFloat duration = 0.5;
        

        if (velocity.y >= 0) {
            
            [self moveViewAnimatableWithDuration:duration velocity:velocity toPosition:self.minPositionY];

            
        } else {
            
            [self moveViewAnimatableWithDuration:duration velocity:velocity toPosition:self.maxPositionY];

        }
        
        self.progress = 0.0;

    }
    
    [self animateMapViewAlpha];

    
}

- (void)moveViewAnimatableWithDuration:(CGFloat)duration velocity:(CGPoint)velocity toPosition:(CGFloat)yPosition {
    
    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.view.frame = CGRectMake(0, yPosition, self.view.frame.size.width, self.view.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        if (velocity.y < 0) {
            self.tableView.scrollEnabled = YES;
        }
        
    }];
    
    [self animateMapViewAlpha];
}

- (void)animateMapViewAlpha {
    
    SMMapViewController *mapVC = (SMMapViewController *)self.parentViewController;
    
    CGFloat yPosition = self.maxPositionY + 120;
    
    if (self.view.frame.origin.y <= yPosition) {

         [UIView animateWithDuration:0.4 animations:^{
         
             mapVC.mapView.alpha = (self.view.frame.origin.y - self.maxPositionY)/100;
             mapVC.leftConstrain.constant = 5 + (self.view.frame.origin.y - self.maxPositionY)/12.0;
             mapVC.rightConstrain.constant = 6 + (self.view.frame.origin.y - self.maxPositionY)/13.3;

         }];
        
    } else {
        
        [UIView animateWithDuration:0.4 animations:^{
            
            mapVC.mapView.alpha = 1.0;
            mapVC.leftConstrain.constant = 15.0;
            mapVC.rightConstrain.constant = 15.0;
        }];

    }
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SMCategoryDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[SMCategoryDescriptionTableViewCell alloc] init];
    }
    
    
    return cell;
}


#pragma mark - UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130.0;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer *)gestureRecognizer;
    CGFloat direction = [gesture velocityInView:self.view].y;
    CGFloat minY = CGRectGetMinY(self.view.frame);
    
    if ((minY == self.maxPositionY && self.tableView.contentOffset.y == 0 && direction > 0) || (minY == self.minPositionY)) {
        self.tableView.scrollEnabled = NO;
    } else {
        self.tableView.scrollEnabled = YES;
    }
    
    return NO;

}



@end
