//
//  SMDataManager.h
//  DublinCityGuide
//
//  Created by Syngmaster on 19/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMDataManager : NSObject

+ (SMDataManager *)sharedInstance;

- (void)getCategoriesFronFirebaseOnCompletion:(void(^)(NSArray *resultArray, NSError *error))completionHandler;

@end
