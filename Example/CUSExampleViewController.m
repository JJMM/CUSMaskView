//
//  CUSExampleViewController.m
//  CUSMaskView
//
//  Created by zhangyu on 14-2-11.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "CUSExampleViewController.h"

#import "CUSFlashLabel.h"

@interface CUSExampleViewController ()

@end

@implementation CUSExampleViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"CUSMaskView";
    UIView *view = self.view;
    CGFloat x = 20;
    CUSFlashLabel *label = [[CUSFlashLabel alloc]initWithFrame:CGRectMake(x, 80, 300, 50)];
    [label setText:@"Test Label0"];
    [label setFont:[UIFont systemFontOfSize:15]];
    [label setContentMode:UIViewContentModeTop];
    [label startAnimating];
    [view addSubview:label];
    
    
    CUSFlashLabel *label1 = [[CUSFlashLabel alloc]init];
    label1.frame = CGRectMake(x, 160, 300, 100);
    [label1 setText:@"Test Label1"];
    [label1 setFont:[UIFont systemFontOfSize:30]];
    [label1 setSpotlightColor:[UIColor blueColor]];
    [label1 startAnimating];
    [view addSubview:label1];
    
    CUSFlashLabel *label2 = [[CUSFlashLabel alloc]initWithFrame:CGRectMake(x, 270, 300, 200)];
    [label2 setText:@"Test Label2"];
    [label2 setFont:[UIFont systemFontOfSize:60]];
    [label2 setTextColor:[UIColor redColor]];
    [label2 setSpotlightColor:[UIColor yellowColor]];
    [label setContentMode:UIViewContentModeBottom];
    [label2 startAnimating];
    [view addSubview:label2];
}

@end
