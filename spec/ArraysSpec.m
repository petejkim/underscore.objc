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

  it(@"can handle exceptional cases", ^{
    expect(_.first(_a(nil))).toBeNil();
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

  it(@"can handle exceptional cases", ^{
    expect(_.firstN(arr, 5)).toEqual(arr);
    expect(_.firstN(_a(nil), 2)).toEqual(_a(nil));
  });
});

describe(@"initial", ^{
  specify(@"functional style", ^{
    expect(_.initial(arr)).toEqual(_a(@"foo", @"bar", @"baz"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).initial()).toEqual(_a(@"foo", @"bar", @"baz"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().initial().value()).toEqual(_a(@"foo", @"bar", @"baz"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.initial(_a(@"foo"))).toEqual(_a(nil));
    expect(_.initial(_a(nil))).toEqual(_a(nil));
  });
});

describe(@"initialN", ^{
  before(^{
    arr = _a(@"foo", @"bar", @"baz", @"qux", @"wiz");
  });

  specify(@"functional style", ^{
    expect(_.initialN(arr, 2)).toEqual(_a(@"foo", @"bar", @"baz"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).initialN(2)).toEqual(_a(@"foo", @"bar", @"baz"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().initialN(2).value()).toEqual(_a(@"foo", @"bar", @"baz"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.initialN(_a(@"foo"), 2)).toEqual(_a(nil));
    expect(_.initialN(_a(nil), 2)).toEqual(_a(nil));
  });
});

describe(@"last", ^{
  specify(@"functional style", ^{
    expect(_.last(arr)).toEqual(@"qux");
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).last()).toEqual(@"qux");
  });

  specify(@"chained", ^{
    expect(_(arr).chain().last().value()).toEqual(@"qux");
  });

  it(@"can handle exceptional cases", ^{
    expect(_.last(_a(nil))).toBeNil();
  });
});

describe(@"lastN", ^{
  specify(@"functional style", ^{
    expect(_.lastN(arr, 2)).toEqual(_a(@"baz", @"qux"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).lastN(2)).toEqual(_a(@"baz", @"qux"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().lastN(2).value()).toEqual(_a(@"baz", @"qux"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.lastN(arr, 5)).toEqual(arr);
    expect(_.lastN(_a(nil), 2)).toEqual(_a(nil));
  });
});

describe(@"rest", ^{
  specify(@"functional style", ^{
    expect(_.rest(arr)).toEqual(_a(@"bar", @"baz", @"qux"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).rest()).toEqual(_a(@"bar", @"baz", @"qux"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().rest().value()).toEqual(_a(@"bar", @"baz", @"qux"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.rest(_a(@"foo"))).toEqual(_a(nil));
    expect(_.rest(_a(nil))).toEqual(_a(nil));
  });
});

describe(@"restN", ^{
  before(^{
    arr = _a(@"foo", @"bar", @"baz", @"qux", @"wiz");
  });

  specify(@"functional style", ^{
    expect(_.restN(arr, 2)).toEqual(_a(@"baz", @"qux", @"wiz"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).restN(2)).toEqual(_a(@"baz", @"qux", @"wiz"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().restN(2).value()).toEqual(_a(@"baz", @"qux", @"wiz"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.restN(_a(@"foo", @"bar"), 2)).toEqual(_a(nil));
    expect(_.restN(_a(nil), 2)).toEqual(_a(nil));
  });
});

// Returns a copy of the array with all [NSNull null] objects removed. Note: The JS counterpart removes all falsy values, not just nulls.
describe(@"compact", ^{
  before(^{
    arr = _a(@"foo", @"bar", [NSNull null], @"baz", [NSNull null], @"qux");
  });

  specify(@"functional style", ^{
    expect(_.compact(arr)).toEqual(_a(@"foo", @"bar", @"baz", @"qux"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).compact()).toEqual(_a(@"foo", @"bar", @"baz", @"qux"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().compact().value()).toEqual(_a(@"foo", @"bar", @"baz", @"qux"));
  });
});

SpecEnd
