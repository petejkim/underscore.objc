#import <Foundation/Foundation.h>

@interface Underscore : NSObject {
  id _object;
}

@property (nonatomic, retain) id object;

- (id)initWithObject:(id)object;
+ (Underscore *)underscoreWithObject:(id)object;

@property (nonatomic, readonly) void(^each)(id arg1, ...);

@end

extern Underscore *_;

#define _(object) [Underscore underscoreWithObject:(object)]
#define _a(...)   [NSArray arrayWithObjects:__VA_ARGS__, nil]
#define _ma(...)  [NSMutableArray arrayWithObjects:__VA_ARGS__, nil]
#define _s(...)   [NSSet setWithObjects:__VA_ARGS__, nil]
#define _ms(...)  [NSMutableSet setWithObjects:__VA_ARGS__, nil]
#define _d(...)   [NSDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]
#define _md(...)  [NSMutableDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]
#define _kv(k, v) (v), (k)