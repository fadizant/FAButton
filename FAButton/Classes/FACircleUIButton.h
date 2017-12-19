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
 * Normal Background Color
 */
@property (nonatomic,retain) IBInspectable UIColor *normalBackgroundColor;

/**
 * Selected Border Color
 */
@property (nonatomic,retain) IBInspectable UIColor *selectedBorderColor;
/**
 * Selected Background Color
 */
@property (nonatomic,retain) IBInspectable UIColor *selectedBackgroundColor;

/**
 * Highlighted Border Color
 */
@property (nonatomic,retain) IBInspectable UIColor *highlightedBorderColor;
/**
 * Highlighted Background Color
 */
@property (nonatomic,retain) IBInspectable UIColor *highlightedBackgroundColor;

 /**
 * Border Width
 */
@property (nonatomic) IBInspectable CGFloat borderWidth;
/**
 * Corner
 */
@property (nonatomic) IBInspectable CGFloat borderCorner;
/**
 * isCorner
 */
@property (nonatomic) IBInspectable BOOL isCircle;
@end
