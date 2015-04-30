//
//  DKLightSideScrollItemView.m
//  DKLightSideScrollView
//
//  Created by drinking on 15/4/30.
//  Copyright (c) 2015年 drinking. All rights reserved.
//

#import "DKLightSideScrollItemView.h"

@implementation DKLightSideScrollItemView

-(void)triggerRemoveAnimation:(void (^)(void))animations completion:(void (^)(BOOL finished))completion{
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectZero;
        self.alpha = 0;
        animations();
    } completion:completion];
}


@end
