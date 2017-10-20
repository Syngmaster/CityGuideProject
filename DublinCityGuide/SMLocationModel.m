//
//  SMLocationModel.m
//  DublinCityGuide
//
//  Created by Syngmaster on 11/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMLocationModel.h"

@implementation SMLocationModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    self = [super init];
    if (self) {
        NSLog(@"%@", dict);
        self.locationAddress = [dict valueForKey:@"address"];
        self.locationPhoneNumber = [dict valueForKey:@"phone"];
        self.locationWorkingHours = [dict valueForKey:@"hours"];
        self.locationWebsite = [dict valueForKey:@"website"];
        self.subCategoryName = [dict valueForKey:@"subCategoryName"];
        
    }
    return self;
}

@end
