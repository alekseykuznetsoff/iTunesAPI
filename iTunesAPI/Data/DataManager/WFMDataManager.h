//
//  WFMDataManager.h
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFMDataManager : NSObject

+ (instancetype)sharedInstance;
- (instancetype)init NS_UNAVAILABLE;

- (NSArray *)listDataArray;
- (void)listDataArrayWithBlock:(void (^)(NSArray *array, NSError *error))block;

@end
