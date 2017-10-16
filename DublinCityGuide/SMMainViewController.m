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
#import "SMPushAnimator.h"
#import "SMPopAnimator.h"

@interface SMMainViewController () <UITextFieldDelegate, MKMapViewDelegate, SMCategoriesViewDelegate, SMCategoriesSearchViewDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) SMLocationModel *homeLocation;

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


- (IBAction)showMenuAction:(UIButton *)sender {
    [self performSegueWithIdentifier:@"menu" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"menu"]) {
        SMCategoriesViewController *dvc = segue.destinationViewController;
        dvc.delegate = self;
    } else if ([segue.identifier isEqualToString:@"searchMenu"]) {
        SMCategoriesSearchViewController *dvc = segue.destinationViewController;
        dvc.delegate = self;
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
        
    } else {
        
        return nil;

    }
    
    return nil;
}


@end
