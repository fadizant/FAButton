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
    
    self.layer.borderColor = [_borderColor CGColor];
    self.layer.borderWidth = _borderWidth;
    //circle Image
    [self.layer setCornerRadius:_isCorner ? self.frame.size.height/2 :_Corner];
    [self.layer setMasksToBounds:YES];
    
}

@end
