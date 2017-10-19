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
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    SMCategoriesSearchViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    
    [[transitionContext containerView] addSubview:toViewController.view];

    toViewController.animatableLeftConstraint.constant = 24.0;
    toViewController.animatableRightConstraint.constant = 25.0;
    toViewController.view.alpha = 0.0;
    toViewController.collectionView.transform = CGAffineTransformMakeScale(0.4, 0.4);

    //CGRect oldFrame = toViewController.view.frame;
    //toViewController.view.frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y + 30, oldFrame.size.width, oldFrame.size.height);
    [toViewController.view layoutIfNeeded];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{

        toViewController.animatableLeftConstraint.constant = 5.0;
        toViewController.animatableRightConstraint.constant = 6.0;
        toViewController.view.alpha = 1.0;
        //toViewController.view.frame = oldFrame;
        toViewController.collectionView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        [toViewController.view layoutIfNeeded];

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

@end
