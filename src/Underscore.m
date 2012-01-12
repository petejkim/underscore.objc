#import "Underscore.h"

Underscore *_;

@implementation Underscore

@synthesize
  object=_object
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

+ (id)underscoreWithObject:(id)object {
  return [[[self alloc] initWithObject:object] autorelease];
}

@end
