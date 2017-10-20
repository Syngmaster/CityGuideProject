//
//  SMCategoryViewCell.m
//  DublinCityGuide
//
//  Created by Syngmaster on 12/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCategoryViewCell.h"
#import "SMCategoryModel.h"

@implementation SMCategoryViewCell

- (void)configureCellWithCategory:(SMCategoryModel *) categoryModel {
    
    self.categoryCountLabel.text = [NSString stringWithFormat:@"%i", (int)[categoryModel.arrayOfLocations count]];
    self.categoryNameLabel.text = categoryModel.categoryName;
    
}


@end
