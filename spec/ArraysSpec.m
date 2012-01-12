#import "SpecHelper.h"

SpecBegin(Underscore_Arrays)

__block NSArray *arr;

before(^{
  arr = _a(@"foo", @"bar", @"baz", @"qux");
});

describe(@"first", ^{
  specify(@"functional style", ^{
    expect(_.first(arr)).toEqual(@"foo");
  });

  specify(@"object-oriented", ^{
    Underscore *u = _(arr).first();
    expect(u).toBeKindOf([Underscore class]);
    expect(u.value()).toEqual(@"foo");
  });
});

describe(@"firstN", ^{
  specify(@"functional style", ^{
    expect(_.firstN(arr, 2)).toEqual(_a(@"foo", @"bar"));
  });

  specify(@"object-oriented", ^{
    Underscore *u = _(arr).firstN(2);
    expect(u).toBeKindOf([Underscore class]);
    expect(u.value()).toEqual(_a(@"foo", @"bar"));
  });
});

SpecEnd
