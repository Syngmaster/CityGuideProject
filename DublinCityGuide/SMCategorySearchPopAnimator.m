//
//  SMCategorySearchPopAnimator.m
//  DublinCityGuide
//
//  Created by Syngmaster on 16/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCategorySearchPopAnimator.h"
#import "SMCategoriesSearchViewController.h"

@implementation SMCategorySearchPopAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    SMCategoriesSearchViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    [fromViewController.view layoutIfNeeded];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{

        fromViewController.animatableLeftConstraint.constant = 24.0;
        fromViewController.animatableRightConstraint.constant = 25.0;
        fromViewController.collectionView.alpha = 0.0;

        fromViewController.view.alpha = 0.0;
        
        CGRect oldFrame = fromViewController.view.frame;
        fromViewController.view.frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y - 200, oldFrame.size.width, oldFrame.size.height);

        [fromViewController.view layoutIfNeeded];

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
