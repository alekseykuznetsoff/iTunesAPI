//
//  NSDictionary+Wrapper.h
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "WFMWrapperProtocol.h"

@interface NSDictionary (Wrapper) <WFMWrapperProtocol>

- (NSString *)wrapperTypeString;

@end
