#import "UnderscoreUnchained.h"
#import "Underscore.h"

@implementation UnderscoreUnchained

@synthesize
  object=_object
;

- (void)dealloc {
  self.object = nil;
  [super dealloc];
}

- (id)initWithObject:(id)object {
  if((self = [super init])) {
    self.object = object;
  }
  return self;
}

+ (UnderscoreUnchained *)underscoreUnchainedWithObject:(id)object {
  return [[[self alloc] initWithObject:object] autorelease];
}

#pragma mark - Collections

- (void(^)(id))each {
  id block = ^(id iterator) {
    self.chain().each(iterator);
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(id))map {
  id block = ^NSArray *(id iterator) {
    return self.chain().map(iterator).value();
  };
  return [[block copy] autorelease];
}

- (NSUInteger (^)(void))size {
  id block = ^NSUInteger(void) {
    return [(NSNumber *)(self.chain().size().value()) unsignedIntegerValue];
  };
  return [[block copy] autorelease];
}

#pragma mark - Arrays

- (id(^)(void))first {
  id block = ^id {
    return self.chain().first().value();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(NSUInteger))firstN {
  id block = ^NSArray *(NSUInteger n) {
    return self.chain().firstN(n).value();
  };
  return [[block copy] autorelease];
}

#pragma mark - Utility

- (void(^)(id))times {
  id block = ^(id iterator) {
    self.chain().times(iterator);
  };
  return [[block copy] autorelease];
}

#pragma mark - Chaining

- (Underscore *(^)(void))chain {
  id block = ^id {
    return [Underscore underscoreWithObject:self.object];
  };
  return [[block copy] autorelease];
}

#pragma mark -

@end
