//
//  MBProgressHUD+Extension.m
//  iTunesAPI
//
//  Created by Kuznetsov Aleksey on 16.05.2018.
//  Copyright © 2018 Kuznetsov Aleksey. All rights reserved.
//

#import "MBProgressHUD+Extension.h"

static const NSTimeInterval kMBProgressHUDAutoHideDelayInSeconds = 1.5;
static const CGFloat kMBProgressHUDBezelColorWhite = 0.9;
static const CGFloat kMBProgressHUDBezelColorAlpha = 0.95;

@implementation MBProgressHUD (Extension)

+ (void)showAutoHideInView:(UIView *)view withText:(NSString *)text
{
    [MBProgressHUD hideHUDForView:view animated:NO];
    MBProgressHUD *hud = [MBProgressHUD showMyHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:kMBProgressHUDAutoHideDelayInSeconds];
}

+ (instancetype)showMyHUDAddedTo:(UIView *)view animated:(BOOL)animated
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:kMBProgressHUDBezelColorWhite
                                            alpha:kMBProgressHUDBezelColorAlpha];
    return hud;
}

@end
