#import "SpecHelper.h"

SpecBegin(Underscore_Arrays)

__block NSArray *arr;

before(^{
  arr = a_(@"foo", @"bar", @"baz", @"qux");
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
    expect(_.first(a_(nil))).toBeNil();
  });
});

describe(@"firstN", ^{
  specify(@"functional style", ^{
    expect(_.firstN(arr, 2)).toEqual(a_(@"foo", @"bar"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).firstN(2)).toEqual(a_(@"foo", @"bar"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().firstN(2).value()).toEqual(a_(@"foo", @"bar"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.firstN(arr, 5)).toEqual(arr);
    expect(_.firstN(a_(nil), 2)).toEqual(a_(nil));
  });
});

describe(@"initial", ^{
  specify(@"functional style", ^{
    expect(_.initial(arr)).toEqual(a_(@"foo", @"bar", @"baz"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).initial()).toEqual(a_(@"foo", @"bar", @"baz"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().initial().value()).toEqual(a_(@"foo", @"bar", @"baz"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.initial(a_(@"foo"))).toEqual(a_(nil));
    expect(_.initial(a_(nil))).toEqual(a_(nil));
  });
});

describe(@"initialN", ^{
  before(^{
    arr = a_(@"foo", @"bar", @"baz", @"qux", @"wiz");
  });

  specify(@"functional style", ^{
    expect(_.initialN(arr, 2)).toEqual(a_(@"foo", @"bar", @"baz"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).initialN(2)).toEqual(a_(@"foo", @"bar", @"baz"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().initialN(2).value()).toEqual(a_(@"foo", @"bar", @"baz"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.initialN(a_(@"foo"), 2)).toEqual(a_(nil));
    expect(_.initialN(a_(nil), 2)).toEqual(a_(nil));
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
    expect(_.last(a_(nil))).toBeNil();
  });
});

describe(@"lastN", ^{
  specify(@"functional style", ^{
    expect(_.lastN(arr, 2)).toEqual(a_(@"baz", @"qux"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).lastN(2)).toEqual(a_(@"baz", @"qux"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().lastN(2).value()).toEqual(a_(@"baz", @"qux"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.lastN(arr, 5)).toEqual(arr);
    expect(_.lastN(a_(nil), 2)).toEqual(a_(nil));
  });
});

describe(@"rest", ^{
  specify(@"functional style", ^{
    expect(_.rest(arr)).toEqual(a_(@"bar", @"baz", @"qux"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).rest()).toEqual(a_(@"bar", @"baz", @"qux"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().rest().value()).toEqual(a_(@"bar", @"baz", @"qux"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.rest(a_(@"foo"))).toEqual(a_(nil));
    expect(_.rest(a_(nil))).toEqual(a_(nil));
  });
});

describe(@"restN", ^{
  before(^{
    arr = a_(@"foo", @"bar", @"baz", @"qux", @"wiz");
  });

  specify(@"functional style", ^{
    expect(_.restN(arr, 2)).toEqual(a_(@"baz", @"qux", @"wiz"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).restN(2)).toEqual(a_(@"baz", @"qux", @"wiz"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().restN(2).value()).toEqual(a_(@"baz", @"qux", @"wiz"));
  });

  it(@"can handle exceptional cases", ^{
    expect(_.restN(a_(@"foo", @"bar"), 2)).toEqual(a_(nil));
    expect(_.restN(a_(nil), 2)).toEqual(a_(nil));
  });
});

// Returns a copy of the array with all [NSNull null] objects removed. Note: The JS counterpart removes all falsy values, not just nulls.
describe(@"compact", ^{
  before(^{
    arr = a_(@"foo", @"bar", [NSNull null], @"baz", [NSNull null], @"qux");
  });

  specify(@"functional style", ^{
    expect(_.compact(arr)).toEqual(a_(@"foo", @"bar", @"baz", @"qux"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).compact()).toEqual(a_(@"foo", @"bar", @"baz", @"qux"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().compact().value()).toEqual(a_(@"foo", @"bar", @"baz", @"qux"));
  });
});

describe(@"flatten", ^{
  before(^{
    arr = a_(@"1", a_(@"2"), a_(@"3", a_(a_(@"4"))));
  });

  specify(@"functional style", ^{
    expect(_.flatten(arr)).toEqual(a_(@"1", @"2", @"3", @"4"));
  });

  specify(@"object-oriented style", ^{
    expect(_(arr).flatten()).toEqual(a_(@"1", @"2", @"3", @"4"));
  });

  specify(@"chained", ^{
    expect(_(arr).chain().flatten().value()).toEqual(a_(@"1", @"2", @"3", @"4"));
  });
});

SpecEnd