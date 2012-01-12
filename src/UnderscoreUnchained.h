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

@property (nonatomic, readonly) id(^each)(id iterator);
@property (nonatomic, readonly) NSArray *(^map)(id iterator);

#pragma mark - Arrays

@property (nonatomic, readonly) id(^first)(void);
@property (nonatomic, readonly) NSArray *(^firstN)(NSUInteger n);

#pragma mark - Chaining

@property (nonatomic, readonly) Underscore *(^chain)(void);

#pragma mark -

@end

#define _(object) [UnderscoreUnchained underscoreUnchainedWithObject:(object)]
