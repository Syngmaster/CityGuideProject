//
//  SMCategoryModel.h
//  DublinCityGuide
//
//  Created by Syngmaster on 20/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMCategoryModel : NSObject

@property (strong, nonatomic) NSString *categoryName;
@property (strong, nonatomic) NSMutableArray *arrayOfLocations;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
