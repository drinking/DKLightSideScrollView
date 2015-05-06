//
//  DKLightSideScrollView.m
//  DKLightSideScrollView
//
//  Created by drinking on 15/4/30.
//  Copyright (c) 2015年 drinking. All rights reserved.
//

#import "DKLightSideScrollView.h"

@interface DKLightSideScrollView ()

@property(nonatomic, retain) UIScrollView *scrollView;
@property(nonatomic, retain) NSMutableArray *itemViews;

@end

@implementation DKLightSideScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    self.scrollView = [UIScrollView new];
    [self.scrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.scrollView];

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];

    _itemViews = [[NSMutableArray alloc] initWithCapacity:5];

    _originX = 0;
    _padding = 5;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self rePositionItemViews];
}

- (void)rePositionItemViews{
    CGFloat originX = self.originX;

    for (int i=0;i<self.itemViews.count;i++){
        DKLightSideScrollItemView *itemView= (DKLightSideScrollItemView*)self.itemViews[i];
        CGFloat itemWidth = itemView.frame.size.width;
        CGFloat itemHeight = itemView.frame.size.height;
        itemView.frame = CGRectMake(originX, 0, itemWidth, itemHeight);
        originX +=(itemWidth+_padding);
    }

    self.scrollView.contentSize = CGSizeMake(originX-_padding, CGRectGetHeight(self.frame));
}

- (void)addScrollItemView:(DKLightSideScrollItemView *)itemView{

    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemTapped:)];
    [itemView addGestureRecognizer:singleFingerTap];
    [itemView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.itemViews addObject:itemView];
    [self.scrollView addSubview:itemView];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    //add animation
}

- (void)addScrollItemViews:(NSArray *)itemViews{
    for (int i=0;i<self.itemViews.count;i++) {
        DKLightSideScrollItemView *itemView = (DKLightSideScrollItemView *) itemViews[i];
        UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemTapped:)];
        [itemView addGestureRecognizer:singleFingerTap];
        [itemView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.itemViews addObject:itemView];
        [self.scrollView addSubview:itemView];
    }

    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)removeScrollItemView:(DKLightSideScrollItemView *)itemView{

    [self.itemViews removeObject:itemView];
    
    [itemView triggerRemoveAnimation:^{
        [self rePositionItemViews];
    } completion:^(BOOL finished) {
        [itemView removeFromSuperview];
    }];

}

#pragma mark - DKLightSideScrollViewDelegate
- (void)itemTapped:(UITapGestureRecognizer *)recognizer {
    DKLightSideScrollItemView *item = (DKLightSideScrollItemView*)recognizer.view;
    if (item != nil) {
        [self.delegate scrollView:self didSelectItem:item];
    }
}

@end