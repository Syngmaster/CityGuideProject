//
//  SMPushAnimator.m
//  DublinCityGuide
//
//  Created by Syngmaster on 16/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMPushAnimator.h"

@interface SMPushAnimator () 

@end

@implementation SMPushAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController* toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    toViewController.view.alpha = 0.0;
    toViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.alpha = 1.0;
        toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

}

@end
