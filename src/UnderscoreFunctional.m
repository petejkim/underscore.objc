#import "UnderscoreFunctional.h"
#import "UnderscoreSupport.h"

UnderscoreFunctional *_;

@implementation UnderscoreFunctional

+ (void)initialize {
  if(self == [UnderscoreFunctional class]) {
    _ = [[self alloc] init];
  }
}

#pragma mark - Collections

- (void(^)(id, id))each {
  id block = ^(id list, id iterator) {
    _(list).each(iterator);
  };
  return [[block copy] autorelease];
}

- (id(^)(id, id))map {
  id block = ^id(id list, id iterator) {
    return _(list).map(iterator);
  };
  return [[block copy] autorelease];
}

- (NSUInteger (^)(id))size {
  id block = ^NSUInteger(id list) {
    return _(list).size();
  };
  return [[block copy] autorelease];
}

#pragma mark - Arrays

- (id(^)(NSArray *))first {
  id block = ^id(NSArray *array) {
    return _(array).first();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(NSArray *, NSUInteger))firstN {
  id block = ^id(NSArray *array, NSUInteger n) {
    return _(array).firstN(n);
  };
  return [[block copy] autorelease];
}

#pragma mark - Utility

- (void(^)(NSUInteger, id))times {
  id block = ^(NSUInteger n, id iterator) {
    _(n).times(iterator);
  };
  return [[block copy] autorelease];
}

#pragma mark -

- (Underscore *(^)(id))chain {
  id block = ^Underscore *(id object) {
    return _(object).chain();
  };
  return [[block copy] autorelease];
}

@end
