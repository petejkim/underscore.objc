#import "Underscore.h"
#import "UnderscoreFunctional.h"
#import "UnderscoreMacros.h"

UnderscoreFunctional *_;

@implementation UnderscoreFunctional

+ (void)initialize {
  if(self == [UnderscoreFunctional class]) {
    _ = [[self alloc] init];
  }
}

- (id(^)(id, id))each {
  id block = ^id(id list, id iterator) {
    return _(list).each(iterator).value();
  };
  return [[block copy] autorelease];
}

- (id(^)(id, id))map {
  id block = ^(id list, id iterator) {
    return _(list).map(iterator).value();
  };
  return [[block copy] autorelease];
}

@end
