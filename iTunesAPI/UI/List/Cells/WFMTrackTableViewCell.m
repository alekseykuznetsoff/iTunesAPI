//
//  WFMTrackTableViewCell.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "WFMTrackTableViewCell.h"
#import "NSDictionary+Track.h"
#import <UIImageView+WebCache.h>

@interface WFMTrackTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *artworkImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

@end

@implementation WFMTrackTableViewCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.artworkImageView.image = nil;
}

- (void)decorateCellWithModel:(id)model
{
    NSDictionary<WFMTrackProtocol> *track = (NSDictionary<WFMTrackProtocol> *)model;
    self.firstLabel.text = track.trackCensoredName;
    self.secondLabel.text = track.artistName;
    
    NSString *URLString = track.artworkUrl60;
    if (URLString.length) {
        [self.artworkImageView sd_setImageWithURL:[NSURL URLWithString:URLString]];
    }
}

@end
