//
//  DMTabButton.m
//  DMall
//
//  Created by jslsxu on 15/9/21.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import "DMTabButton.h"

@implementation DMTabButton
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSString *title = [self titleForState:UIControlStateNormal];
    if (title.length > 0)
    {
        CGSize imageSize = self.imageView.size;
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + self.spacing), 0.0);
        
        CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
        self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + self.spacing + 10), 0.0, 0.0, - titleSize.width);
    } else {
        self.titleEdgeInsets = UIEdgeInsetsZero;
        self.imageEdgeInsets = UIEdgeInsetsZero;
    }
}

- (void)setSpacing:(CGFloat)spacing
{
    _spacing = spacing;
    [self setNeedsLayout];
}

- (void)setBadge:(NSString *)badge
{
    _badge = badge;
    
}
@end
