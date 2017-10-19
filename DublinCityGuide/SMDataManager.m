//
//  SMDataManager.m
//  DublinCityGuide
//
//  Created by Syngmaster on 19/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMDataManager.h"
#import <FirebaseDatabase/FirebaseDatabase.h>

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
        
        NSLog(@"%@", snapshot.value);
        
        
    }];
    
}

@end
