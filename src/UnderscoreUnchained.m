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

- (id(^)(id))each {
  __block id list = self.object;
  id block = ^id(id iterator) {
    return self.chain().each(iterator).value();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(id))map {
  id block = ^NSArray *(id iterator) {
    return self.chain().map(iterator).value();
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

#pragma mark - Chaining

- (Underscore *(^)(void))chain {
  id block = ^id {
    return [Underscore underscoreWithObject:self.object];
  };
  return [[block copy] autorelease];
}

#pragma mark -

@end
