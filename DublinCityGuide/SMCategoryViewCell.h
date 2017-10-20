//
//  SMCategoryViewCell.h
//  DublinCityGuide
//
//  Created by Syngmaster on 12/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMCategoryModel;

@interface SMCategoryViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *categoryImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryCountLabel;

- (void)configureCellWithCategory:(SMCategoryModel *) categoryModel;

@end
