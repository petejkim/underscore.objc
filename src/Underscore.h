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

#pragma mark - Arrays

@property (nonatomic, readonly) Underscore *(^first)(void);
@property (nonatomic, readonly) Underscore *(^firstN)(NSUInteger n);

#pragma mark - Utility

@property (nonatomic, readonly) Underscore *(^times)(id iterator);

#pragma mark - Chaining

@property (nonatomic, readonly) Underscore *(^chain)(void);
@property (nonatomic, readonly) id(^value)(void);

#pragma mark -

@end
