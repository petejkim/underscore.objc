#import "Underscore.h"

typedef void (^void_id_NSUInteger_NSArray)(id, NSUInteger, NSArray *);
typedef void (^void_id_NSSet)(id, NSSet *);
typedef void (^void_id_id_NSDictionary)(id, id, NSDictionary *);
typedef id (^id_id_NSUInteger_NSArray)(id, NSUInteger, NSArray *);
typedef id (^id_id_NSSet)(id, NSSet *);
typedef id (^id_id_id_NSDictionary)(id, id, NSDictionary *);
typedef void (^void_NSUInteger)(NSUInteger);
typedef id (^id_id_id)(id, id);

static BOOL isBlock(id obj) {
  return [NSStringFromClass([obj class]) rangeOfString:@"Block"].location != NSNotFound;
}

@implementation Underscore

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

+ (Underscore *)underscoreWithObject:(id)object {
  return [[[self alloc] initWithObject:object] autorelease];
}

#pragma mark - Collections

- (Underscore *(^)(id))each {
  id list = self.object;
  id block = ^Underscore *(id iterator) {
    if(list && iterator) {
      if([list isKindOfClass:[NSArray class]]) {
        NSUInteger index = 0;
        for(id element in list) {
          ((void_id_NSUInteger_NSArray)iterator)(element, index, list);
          index ++;
        }
      } else if([list isKindOfClass:[NSSet class]]) {
        for(id element in list) {
          ((void_id_NSSet)iterator)(element, list);
        }
      } else if([list isKindOfClass:[NSDictionary class]]) {
        for(id key in list) {
          ((void_id_id_NSDictionary)iterator)([list objectForKey:key], key, list);
        }
      }
    }
    self.object = nil;
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(id))map {
  id list = self.object;
  id block = ^Underscore *(id iterator) {
    if(list && iterator) {
      NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:[list count]];
      if([list isKindOfClass:[NSArray class]]) {
        NSUInteger index = 0;
        for(id element in list) {
          [resultArray addObject:((id_id_NSUInteger_NSArray)iterator)(element, index, list)];
          index ++;
        }
      } else if([list isKindOfClass:[NSSet class]]) {
        for(id element in list) {
          [resultArray addObject:((id_id_NSSet)iterator)(element, list)];
        }
      } else if([list isKindOfClass:[NSDictionary class]]) {
        for(id key in list) {
          [resultArray addObject:((id_id_id_NSDictionary)iterator)([list objectForKey:key], key, list)];
        }
      }
      self.object = resultArray;
    }
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(id, id))reduce {
  id list = self.object;
  id block = ^Underscore *(id iterator, id memo) {
    if([list isKindOfClass:[NSArray class]] || [list isKindOfClass:[NSSet class]]) {
      for(id obj in list) {
        memo = ((id_id_id)iterator)(memo, obj);
      }
      self.object = memo;
    } else if([list isKindOfClass:[NSDictionary class]]) {
      for(id key in list) {
        memo = ((id_id_id)iterator)(memo, [list objectForKey:key]);
      }
      self.object = memo;
    } else {
      self.object = nil;
    }
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(void))size {
  id list = self.object;
  id block = ^Underscore * {
    if([list isKindOfClass:[NSArray class]] || [list isKindOfClass:[NSSet class]] || [list isKindOfClass:[NSDictionary class]]) {
      self.object = [NSNumber numberWithUnsignedInteger:[list count]];
    } else {
      self.object = nil;
    }
    return self;
  };
  return [[block copy] autorelease];
}

#pragma mark - Arrays

- (Underscore *(^)(void))first {
  id block = ^Underscore * {
    if([self.object isKindOfClass:[NSArray class]] && [self.object count] > 0) {
      self.object = [self.object objectAtIndex:0];
    } else {
      self.object = nil;
    }
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(void))last {
  id block = ^Underscore * {
    if([self.object isKindOfClass:[NSArray class]] && [self.object count] > 0) {
      self.object = [self.object lastObject];
    } else {
      self.object = nil;
    }
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(void))initial {
  id block = ^Underscore * {
    if([self.object isKindOfClass:[NSArray class]]) {
      NSUInteger size = [self.object count];
      if(size > 1) {
        self.object = [self.object subarrayWithRange:NSMakeRange(0, size - 1)];
        return self;
      }
    }
    self.object = [NSArray array];
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(void))rest {
  id block = ^Underscore * {
    if([self.object isKindOfClass:[NSArray class]]) {
      NSUInteger size = [self.object count];
      if(size > 1) {
        self.object = [self.object subarrayWithRange:NSMakeRange(1, size - 1)];
        return self;
      }
    }
    self.object = [NSArray array];
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(NSUInteger))initialN {
  id block = ^Underscore *(NSUInteger n) {
    if([self.object isKindOfClass:[NSArray class]]) {
      NSUInteger size = [self.object count];
      if(size > n) {
        self.object = [self.object subarrayWithRange:NSMakeRange(0, size - n)];
        return self;
      }
    }
    self.object = [NSArray array];
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(NSUInteger))restN {
  id block = ^Underscore *(NSUInteger n) {
    if([self.object isKindOfClass:[NSArray class]]) {
      NSUInteger size = [self.object count];
      if(size > n) {
        self.object = [self.object subarrayWithRange:NSMakeRange(n, size - n)];
        return self;
      }
    }
    self.object = [NSArray array];
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(NSUInteger))firstN {
  id block = ^Underscore *(NSUInteger n) {
    if([self.object isKindOfClass:[NSArray class]]) {
      NSUInteger size = [self.object count];
      if(size > 0) {
        self.object = [self.object subarrayWithRange:NSMakeRange(0, MIN(n, size))];
        return self;
      }
    }
    self.object = [NSArray array];
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(NSUInteger))lastN {
  id block = ^Underscore *(NSUInteger n) {
    if([self.object isKindOfClass:[NSArray class]]) {
      NSUInteger size = [self.object count];
      if(size > 0) {
        NSUInteger startIndex = MAX((NSInteger)[self.object count] - (NSInteger)n, 0);
        NSUInteger length = MIN(n, size - startIndex);
        self.object = [self.object subarrayWithRange:NSMakeRange(startIndex, length)];
        return self;
      }
    }
    self.object = [NSArray array];
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(void))compact {
  id block = ^Underscore * {
    if([self.object isKindOfClass:[NSArray class]]) {
      NSMutableArray *resultArray = [NSMutableArray array];
      for(id obj in self.object) {
        if(obj != [NSNull null]) {
          [resultArray addObject:obj];
        }
      }
      self.object = resultArray;
      return self;
    }
    self.object = [NSArray array];
    return self;
  };
  return [[block copy] autorelease];
}

#pragma mark - Utility

- (Underscore *(^)(id))times {
  id block = ^Underscore *(id iterator) {
    if([self.object isKindOfClass:[NSNumber class]]) {
      NSUInteger n = [(NSNumber *)self.object unsignedIntegerValue];
      for(NSUInteger i = 0; i < n; i ++) {
        ((void_NSUInteger)iterator)(i);
      }
    }
    self.object = nil;
    return self;
  };
  return [[block copy] autorelease];
}

#pragma mark - Chaining

- (Underscore *(^)(void))chain {
  id block = ^id {
    return self;
  };
  return [[block copy] autorelease];
}

- (id(^)(void))value {
  id block = ^id {
    return self.object;
  };
  return [[block copy] autorelease];
}

- (BOOL(^)(void))boolValue {
  id block = ^BOOL {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object boolValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (char(^)(void))charValue {
  id block = ^char {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object charValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (double(^)(void))doubleValue {
  id block = ^double {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object doubleValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (float(^)(void))floatValue {
  id block = ^float {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object floatValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (int(^)(void))intValue {
  id block = ^int {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object intValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (NSInteger(^)(void))integerValue {
  id block = ^NSInteger {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object integerValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (long long(^)(void))longlongValue {
  id block = ^long long {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object longLongValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (long long(^)(void))longLongValue {
  return [self longlongValue];
}

- (long(^)(void))longValue {
  id block = ^long {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object longValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (short(^)(void))shortValue {
  id block = ^short {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object shortValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (unsigned char(^)(void))ucharValue {
  id block = ^unsigned char {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object unsignedCharValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (unsigned char(^)(void))unsignedCharValue {
  return [self ucharValue];
}

- (NSUInteger(^)(void))uintegerValue {
  id block = ^NSUInteger {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object unsignedIntegerValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (NSUInteger(^)(void))unsignedIntegerValue {
  return [self uintegerValue];
}

- (unsigned int(^)(void))uintValue {
  id block = ^unsigned int {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object unsignedIntValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (unsigned int(^)(void))unsignedIntValue {
  return [self uintValue];
}

- (unsigned long long(^)(void))ulonglongValue {
  id block = ^unsigned long long {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object unsignedLongLongValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (unsigned long long(^)(void))unsignedLongLongValue {
  return [self ulonglongValue];
}

- (unsigned long(^)(void))ulongValue {
  id block = ^unsigned long {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object unsignedLongValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (unsigned long(^)(void))unsignedLongValue {
  return [self ulongValue];
}

- (unsigned short(^)(void))ushortValue {
  id block = ^unsigned short {
    if([self.object isKindOfClass:[NSNumber class]]) {
      return [(NSNumber *)self.object unsignedShortValue];
    }
    return NO;
  };
  return [[block copy] autorelease];
}

- (unsigned short(^)(void))unsignedShortValue {
  return [self ushortValue];
}

#pragma mark -

@end
