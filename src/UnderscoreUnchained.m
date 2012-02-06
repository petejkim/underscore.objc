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

- (id(^)(id iterator, id memo))reduce {
  id block = ^id (id iterator, id memo) {
    return self.chain().reduce(iterator, memo).value();
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

- (id(^)(void))last {
  id block = ^id {
    return self.chain().last().value();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(void))initial {
  id block = ^NSArray * {
    return self.chain().initial().value();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(void))rest {
  id block = ^NSArray * {
    return self.chain().rest().value();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(NSUInteger))initialN {
  id block = ^NSArray *(NSUInteger n) {
    return self.chain().initialN(n).value();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(NSUInteger))restN {
  id block = ^NSArray *(NSUInteger n) {
    return self.chain().restN(n).value();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(NSUInteger))firstN {
  id block = ^NSArray *(NSUInteger n) {
    return self.chain().firstN(n).value();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(NSUInteger))lastN {
  id block = ^NSArray *(NSUInteger n) {
    return self.chain().lastN(n).value();
  };
  return [[block copy] autorelease];
}

- (NSArray *(^)(void))compact {
  id block = ^NSArray * {
    return self.chain().compact().value();
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

- (id(^)(void))value {
  id block = ^id {
    return self.chain().value();
  };
  return [[block copy] autorelease];
}

- (BOOL(^)(void))boolValue {
  id block = ^BOOL {
    return self.chain().boolValue();
  };
  return [[block copy] autorelease];
}

- (char(^)(void))charValue {
  id block = ^char {
    return self.chain().charValue();
  };
  return [[block copy] autorelease];
}

- (double(^)(void))doubleValue {
  id block = ^double {
    return self.chain().doubleValue();
  };
  return [[block copy] autorelease];
}

- (float(^)(void))floatValue {
  id block = ^float {
    return self.chain().floatValue();
  };
  return [[block copy] autorelease];
}

- (int(^)(void))intValue {
  id block = ^int {
    return self.chain().intValue();
  };
  return [[block copy] autorelease];
}

- (NSInteger(^)(void))integerValue {
  id block = ^NSInteger {
    return self.chain().integerValue();
  };
  return [[block copy] autorelease];
}

- (long long(^)(void))longlongValue {
  id block = ^long long {
    return self.chain().longlongValue();
  };
  return [[block copy] autorelease];
}

- (long long(^)(void))longLongValue {
  id block = ^long long {
    return self.chain().longLongValue();
  };
  return [[block copy] autorelease];
}

- (long(^)(void))longValue {
  id block = ^long {
    return self.chain().longValue();
  };
  return [[block copy] autorelease];
}

- (short(^)(void))shortValue {
  id block = ^short {
    return self.chain().shortValue();
  };
  return [[block copy] autorelease];
}

- (unsigned char(^)(void))ucharValue {
  id block = ^unsigned char {
    return self.chain().ucharValue();
  };
  return [[block copy] autorelease];
}

- (unsigned char(^)(void))unsignedCharValue {
  id block = ^unsigned char {
    return self.chain().unsignedCharValue();
  };
  return [[block copy] autorelease];
}

- (NSUInteger(^)(void))uintegerValue {
  id block = ^NSUInteger {
    return self.chain().uintegerValue();
  };
  return [[block copy] autorelease];
}

- (NSUInteger(^)(void))unsignedIntegerValue {
  id block = ^NSUInteger {
    return self.chain().unsignedIntegerValue();
  };
  return [[block copy] autorelease];
}

- (unsigned int(^)(void))uintValue {
  id block = ^unsigned int {
    return self.chain().uintValue();
  };
  return [[block copy] autorelease];
}

- (unsigned int(^)(void))unsignedIntValue {
  id block = ^unsigned int {
    return self.chain().unsignedIntValue();
  };
  return [[block copy] autorelease];
}

- (unsigned long long(^)(void))ulonglongValue {
  id block = ^unsigned long long {
    return self.chain().ulonglongValue();
  };
  return [[block copy] autorelease];
}

- (unsigned long long(^)(void))unsignedLongLongValue {
  id block = ^unsigned long long {
    return self.chain().unsignedLongLongValue();
  };
  return [[block copy] autorelease];
}

- (unsigned long(^)(void))ulongValue {
  id block = ^unsigned long {
    return self.chain().ulongValue();
  };
  return [[block copy] autorelease];
}

- (unsigned long(^)(void))unsignedLongValue {
  id block = ^unsigned long {
    return self.chain().unsignedLongValue();
  };
  return [[block copy] autorelease];
}

- (unsigned short(^)(void))ushortValue {
  id block = ^unsigned short {
    return self.chain().ushortValue();
  };
  return [[block copy] autorelease];
}

- (unsigned short(^)(void))unsignedShortValue {
  id block = ^unsigned short {
    return self.chain().unsignedShortValue();
  };
  return [[block copy] autorelease];
}

#pragma mark -

@end
