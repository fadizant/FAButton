//
//  FACircleUIButton.m
//  FASample
//
//  Created by Fadi on 10/1/16.
//  Copyright © 2016 FZ. All rights reserved.
//

#import "FACircleUIButton.h"

@implementation FACircleUIButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews{
    
    [super layoutSubviews];
    [self layoutIfNeeded];
    
    if (self.selected) {
        self.layer.borderColor = [_selectedBorderColor CGColor];
        if(_selectedBackgroundColor)
            self.layer.backgroundColor = [_selectedBackgroundColor CGColor];
    } else if (self.highlighted) {
        self.layer.borderColor = [_highlightedBorderColor CGColor];
        if(_highlightedBackgroundColor)
            self.layer.backgroundColor = [_highlightedBackgroundColor CGColor];
    }else {
        self.layer.borderColor = [_borderColor CGColor];
        if(_normalBackgroundColor)
            self.layer.backgroundColor = [_normalBackgroundColor CGColor];
    }
    
    self.layer.borderWidth = _borderWidth;
    //circle Image
    [self.layer setCornerRadius:_isCircle ? self.frame.size.height/2 :_borderCorner];
    [self.layer setMasksToBounds:YES];
    
}

@end
