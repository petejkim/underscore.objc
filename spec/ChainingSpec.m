#import "SpecHelper.h"

SpecBegin(Underscore_Chaining)

__block NSArray *arr;
__block NSMutableArray *arr2;

before(^{
  arr = _a(@"foo", @"bar", @"baz", @"qux");
  arr2 = _ma(nil);
});

describe(@"chain & value", ^{
  specify(@"functional style", ^{
    arr = _.chain(arr).map(^(id element, NSUInteger index, NSArray *list) {
      return [element stringByAppendingString:@"."];
    }).each(^(id element, NSUInteger index, NSArray *list) {
      [arr2 addObject:element];
    }).value();
    expect(arr).toEqual(_a(@"foo.", @"bar.", @"baz.", @"qux."));
    expect(arr2).toEqual(_a(@"foo.", @"bar.", @"baz.", @"qux."));
  });

  specify(@"object-oriented style", ^{
    arr = _(arr).chain().map(^(id element, NSUInteger index, NSArray *list) {
      return [element stringByAppendingString:@"."];
    }).each(^(id element, NSUInteger index, NSArray *list) {
      [arr2 addObject:element];
    }).value();
    expect(arr).toEqual(_a(@"foo.", @"bar.", @"baz.", @"qux."));
    expect(arr2).toEqual(_a(@"foo.", @"bar.", @"baz.", @"qux."));
  });
});

SpecEnd
