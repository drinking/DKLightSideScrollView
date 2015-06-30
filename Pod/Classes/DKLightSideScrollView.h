//
//  DKLightSideScrollView.h
//  DKLightSideScrollView
//
//  Created by drinking on 15/4/30.
//  Copyright (c) 2015年 drinking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKLightSideScrollItemView.h"

@class DKLightSideScrollView;

@protocol DKLightSideScrollViewDelegate

@optional
- (void)scrollView:(DKLightSideScrollView *)scrollView didSelectItem:(DKLightSideScrollItemView *)item;
@end

@interface DKLightSideScrollView : UIView

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) NSMutableArray *itemViews;

@property (nonatomic, weak) id<DKLightSideScrollViewDelegate> delegate;

@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, assign) CGFloat originX;

- (void)addScrollItemView:(DKLightSideScrollItemView *)itemView;
- (void)addScrollItemViews:(NSArray *)itemViews;
- (void)removeScrollItemView:(DKLightSideScrollItemView *)itemView;
@end
