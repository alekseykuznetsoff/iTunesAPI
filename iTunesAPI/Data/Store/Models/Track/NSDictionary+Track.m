//
//  NSDictionary+Track.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "NSDictionary+Track.h"

static NSString *const kWFMAPITrackArtistNameKey = @"artistName";
static NSString *const kWFMAPITrackCensoredNameKey = @"trackCensoredName";
static NSString *const kWFMAPITrackCollectionCensoredNameKey = @"collectionCensoredName";
static NSString *const kWFMAPITrackArtworkUrl60Key = @"artworkUrl60";

@implementation NSDictionary (Track)


- (NSString *)artistName
{
    return self[kWFMAPITrackArtistNameKey];
}

- (NSString *)trackCensoredName
{
    return self[kWFMAPITrackCensoredNameKey];
}

- (NSString *)collectionCensoredName
{
    return self[kWFMAPITrackCollectionCensoredNameKey];
}

- (NSString *)artworkUrl60
{
    return self[kWFMAPITrackArtworkUrl60Key];
}


@end
