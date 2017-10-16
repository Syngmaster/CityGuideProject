//
//  SMCategorySearchPushAnimator.m
//  DublinCityGuide
//
//  Created by Syngmaster on 16/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCategorySearchPushAnimator.h"
#import "SMCategoriesSearchViewController.h"

@implementation SMCategorySearchPushAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    SMCategoriesSearchViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    //toViewController.view.alpha = 0.3;
    toViewController.animatableLeftConstraint.constant = 16.0;
    toViewController.animatableRightConstraint.constant = 17.0;
    [toViewController.view layoutIfNeeded];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //toViewController.view.alpha = 1.0;
        toViewController.animatableLeftConstraint.constant = 5.0;
        toViewController.animatableRightConstraint.constant = 6.0;
        [toViewController.view layoutIfNeeded];

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

@end
