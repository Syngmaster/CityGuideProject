//
//  SMMapViewController.h
//  DublinCityGuide
//
//  Created by Syngmaster on 13/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SMMapViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstrain;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightConstrain;

@end
