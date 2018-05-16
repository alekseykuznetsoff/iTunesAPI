//
//  MBProgressHUD+Extension.h
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 16.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Extension)

+ (void)showAutoHideInView:(UIView *)view withText:(NSString *)text;
+ (instancetype)showMyHUDAddedTo:(UIView *)view animated:(BOOL)animated;

@end
