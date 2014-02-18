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
    CUSFlashLabel *label = [[CUSFlashLabel alloc]initWithFrame:CGRectMake(20, 50, 300, 100)];
    [label setText:@"Test Label0"];
    [label setFont:[UIFont systemFontOfSize:15]];
    [label startAnimating];
    [view addSubview:label];
    
    
    CUSFlashLabel *label1 = [[CUSFlashLabel alloc]init];
    label1.frame = CGRectMake(20, 160, 300, 100);
    [label1 setText:@"Test Label1"];
    [label1 setFont:[UIFont systemFontOfSize:20]];
    [label1 setSpotlightColor:[UIColor blueColor]];
    [label1 startAnimating];
    [view addSubview:label1];
    
    CUSFlashLabel *label2 = [[CUSFlashLabel alloc]initWithFrame:CGRectMake(20, 270, 300, 100)];
    [label2 setText:@"Test Label2"];
    [label2 setFont:[UIFont systemFontOfSize:25]];
    [label2 setTextColor:[UIColor redColor]];
    [label2 setSpotlightColor:[UIColor yellowColor]];
    [label2 startAnimating];
    [view addSubview:label2];
}

@end
