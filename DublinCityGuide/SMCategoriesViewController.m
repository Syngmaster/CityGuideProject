//
//  SMCategoriesViewController.m
//  DublinCityGuide
//
//  Created by Syngmaster on 11/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCategoriesViewController.h"

@interface SMCategoriesViewController ()

@end

@implementation SMCategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(popBack:)];
    backBtn.image = [[UIImage imageNamed:@"back_button.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = backBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)popBack:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
