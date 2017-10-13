//
//  SMFavouritesViewController.m
//  DublinCityGuide
//
//  Created by Syngmaster on 12/10/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMFavouritesViewController.h"
#import "SMHomeWorkAddressViewCell.h"
#import "SMFavouritesViewCell.h"

@interface SMFavouritesViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SMFavouritesViewController

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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([tableView isEqual:self.homeWorkTableView]) {
        return 2;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:self.homeWorkTableView]) {
        
        SMHomeWorkAddressViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeWorkCell"];
        
        if (!cell) {
            cell = [[SMHomeWorkAddressViewCell alloc] init];
        }
        return cell;
        
    } else {
        
        SMFavouritesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"favouritesCell"];
        
        if (!cell) {
            cell = [[SMFavouritesViewCell alloc] init];
        }
        return cell;
        
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:self.homeWorkTableView]) {
        return 59.0;
    } else {
        return tableView.bounds.size.height;
    }
}

/*- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
}*/

@end
