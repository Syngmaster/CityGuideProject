//
//  SMLocationModel.h
//  DublinCityGuide
//
//  Created by Syngmaster on 11/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface SMLocationModel : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString *locationName;
@property (strong, nonatomic) NSString *locationAddress;
@property (strong, nonatomic) NSString *locationPhoneNumber;
@property (strong, nonatomic) NSString *locationWorkingHours;

@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
