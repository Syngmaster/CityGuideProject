//
//  DublinCityGuideTests.m
//  DublinCityGuideTests
//
//  Created by Syngmaster on 11/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SMMainViewController.h"

@interface DublinCityGuideTests : XCTestCase

@property (strong, nonatomic) SMMainViewController *mainVC;

@end

@implementation DublinCityGuideTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SMMainViewController *mainVC = [mainSB instantiateViewControllerWithIdentifier:@"SMMainViewController"];
    self.mainVC = mainVC;
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitialMapViewSetting {
    
    [self.mainVC viewDidAppear:YES];
    MKCoordinateSpan span = self.mainVC.mapView.region.span;

    XCTAssertTrue(span.latitudeDelta > 0.3 && span.latitudeDelta < 0.32);
    XCTAssertTrue(span.longitudeDelta > 0.3 && span.longitudeDelta < 0.32);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
