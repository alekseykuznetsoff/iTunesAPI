//
//  NSDictionary+Artist.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "NSDictionary+Artist.h"

static NSString *const kWFMAPIArtistNameKey = @"artistName";
static NSString *const kWFMAPIArtistPrimaryGenreNameKey = @"primaryGenreName";

@implementation NSDictionary (Artist)

- (NSString *)artistName
{
    return self[kWFMAPIArtistNameKey];
}

- (NSString *)primaryGenreName
{
    return self[kWFMAPIArtistPrimaryGenreNameKey];
}

- (NSString *)genreWithArtistName
{
    return [NSString stringWithFormat:@"%@, %@", self.primaryGenreName, self.artistName];
}

@end
