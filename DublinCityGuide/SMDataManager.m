//
//  SMDataManager.m
//  DublinCityGuide
//
//  Created by Syngmaster on 19/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMDataManager.h"
#import <FirebaseDatabase/FirebaseDatabase.h>
#import "SMLocationModel.h"
#import "SMCategoryModel.h"

@interface SMDataManager ()

@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation SMDataManager

+ (SMDataManager *)sharedInstance {
    
    static SMDataManager *sharedManager = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[SMDataManager alloc] init];
    });
    
    return sharedManager;
}

- (void)getCategoriesFronFirebaseOnCompletion:(void(^)(NSArray *resultArray, NSError *error))completionHandler {
    
    self.ref = [[FIRDatabase database] reference];
    
    [self.ref observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSMutableArray *array = [NSMutableArray array];
        NSDictionary *mainDict = snapshot.value;
        //NSLog(@"%@", snapshot.value);
        
        for (NSString *dictName in mainDict) {
            NSLog(@"%@", dictName);
            NSDictionary *dict = [mainDict valueForKey:dictName];

            SMCategoryModel *model = [[SMCategoryModel alloc] initWithDict:dict];
            [array addObject:model];
        }
        
        completionHandler(array, nil);
        
    }];
    
}

@end
