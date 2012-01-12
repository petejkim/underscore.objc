#import "Underscore.h"

typedef void (^void_id_NSUInteger_NSArray)(id, NSUInteger, NSArray *);
typedef void (^void_id_NSSet)(id, NSSet *);
typedef void (^void_id_id_NSDictionary)(id, id, NSDictionary *);

Underscore *_;

static BOOL isBlock(id obj) {
  return [NSStringFromClass([obj class]) rangeOfString:@"Block"].location != NSNotFound;
}

@implementation Underscore

@synthesize
  object=_object
;

@dynamic
  each
;

+ (void)initialize {
  if(self == [Underscore class]) {
    _ = [[self alloc] initWithObject:nil];
  }
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

- (void(^)(id, ...))each {
  __block id list = self.object;
  id block = ^(id arg1, ...) {
    id iterator;
    if([arg1 isKindOfClass:[NSArray class]] || [arg1 isKindOfClass:[NSDictionary class]] || [arg1 isKindOfClass:[NSSet class]]) {
      list = arg1;
      va_list args;
      va_start(args, arg1);
      iterator = va_arg(args, id);
      va_end(args);
      NSAssert(isBlock(iterator), @"iterator expected as the second argument.");
    } else if(list) {
      NSAssert(isBlock(arg1), @"iterator expected as the first argument.");
      iterator = arg1;
    } else {
      NSAssert(NO, @"invalid arguments.");
    }
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
  };
  return [[block copy] autorelease];
}

@end
