#import <Foundation/Foundation.h>

@interface Underscore : NSObject {
  id _object;
}

@property (nonatomic, retain) id object;

- (id)initWithObject:(id)object;
+ (id)underscoreWithObject:(id)object;

@end

extern Underscore *_;

#define _(object) [Underscore underscoreWithObject:(object)]
