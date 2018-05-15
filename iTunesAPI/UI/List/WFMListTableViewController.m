//
//  WFMListTableViewController.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "WFMListTableViewController.h"
#import "WFMDataManager.h"

#import "WFMListTableViewCellProtocol.h"
#import "WFMArtistTableViewCell.h"
#import "WFMTrackTableViewCell.h"

#import "NSDictionary+Wrapper.h"

@interface WFMListTableViewController ()

@property (nonatomic, strong) WFMDataManager *dataManager;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation WFMListTableViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataManager = [WFMDataManager sharedInstance];
    
    [self loadSavedData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadController];
}

#pragma mark - Load data

- (void)loadSavedData
{
    self.dataSource = [self.dataManager listDataArray];
}

- (void)reloadController 
{
    Weakify(self);
    [self.dataManager listDataArrayWithBlock:^(NSArray *array, NSError *error) {
        Strongify(self);
        if (array) {
            self.dataSource = array;
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    return 0;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
//    return 0;
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary<WFMWrapperProtocol> *model = self.dataSource[indexPath.row];
    NSString *cellIdentifier;
    if (model.wrapperType == WFMWrapperTypeTrack) {
        cellIdentifier = NSStringFromClass([WFMTrackTableViewCell class]);
    } else {
        cellIdentifier = NSStringFromClass([WFMArtistTableViewCell class]);
    }

    UITableViewCell<WFMListTableViewCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell decorateCellWithModel:model];
    return cell;
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
