#import <Foundation/Foundation.h>

@interface Underscore : NSObject {
  id _object;
}

@property (nonatomic, retain) id object;

- (id)initWithObject:(id)object;
+ (Underscore *)underscoreWithObject:(id)object;

@property (nonatomic, readonly) id(^value)(void);

@property (nonatomic, readonly) Underscore *(^each)(id iterator);
@property (nonatomic, readonly) Underscore *(^map)(id iterator);

@end

#define _(object) [Underscore underscoreWithObject:(object)]
