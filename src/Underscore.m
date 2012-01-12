#import "Underscore.h"

typedef void (^void_id_NSUInteger_NSArray)(id, NSUInteger, NSArray *);
typedef void (^void_id_NSSet)(id, NSSet *);
typedef void (^void_id_id_NSDictionary)(id, id, NSDictionary *);
typedef id (^id_id_NSUInteger_NSArray)(id, NSUInteger, NSArray *);
typedef id (^id_id_NSSet)(id, NSSet *);
typedef id (^id_id_id_NSDictionary)(id, id, NSDictionary *);

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
  __block id list = self.object;
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
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(id))map {
  __block id list = self.object;
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

#pragma mark - Arrays

- (Underscore *(^)(void))first {
  id block = ^Underscore *{
    if([self.object isKindOfClass:[NSArray class]]) {
      self.object = [self.object objectAtIndex:0];
    } else {
      self.object = nil;
    }
    return self;
  };
  return [[block copy] autorelease];
}

- (Underscore *(^)(NSUInteger))firstN {
  id block = ^Underscore *(NSUInteger n) {
    if([self.object isKindOfClass:[NSArray class]]) {
      self.object = [self.object subarrayWithRange:NSMakeRange(0, n)];
    } else {
      self.object = [NSArray array];
    }
    return self;
  };
  return [[block copy] autorelease];
}

#pragma mark - Chaining

- (id(^)(void))value {
  __block id object = self.object;
  id block = ^id {
    return object;
  };
  return [[block copy] autorelease];
}

#pragma mark -

@end
