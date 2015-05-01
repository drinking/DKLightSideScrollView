//
//  DKViewController.m
//  DKLightSideScrollView
//
//  Created by drinking on 04/30/2015.
//  Copyright (c) 2014 drinking. All rights reserved.
//

#import "DKViewController.h"

#import <DKLightSideScrollView/DKLightSideScrollView.h>

@interface DKViewController ()<DKLightSideScrollViewDelegate>
@property (nonatomic, strong) DKLightSideScrollView *scrollView;
@property (nonatomic, strong) DKLightSideScrollItemView *itemView;
@end

@implementation DKViewController

-(void)loadView{
    [super loadView];
    _scrollView = [[DKLightSideScrollView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 200)];
    _scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
    
    for (int i=0;i<5;i++){
        DKLightSideScrollItemView *itemView = [[DKLightSideScrollItemView alloc] initWithFrame:CGRectMake(0, 0, 5*i+10, 50)];
        itemView.backgroundColor = [UIColor redColor];
        [self.scrollView addScrollItemView:itemView];
    }

    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)-50, CGRectGetWidth(self.view.frame), 50)];
    addButton.backgroundColor = [UIColor blackColor];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addButton setTitle:@"Add" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addItem) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)addItem{
    DKLightSideScrollItemView *itemView = [[DKLightSideScrollItemView alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    itemView.backgroundColor = [UIColor redColor];
    [self.scrollView addScrollItemView:itemView];
}

- (void)scrollView:(DKLightSideScrollView *)scrollView didSelectItem:(DKLightSideScrollItemView *)item{
    [self.scrollView removeScrollItemView:item];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
