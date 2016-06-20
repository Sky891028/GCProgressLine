//
//  GCProgressLine.m
//  purchasingManager
//
//  Created by Sky on 16/4/25.
//  Copyright © 2016年 郑州悉知. All rights reserved.
//

#import "GCProgressLine.h"

@interface GCProgressLine ()
/**
 *  进度条 progressView
 */
@property (nonatomic, strong) UIView *progressView;

/**
 *  progressView Rect
 */
@property (nonatomic) CGRect rect_progressView;

/**
 *  限制高度大小
 *
 *  @param rect self.height
 */
- (void)_setHeightRestrictionOfFrame:(CGFloat)height;

@end

@implementation GCProgressLine


- (UIView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIView alloc] initWithFrame:CGRectZero];
        _progressView.backgroundColor = [UIColor colorWithRed:0.973 green:0.745 blue:0.306 alpha:1.000];
        [self addSubview:self.progressView];
    }
    return _progressView;
}

#pragma mark -  initWithFrame

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.937 green:0.958 blue:1.000 alpha:1.000];
        
        [self _setHeightRestrictionOfFrame:frame.size.height];
    }
    return self;
}

#pragma mark - Privite Method
- (void)_setHeightRestrictionOfFrame:(CGFloat)height
{
    _progressHeight = height;
    self.rect_progressView = CGRectZero;
    _rect_progressView.size.height = _progressHeight;
    self.progressView.frame = self.rect_progressView;
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    if (cornerRadius) {
        self.layer.cornerRadius = self.progressView.layer.cornerRadius =  cornerRadius;
    }
}

#pragma mark - Setter

- (void)setProgressHeight:(CGFloat)progressHeight
{
    [self _setHeightRestrictionOfFrame:progressHeight];
}

- (void)setProgressTintColor:(UIColor *)progressTintColor
{
    _progressTintColor = progressTintColor;
    
    self.backgroundColor = _progressTintColor;
}

- (void)setTrackTintColor:(UIColor *)trackTintColor
{
    _trackTintColor = trackTintColor;
    
    self.progressView.backgroundColor = _trackTintColor;
}

- (void)setProgressValue:(CGFloat)progressValue
{
    if (progressValue > _progressMaxValue) {
        _progressValue = _progressMaxValue;
    }else{
        _progressValue  = progressValue;
    }
    
    _rect_progressView.size.width = self.bounds.size.width*_progressValue/_progressMaxValue;
    _rect_progressView.size.height = self.bounds.size.height;
    
    NSTimeInterval durationValue = (_progressValue/2.0) / _progressMaxValue + .5;
    
    [UIView animateWithDuration:durationValue animations:^{
        
        self.progressView.frame = _rect_progressView;
    }];
}




@end
