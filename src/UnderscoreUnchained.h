#import <Foundation/Foundation.h>

@class
  Underscore
;

@interface UnderscoreUnchained : NSObject {
  id _object;
}

@property (nonatomic, retain) id object;

- (id)initWithObject:(id)object;
+ (UnderscoreUnchained *)underscoreUnchainedWithObject:(id)object;

#pragma mark - Collections

@property (nonatomic, readonly) void(^each)(id iterator);
@property (nonatomic, readonly) NSArray *(^map)(id iterator);
@property (nonatomic, readonly) NSUInteger(^size)(void);
@property (nonatomic, readonly) id(^reduce)(id iterator, id memo);

#pragma mark - Arrays

@property (nonatomic, readonly) id(^first)(void);
@property (nonatomic, readonly) id(^last)(void);
@property (nonatomic, readonly) NSArray *(^initial)(void);
@property (nonatomic, readonly) NSArray *(^rest)(void);
@property (nonatomic, readonly) NSArray *(^initialN)(NSUInteger n);
@property (nonatomic, readonly) NSArray *(^restN)(NSUInteger n);
@property (nonatomic, readonly) NSArray *(^firstN)(NSUInteger n);
@property (nonatomic, readonly) NSArray *(^lastN)(NSUInteger n);

#pragma mark - Utility

@property (nonatomic, readonly) void(^times)(id iterator);

#pragma mark - Chaining

@property (nonatomic, readonly) Underscore *(^chain)(void);

#pragma mark -

@end

