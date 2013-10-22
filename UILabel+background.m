//
//  UILabel+background.m
//  Breeze
//
//  Created by Abdullah Bakhach on 10/22/13.
//
//

#import "UILabel+background.h"
#import "NSArray+Addons.h"

@implementation UILabel (background)

- (void)addBackgroundWithColor:(UIColor *)backgroundColor parentView:(UIView *)parentView margin:(NSNumber *)margin topConstraint:(NSNumber *)topConstraint bottomConstraint:(NSNumber *)bottomConstraint leftConstraint:(NSNumber *)leftConstraint rightConstraint:(NSNumber *)rightConstraint {
    [self sizeToFit];
    CGSize sizeThatFits = self.frame.size;
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    backgroundView.backgroundColor = backgroundColor;
    backgroundView.layer.cornerRadius = 4;
    backgroundView.layer.masksToBounds = YES;
    [backgroundView addSubview:self];
    [parentView addSubview:backgroundView];
    
    
   // adjust server message frame
    
    [@[self, backgroundView] mapObjectsApplyingBlock:^(UIView *view) {
        UIView *superview = [view superview];
        [view removeFromSuperview];
        [view setTranslatesAutoresizingMaskIntoConstraints:NO];
        [view setHidden:NO];
        [superview addSubview:view];
    }];
    
    NSDictionary *buttonBindingDict = @{ @"label": self,
                                         @"background":backgroundView,
                                         };
    
    NSString *topConstraintStr = @"";
    NSString *bottomConstraintStr = @"";
    NSString *leftConstraintStr = @"";
    NSString *rightConstraintStr = @"";
    
    if (topConstraint) {
        topConstraintStr = [NSString stringWithFormat:@"|-%f-",[topConstraint floatValue]];
    }
    
    if (bottomConstraint) {
        bottomConstraintStr = [NSString stringWithFormat:@"-%f-|",[topConstraint floatValue]];
    }
    
    if (leftConstraint) {
        leftConstraintStr = [NSString stringWithFormat:@"|-%f-",[leftConstraint floatValue]];
    }
    
    if (rightConstraint) {
        rightConstraintStr = [NSString stringWithFormat:@"-%f-|",[rightConstraint floatValue]];
    }
    
    NSArray *backgroundConstraints = [@[[NSString stringWithFormat:@"V:%@[background(==%f)]%@",topConstraintStr, (sizeThatFits.height + ([margin floatValue]* 2)), bottomConstraintStr],
                              [NSString stringWithFormat:@"%@[background(>=%f)]%@", leftConstraintStr, (sizeThatFits.width + ([margin floatValue]* 2)), rightConstraintStr],
                              ] mapObjectsUsingBlock:^id(NSString *formatString, NSUInteger idx){
                                  return [NSLayoutConstraint constraintsWithVisualFormat:formatString options:0 metrics:nil views:buttonBindingDict];
                              }];
    
    [parentView addConstraints:[backgroundConstraints flattenArray]];
    
    NSArray *labelConstraints = [@[[NSString stringWithFormat:@"V:|-%f-[label]-%f-|", [margin floatValue],[margin floatValue]],
                                   [NSString stringWithFormat:@"|-%f-[label]-%f-|", [margin floatValue],[margin floatValue]]
                                   ] mapObjectsUsingBlock:^id(NSString *formatString, NSUInteger idx){
                                       return [NSLayoutConstraint constraintsWithVisualFormat:formatString options:0 metrics:nil views:buttonBindingDict];
                                   }];
    
    [backgroundView addConstraints:[labelConstraints flattenArray]];
    
}

@end
