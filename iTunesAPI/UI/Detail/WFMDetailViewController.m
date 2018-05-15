//
//  WFMDetailViewController.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "WFMDetailViewController.h"
#import "NSDictionary+Track.h"

@interface WFMDetailViewController ()

@property (nonatomic, strong) NSDictionary<WFMTrackProtocol> *track;

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;

@end

@implementation WFMDetailViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.firstLabel.text = self.track.artistName;
    self.secondLabel.text = self.track.collectionCensoredName;
    self.thirdLabel.text = self.track.trackCensoredName;
}

#pragma mark - Private

- (void)setModel:(id)model
{
    self.track = (NSDictionary<WFMTrackProtocol> *)model;
}

@end
