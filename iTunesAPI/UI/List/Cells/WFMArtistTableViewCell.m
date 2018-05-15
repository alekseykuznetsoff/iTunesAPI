//
//  WFMArtistTableViewCell.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 15.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "WFMArtistTableViewCell.h"

@interface WFMArtistTableViewCell ()

@property (nonatomic, strong) NSDictionary *model;

@end

@implementation WFMArtistTableViewCell

- (void)setModel:(id)model
{
    self.model = model;
    [self configureCell];
}

- (void)configureCell
{

}

@end
