//
//  WFMWrapperProtocol.h
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WFMWrapperType) {
    WFMWrapperTypeUnknown = 0,
    WFMWrapperTypeArtist = 1,
    WFMWrapperTypeTrack = 2,
};

@protocol WFMWrapperProtocol <NSObject>

- (WFMWrapperType)wrapperType;

@end
