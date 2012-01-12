#import <Foundation/Foundation.h>

@interface Underscore : NSObject {
  id _object;
}

@property (nonatomic, retain) id object;

- (id)initWithObject:(id)object;
+ (Underscore *)underscoreWithObject:(id)object;

#pragma mark - Collections

@property (nonatomic, readonly) Underscore *(^each)(id iterator);
@property (nonatomic, readonly) Underscore *(^map)(id iterator);
@property (nonatomic, readonly) Underscore *(^reduce)(id iterator, id memo);
@property (nonatomic, readonly) Underscore *(^size)(void);

#pragma mark - Arrays

@property (nonatomic, readonly) Underscore *(^first)(void);
@property (nonatomic, readonly) Underscore *(^last)(void);
@property (nonatomic, readonly) Underscore *(^initial)(void);
@property (nonatomic, readonly) Underscore *(^rest)(void);
@property (nonatomic, readonly) Underscore *(^initialN)(NSUInteger n);
@property (nonatomic, readonly) Underscore *(^restN)(NSUInteger n);
@property (nonatomic, readonly) Underscore *(^firstN)(NSUInteger n);
@property (nonatomic, readonly) Underscore *(^lastN)(NSUInteger n);

#pragma mark - Utility

@property (nonatomic, readonly) Underscore *(^times)(id iterator);

#pragma mark - Chaining

@property (nonatomic, readonly) Underscore *(^chain)(void);
@property (nonatomic, readonly) id(^value)(void);

#pragma mark -

@end
