//
//  DKLightSideScrollItemView.h
//  DKLightSideScrollView
//
//  Created by drinking on 15/4/30.
//  Copyright (c) 2015年 drinking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKLightSideScrollItemView : UIView

-(void)triggerRemoveAnimation:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;

@end
