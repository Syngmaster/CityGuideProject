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
        //fromViewController.view.alpha = 0.3;
        fromViewController.animatableLeftConstraint.constant = 16.0;
        fromViewController.animatableRightConstraint.constant = 17.0;
        [fromViewController.view layoutIfNeeded];

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
