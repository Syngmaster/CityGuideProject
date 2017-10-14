//
//  SMBottomViewController.m
//  DublinCityGuide
//
//  Created by Syngmaster on 14/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMBottomViewController.h"

@interface SMBottomViewController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (assign, nonatomic) CGFloat minPositionY;
@property (assign, nonatomic) CGFloat maxPositionY;

@end

@implementation SMBottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.maxPositionY = 70.0;
    self.minPositionY = [UIScreen mainScreen].bounds.size.height - 150;
    
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
    
    CGFloat minY = CGRectGetMinY(self.view.frame);
    
    if ((minY + translation.y >= self.maxPositionY) &&(minY + translation.y <= self.minPositionY)) {
        self.view.frame = CGRectMake(0, minY + translation.y, self.view.frame.size.width, self.view.frame.size.height);
        [sender setTranslation:CGPointZero inView:self.view];
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        if (self.view.frame.origin.y == self.maxPositionY) {
            
        } else {
            
        }
        
        
        
        CGFloat duration = velocity.y < 0 ? (double)((minY - self.maxPositionY) / -velocity.y) : (double)((self.minPositionY - minY)/velocity.y);
        duration = duration > 1.3 ? 1 : duration;
        
        [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            if (velocity.y >= 0) {
                self.view.frame = CGRectMake(0, self.minPositionY, self.view.frame.size.width, self.view.frame.size.height);
            } else {
                self.view.frame = CGRectMake(0, self.maxPositionY, self.view.frame.size.width, self.view.frame.size.height);
            }
            
            
        } completion:^(BOOL finished) {
            
            if (velocity.y < 0) {
                self.tableView.scrollEnabled = YES;
            }
            
        }];
    }
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Title %i", (int)indexPath.row];
    
    return cell;
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
