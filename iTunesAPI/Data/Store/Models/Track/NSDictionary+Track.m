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


@implementation NSDictionary (Track)


- (NSString *)artistName
{
    return self[kWFMAPITrackArtistNameKey];
}

- (NSString *)trackCensoredName
{
    return self[kWFMAPITrackCensoredNameKey];
}

@end
