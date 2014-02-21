//
//  CUSFlashLabel.m
//  CUSMaskView
//
//  Created by zhangyu on 14-2-11.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "CUSFlashLabel.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface CUSFlashLabel(){
    UIColor*        _spotlightColor;
    
    NSTimer*        _timer;
    CGFloat         _spotlightPoint;
    
    CGContextRef    _maskContext;
    void*           _maskData;
}
@end

@implementation CUSFlashLabel
@synthesize spotlightColor = _spotlightColor;

- (id)init
{
    self = [super init];
    if (self) {
        [self initValue];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
    if (self) {
        [self initValue];
    }
    
    return self;
}

-(void)initValue{
    self.text = @"";
    self.font = [UIFont systemFontOfSize:16];
    self.textColor = [UIColor colorWithWhite:0.25 alpha:1];
    self.backgroundColor = [UIColor clearColor];
    self.contentMode = UIViewContentModeCenter;
    
    self.spotlightColor = [UIColor whiteColor];
}

#pragma mark -
#pragma mark Private
- (void)newMask {
    @try {
        CGRect rect = self.frame;
        CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
        int bitmapBytesPerRow = (rect.size.width * 4);
        //    int bitmapByteCount = (bitmapBytesPerRow * rect.size.height);
        _maskContext = CGBitmapContextCreate(_maskData, rect.size.width, rect.size.height, 8, bitmapBytesPerRow, space, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
        CGColorSpaceRelease(space);
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

- (void)releaseMask {
    CGContextRelease(_maskContext);
    free(_maskData);
    _maskContext = nil;
    _maskData = nil;
}

- (CGImageRef)newSpotlightMask:(CGRect)rect origin:(CGPoint)origin radius:(CGFloat)radius {
    CGContextClearRect(_maskContext, rect);
    
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {1, 1, 1, 1, 0, 0, 0, 0};
    CGFloat locations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, locations, 2);
    CGContextDrawRadialGradient(_maskContext, gradient, origin, 0, origin, radius, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(space);
    
    return CGBitmapContextCreateImage(_maskContext);
}

- (void)updateSpotlight {
    _spotlightPoint += 1.3/32;
    if (_spotlightPoint > 2) {
        _spotlightPoint = -0.5;
    }
    if (_spotlightPoint <= 1.5) {
        [self setNeedsDisplay];
    }
}
#pragma mark -
#pragma mark UIView

- (void)drawRect:(CGRect)rect {
    NSTextAlignment _textAlignment = self.textAlignment;
    UIFont *_font = self.font;
    UIColor *_textColor = self.textColor;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGSize textSize = [self sizeThatFits:CGSizeZero];
    
    CGFloat x = 0.0f;
    
    if (_textAlignment == NSTextAlignmentRight) {
        x = self.frame.size.width - textSize.width;
        
    } else if (_textAlignment == NSTextAlignmentCenter) {
        x = ceil(self.frame.size.width/2 - textSize.width/2);
    }
    
    CGFloat y = 0.0f;
    if (self.contentMode == UIViewContentModeCenter) {
        y = ceil(rect.size.height/2 - _font.lineHeight/2);
        
    } else if (self.contentMode == UIViewContentModeBottom) {
        y = rect.size.height - _font.lineHeight;
    } else {
        y = 0;
    }
    CGContextSetFillColorWithColor(context, _textColor.CGColor);
    [self.text drawAtPoint:CGPointMake(x, y) withFont:self.font];
    if (_timer) {
        CGPoint spotOrigin = CGPointMake(x + (textSize.width * _spotlightPoint),y);
        CGFloat spotRadius = self.font.lineHeight*2;
        
        CGImageRef mask = [self newSpotlightMask:rect origin:spotOrigin radius:spotRadius];
        CGContextClipToMask(context, rect, mask);
        CGImageRelease(mask);
        
        [_spotlightColor setFill];
        [self.text drawAtPoint:CGPointMake(x, y) withFont:self.font];
    }
}

#pragma mark -
#pragma mark Public

- (void)startAnimating {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/32 target:self
                                                selector:@selector(updateSpotlight) userInfo:nil repeats:YES];
        _spotlightPoint = -0.5;
        [self newMask];
    }
}

- (void)stopAnimating {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
        [self releaseMask];
    }
    [self setNeedsDisplay];
}
- (void)dealloc
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
        [self releaseMask];
    }
}
@end
