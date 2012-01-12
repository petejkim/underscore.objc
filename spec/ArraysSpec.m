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

  specify(@"object-oriented style", ^{
    expect(_(arr).first()).toEqual(@"foo");
  });

  specify(@"chained", ^{
    expect(_(arr).chain().first().value()).toEqual(@"foo");
  });
});

describe(@"firstN", ^{
  specify(@"functional style", ^{
    expect(_.firstN(arr, 2)).toEqual(_a(@"foo", @"bar"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).firstN(2)).toEqual(_a(@"foo", @"bar"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().firstN(2).value()).toEqual(_a(@"foo", @"bar"));
  });
});

SpecEnd
