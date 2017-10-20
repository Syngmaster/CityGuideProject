//
//  SMMainViewController.m
//  DublinCityGuide
//
//  Created by Syngmaster on 11/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMMainViewController.h"
#import "SMLocationModel.h"
#import "SMCategoriesViewController.h"
#import "SMCategoriesSearchViewController.h"
#import "SMDataManager.h"

#import "SMPushAnimator.h"
#import "SMPopAnimator.h"
#import "SMCategorySearchPushAnimator.h"
#import "SMCategorySearchPopAnimator.h"

typedef NS_ENUM(NSInteger, ZoomAction) {
    ZoomActionIn,
    ZoomActionOut
};

@interface SMMainViewController () <UITextFieldDelegate, MKMapViewDelegate, SMCategoriesViewDelegate, SMCategoriesSearchViewDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) SMLocationModel *homeLocation;
@property (strong, nonatomic) NSArray *testLocationsArray;

@end

@implementation SMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem.title=@"";
    SMLocationModel *model = [[SMLocationModel alloc] init];
    model.locationAddress = @"29 Norfolk Road, Dublin7, Dublin";
    model.locationName = @"My home";
    model.locationPhoneNumber = @"0899510834";
    model.locationWorkingHours = @"Open till 22:00";
    model.coordinate = CLLocationCoordinate2DMake(53.362731, -6.278381);
    
    self.homeLocation = model;
    self.navigationController.delegate = self;
    self.mapView.delegate = self;
    //[self.mapView addAnnotation:model];
    [self setInitialRegion];
    
    [[SMDataManager sharedInstance] getCategoriesFronFirebaseOnCompletion:^(NSArray *resultArray, NSError *error) {
        
        self.testLocationsArray = resultArray;
    }];

}

- (void)setInitialRegion {
    
    CLLocationCoordinate2D cityCenterCoordinates = CLLocationCoordinate2DMake(53.349809, -6.260255);
    MKCoordinateSpan currentSpan = MKCoordinateSpanMake(0.3, 0.3);
    MKCoordinateRegion currentRegion = MKCoordinateRegionMake(cityCenterCoordinates, currentSpan);
    [self.mapView setRegion:currentRegion];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self performSegueWithIdentifier:@"searchMenu" sender:nil];
}

#pragma mark - MKMapViewDelegate

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *identifier = @"PinView";
    
    MKAnnotationView *pin = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    
    if (!pin) {
        pin = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        
        pin.draggable = YES;
        pin.image = [UIImage imageNamed:@"pin_point.png"];
    } else {
        pin.annotation = annotation;
    }
    
    return  pin;
}


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    

}

#pragma mark - Actions

- (IBAction)showMenuAction:(UIButton *)sender {
    [self performSegueWithIdentifier:@"menu" sender:nil];
}

- (IBAction)getCurrentLocationAction:(UIButton *)sender {
}

- (IBAction)zoomAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case ZoomActionIn: [self zoomMapView:self.mapView byDelta:0.5];
            break;
        case ZoomActionOut: [self zoomMapView:self.mapView byDelta:1/0.5];
            break;
    }
    
}

- (void)zoomMapView:(MKMapView *)mapView byDelta:(float)delta {
    
    MKCoordinateRegion region = mapView.region;
    MKCoordinateSpan span = mapView.region.span;
    span.latitudeDelta*=delta;
    span.longitudeDelta*=delta;
    
    if (span.latitudeDelta <=180 && span.latitudeDelta > 0) {
        region.span=span;
        [mapView setRegion:region animated:YES];
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"menu"]) {
        
        SMCategoriesViewController *dvc = segue.destinationViewController;
        dvc.delegate = self;
        dvc.testLocationsArray = self.testLocationsArray;
        
    } else if ([segue.identifier isEqualToString:@"searchMenu"]) {
        
        SMCategoriesSearchViewController *dvc = segue.destinationViewController;
        dvc.delegate = self;
        dvc.testLocationsArray = self.testLocationsArray;
    }
    
}


- (void)viewControllerDismissed:(UIViewController *)viewController {
    [self.mapView addAnnotation:self.homeLocation];
}


#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController*)fromVC
                                                 toViewController:(UIViewController*)toVC
{
    
    if (([fromVC isMemberOfClass:[SMMainViewController class]] && [toVC isMemberOfClass:[SMCategoriesViewController class]]) ||
        ([toVC isMemberOfClass:[SMMainViewController class]] && [fromVC isMemberOfClass:[SMCategoriesViewController class]])) {
        
        if (operation == UINavigationControllerOperationPush)
            return [[SMPushAnimator alloc] init];
        
        if (operation == UINavigationControllerOperationPop)
            return [[SMPopAnimator alloc] init];
        
    } else if (([fromVC isMemberOfClass:[SMMainViewController class]] && [toVC isMemberOfClass:[SMCategoriesSearchViewController class]]) ||
               ([toVC isMemberOfClass:[SMMainViewController class]] && [fromVC isMemberOfClass:[SMCategoriesSearchViewController class]])) {
        
        if (operation == UINavigationControllerOperationPush)
            return [[SMCategorySearchPushAnimator alloc] init];
        
        if (operation == UINavigationControllerOperationPop)
            return [[SMCategorySearchPopAnimator alloc] init];

    } else {
        return nil;
    }
    
    return nil;
}


@end
