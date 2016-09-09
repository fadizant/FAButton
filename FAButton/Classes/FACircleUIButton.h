//
//  FACircleUIButton.h
//  FASample
//
//  Created by Fadi on 10/1/16.
//  Copyright © 2016 FZ. All rights reserved.
//

#import <UIKit/UIKit.h>

//View IBInspectable property in UI
IB_DESIGNABLE

@interface FACircleUIButton : UIButton

#pragma mark UI Property
/**
 * Border Color
 */
@property (nonatomic,retain) IBInspectable UIColor *borderColor;
/**
 * Border Width
 */
@property (nonatomic) IBInspectable CGFloat borderWidth;
/**
 * Corner
 */
@property (nonatomic) IBInspectable CGFloat Corner;
/**
 * isCorner
 */
@property (nonatomic) IBInspectable BOOL isCorner;
@end
