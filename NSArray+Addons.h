//
//  NSArray+Addons.h
//  Breeze
//
//  Created by Abdullah Bakhach on 5/7/13.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (Addons)

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block;
- (void)mapObjectsApplyingBlock:(void (^)(id obj))block;
- (NSArray *)flattenArray;
    
@end
