//
//  UILabel+background.h
//  Breeze
//
//  Created by Abdullah Bakhach on 10/22/13.
//
//

#import <UIKit/UIKit.h>

@interface UILabel (background)


- (void)addBackgroundWithColor:(UIColor *)backgroundColor 
                    parentView:(UIView *)parentView 
                        margin:(NSNumber *)margin 
                 topConstraint:(NSNumber *)topConstraint 
              bottomConstraint:(NSNumber *)bottomConstraint 
                leftConstraint:(NSNumber *)leftConstraint 
               rightConstraint:(NSNumber *)rightConstraint;
@end
