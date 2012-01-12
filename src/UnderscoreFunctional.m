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

#pragma mark - Collections

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

#pragma mark - Arrays

- (id(^)(NSArray *))first {
  id block = ^id(NSArray *array) {
    return _(array).first().value();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(NSArray *, NSUInteger))firstN {
  id block = ^id(NSArray *array, NSUInteger n) {
    return _(array).firstN(n).value();
  };
  return [[block copy] autorelease];
}

#pragma mark -

@end
