//
//  MasterViewController.m
//  RSVWorldCountry
//
//  Created by SergeantSA on 9/30/15.
//  Copyright (c) 2015 SergeantSoft. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "RSVDataModel.h"
#import "RSVCountryInfoCell.h"

@interface MasterViewController () <RSVDataModelDelegate>

@property (nonatomic, strong) RSVDataModel *dataModel;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataModel = [RSVDataModel new];
    self.dataModel.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)cell {
    if ([[segue identifier] isEqualToString:@"showDetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        DetailViewController *controller = segue.destinationViewController;
        controller.item = [self.dataModel
                          getCountryOnContinent:self.dataModel.continents[indexPath.section] byIndex:indexPath.row];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataModel continentsCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *continentName = self.dataModel.continents[section];
    return [self.dataModel countriesCountOn:continentName];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.dataModel.continents[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RSVCountryInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryInfoCell" forIndexPath:indexPath];

    cell.dataModel = self.dataModel;
    [cell configureCellAtIndexPath:indexPath];
    return cell;
}

#pragma mark - RSVDataModel Delegate

- (void)reloadCellAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cell) {
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:NO];
    }
}

@end
