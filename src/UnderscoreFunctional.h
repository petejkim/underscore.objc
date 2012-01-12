#import <Foundation/Foundation.h>

@class
  Underscore
;

@interface UnderscoreFunctional : NSObject

#pragma mark - Collections

@property (nonatomic, readonly) void(^each)(id list, id iterator);
@property (nonatomic, readonly) id(^map)(id list, id iterator);

#pragma mark - Arrays

@property (nonatomic, readonly) id(^first)(NSArray *array);
@property (nonatomic, readonly) NSArray *(^firstN)(NSArray *array, NSUInteger n);

#pragma mark - Utility

@property (nonatomic, readonly) void(^times)(NSUInteger n, id iterator);

#pragma mark - Chaining

@property (nonatomic, readonly) Underscore *(^chain)(id obj);

#pragma mark -

@end

extern UnderscoreFunctional *_;
