//
//  WFMListTableViewCellProtocol.h
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WFMListTableViewCellProtocol <NSObject>

- (void)decorateCellWithModel:(id)model;

@end
