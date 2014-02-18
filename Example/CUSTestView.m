//
//  CUSTestView.m
//  CUSMaskView
//
//  Created by zhangyu on 14-2-17.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "CUSTestView.h"

@implementation CUSTestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


+ (Class)layerClass
{
    return [CAGradientLayer class];
}

@end
