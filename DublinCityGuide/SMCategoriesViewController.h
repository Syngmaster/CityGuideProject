//
//  SMCategoriesViewController.h
//  DublinCityGuide
//
//  Created by Syngmaster on 11/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMCategoriesViewController;

@protocol SMCategoriesViewDelegate <NSObject>

- (void)viewControllerDismissed:(SMCategoriesViewController *)viewController;

@end

@interface SMCategoriesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) id <SMCategoriesViewDelegate> delegate;
@property (strong, nonatomic) NSArray *testLocationsArray;

@end
