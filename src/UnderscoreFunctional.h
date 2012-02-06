#import <Foundation/Foundation.h>

@class
  Underscore
;

@interface UnderscoreFunctional : NSObject

#pragma mark - Collections

@property (nonatomic, readonly) void(^each)(id list, id iterator);
@property (nonatomic, readonly) id(^map)(id list, id iterator);
@property (nonatomic, readonly) id(^reduce)(id list, id iterator, id memo);
@property (nonatomic, readonly) NSUInteger(^size)(id list);

#pragma mark - Arrays

@property (nonatomic, readonly) id(^first)(NSArray *array);
@property (nonatomic, readonly) id(^last)(NSArray *array);
@property (nonatomic, readonly) NSArray *(^initial)(NSArray *array);
@property (nonatomic, readonly) NSArray *(^rest)(NSArray *array);
@property (nonatomic, readonly) NSArray *(^initialN)(NSArray *array, NSUInteger n);
@property (nonatomic, readonly) NSArray *(^restN)(NSArray *array, NSUInteger n);
@property (nonatomic, readonly) NSArray *(^firstN)(NSArray *array, NSUInteger n);
@property (nonatomic, readonly) NSArray *(^lastN)(NSArray *array, NSUInteger n);
@property (nonatomic, readonly) NSArray *(^compact)(NSArray *array);

#pragma mark - Utility

@property (nonatomic, readonly) void(^times)(NSUInteger n, id iterator);

#pragma mark - Chaining

@property (nonatomic, readonly) Underscore *(^chain)(id obj);

#pragma mark -

@end

extern UnderscoreFunctional *_;
