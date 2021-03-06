//
//  WFMTrackProtocol.h
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 12.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WFMTrackProtocol <NSObject>

- (NSString *)artistName;
- (NSString *)trackCensoredName;
- (NSString *)collectionCensoredName;

- (NSString *)artworkUrl60;
- (NSString *)artworkUrl100;

@end
