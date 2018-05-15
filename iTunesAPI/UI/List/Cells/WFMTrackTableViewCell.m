//
//  WFMTrackTableViewCell.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "WFMTrackTableViewCell.h"
#import "NSDictionary+Track.h"

@implementation WFMTrackTableViewCell

- (void)decorateCellWithModel:(id)model
{
    NSDictionary<WFMTrackProtocol> *track = (NSDictionary<WFMTrackProtocol> *)model;
    self.textLabel.text = track.trackCensoredName;
    self.detailTextLabel.text = track.artistName;}

@end
