//
//  WFMArtistTableViewCell.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "WFMArtistTableViewCell.h"
#import "NSDictionary+Artist.h"

@implementation WFMArtistTableViewCell

- (void)decorateCellWithModel:(id)model
{
    NSDictionary<WFMArtistProtocol> *artist = (NSDictionary<WFMArtistProtocol> *)model;
    self.textLabel.text = artist.genreWithArtistName;
}

@end
