//
//  SMCategoryModel.m
//  DublinCityGuide
//
//  Created by Syngmaster on 20/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCategoryModel.h"
#import "SMLocationModel.h"

@implementation SMCategoryModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        self.arrayOfLocations = [NSMutableArray array];
        
        self.categoryName = [dict objectForKey:@"title"];
        NSDictionary *categoryDict = [dict objectForKey:@"Category"];

        for (NSString *key in categoryDict) {
            SMLocationModel *model = [[SMLocationModel alloc] initWithDict:categoryDict[key]];
            [self.arrayOfLocations addObject:model];

        }
        
        
    }
    return self;
}

@end
