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

#import "WFMDetailViewController.h"

@interface WFMListTableViewController ()

@property (nonatomic, strong) WFMDataManager *dataManager;

@property (nonatomic, strong) NSArray *dataSource;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;

- (IBAction)refreshButtonAction:(UIBarButtonItem *)sender;
- (IBAction)trashButtonAction:(UIBarButtonItem *)sender;

@end

@implementation WFMListTableViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataManager = [WFMDataManager sharedInstance];
    
    [self loadSavedData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadController];
}

#pragma mark - IBActions

- (IBAction)refreshButtonAction:(UIBarButtonItem *)sender
{
    [self reloadController];
}

- (IBAction)trashButtonAction:(UIBarButtonItem *)sender
{
    [self.dataManager deleteAllSavedData];
    [self loadSavedData];
    [self.tableView reloadData];
}

#pragma mark - Load data

- (void)loadSavedData
{
    self.dataSource = [self.dataManager listDataArray];
}

- (void)reloadController 
{
    self.refreshButton.enabled = NO;
    Weakify(self);
    [self.dataManager listDataArrayWithBlock:^(NSArray *array, NSError *error) {
        Strongify(self);
        if (array) {
            self.dataSource = array;
            [self.tableView reloadData];
        }
        self.refreshButton.enabled = YES;
    }];
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:NSStringFromClass([WFMDetailViewController class]) sender:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([segue.identifier isEqualToString:NSStringFromClass([WFMDetailViewController class]) ]) {
        WFMDetailViewController *vc = segue.destinationViewController;
        NSUInteger index = [[self.tableView indexPathForSelectedRow] row];
        [vc setModel:self.dataSource[index]];
    }
}

@end
