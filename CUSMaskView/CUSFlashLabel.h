//
//  CUSFlashLabel.h
//  CUSMaskView
//
//  Created by zhangyu on 14-2-11.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CUSFlashLabel : UILabel
@property (nonatomic, retain) UIColor *spotlightColor;

- (void)startAnimating;

- (void)stopAnimating;
@end
