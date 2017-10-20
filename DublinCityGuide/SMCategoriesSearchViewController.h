//
//  SMCategoriesSearchViewController.h
//  DublinCityGuide
//
//  Created by Syngmaster on 12/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMCategoriesSearchViewController;

@protocol SMCategoriesSearchViewDelegate <NSObject>

- (void)viewControllerDismissed:(SMCategoriesSearchViewController *)viewController;

@end

@interface SMCategoriesSearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) id <SMCategoriesSearchViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *animatableLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *animatableRightConstraint;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (strong, nonatomic) NSArray *testLocationsArray;

@end
