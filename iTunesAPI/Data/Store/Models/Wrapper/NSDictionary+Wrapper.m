//
//  NSDictionary+Wrapper.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "NSDictionary+Wrapper.h"

static NSString *const kWFMAPIWrapperTypeKey = @"wrapperType";
static NSString *const kWFMAPIWrapperTypeArtistKey = @"artist";
static NSString *const kWFMAPIWrapperTypeTrackKey = @"track";

@implementation NSDictionary (Wrapper)

- (NSString *)wrapperTypeString
{
    return self[kWFMAPIWrapperTypeKey];
}

- (WFMWrapperType)wrapperType
{
    if ([self.wrapperTypeString isEqualToString:kWFMAPIWrapperTypeTrackKey]) {
        return WFMWrapperTypeTrack;
    }
    if ([self.wrapperTypeString isEqualToString:kWFMAPIWrapperTypeArtistKey]) {
        return WFMWrapperTypeArtist;
    }
    return WFMWrapperTypeUnknown;
}

@end
