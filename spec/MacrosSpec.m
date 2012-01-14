#import "SpecHelper.h"

SpecBegin(Underscore_Macros)

describe(@"_a", ^{
  it(@"creates an array with the objects in the arguments", ^{
    id arr = _a(@"foo", @"bar", @"baz");
    expect(arr).toBeKindOf([NSArray class]);
    expect(arr).toEqual(([NSArray arrayWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"_ma", ^{
  it(@"creates a mutable array with the objects in the arguments", ^{
    id arr = _ma(@"foo", @"bar", @"baz");
    expect(arr).toBeKindOf([NSMutableArray class]);
    expect(arr).toEqual(([NSMutableArray arrayWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"_s", ^{
  it(@"creates a set with the objects in the arguments", ^{
    id set = _s(@"foo", @"bar", @"baz");
    expect(set).toBeKindOf([NSSet class]);
    expect(set).toEqual(([NSSet setWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"_ms", ^{
  it(@"creates a mutable set with the objects in the arguments", ^{
    id set = _ms(@"foo", @"bar", @"baz");
    expect(set).toBeKindOf([NSMutableSet class]);
    expect(set).toEqual(([NSMutableSet setWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"_d", ^{
  it(@"creates a dictionary with the objects in the arguments", ^{
    id dic = _d(@"val1", @"key1", @"val2", @"key2");
    expect(dic).toBeKindOf([NSDictionary class]);
    expect(dic).toEqual(([NSDictionary dictionaryWithObjectsAndKeys:@"val1", @"key1", @"val2", @"key2", nil]));
  });
});

describe(@"_md", ^{
  it(@"creates a mutable dictionary with the objects in the arguments", ^{
    id dic = _md(@"val1", @"key1", @"val2", @"key2");
    expect(dic).toBeKindOf([NSMutableDictionary class]);
    expect(dic).toEqual(([NSMutableDictionary dictionaryWithObjectsAndKeys:@"val1", @"key1", @"val2", @"key2", nil]));
  });
});

describe(@"_kv", ^{
  it(@"swaps the order of two arguments", ^{
    id dic = _d(_kv(@"key1", @"val1"), _kv(@"key2", @"val2"));
    expect(dic).toBeKindOf([NSDictionary class]);
    expect(dic).toEqual(([NSDictionary dictionaryWithObjectsAndKeys:@"val1", @"key1", @"val2", @"key2", nil]));
  });
});

describe(@"_$", ^{
  it(@"creates a formatted string", ^{
    id str = _$(@"<%@>", @"foo");
    expect(str).toBeKindOf([NSString class]);
    expect(str).toEqual(@"<foo>");
  });
});

describe(@"_m$", ^{
  it(@"creates a formatted mutable string", ^{
    id str = _m$(@"<%@>", @"foo");
    expect(str).toBeKindOf([NSMutableString class]);
    expect(str).toEqual(@"<foo>");
  });
});

describe(@"_arr", ^{
  it(@"is an alias for _a", ^{
    id arr = _arr(@"foo", @"bar");
    expect(arr).toBeKindOf([NSArray class]);
    expect(arr).toEqual(_a(@"foo", @"bar"));
  });
});

describe(@"_marr", ^{
  it(@"is an alias for _ma", ^{
    id arr = _marr(@"foo", @"bar");
    expect(arr).toBeKindOf([NSMutableArray class]);
    expect(arr).toEqual(_ma(@"foo", @"bar"));
  });
});

describe(@"_set", ^{
  it(@"is an alias for _s", ^{
    id set = _set(@"foo", @"bar");
    expect(set).toBeKindOf([NSSet class]);
    expect(set).toEqual(_s(@"foo", @"bar"));
  });
});

describe(@"_mset", ^{
  it(@"is an alias for _ms", ^{
    id set = _mset(@"foo", @"bar");
    expect(set).toBeKindOf([NSMutableSet class]);
    expect(set).toEqual(_ms(@"foo", @"bar"));
  });
});

describe(@"_dict", ^{
  it(@"is an alias for _d", ^{
    id dic = _dict(@"val1", @"key1", @"val2", @"key2");
    expect(dic).toBeKindOf([NSDictionary class]);
    expect(dic).toEqual(_d(@"val1", @"key1", @"val2", @"key2"));
  });
});

describe(@"_mdict", ^{
  it(@"is an alias for _md", ^{
    id dic = _mdict(@"val1", @"key1", @"val2", @"key2");
    expect(dic).toBeKindOf([NSMutableDictionary class]);
    expect(dic).toEqual(_md(@"val1", @"key1", @"val2", @"key2"));
  });
});

describe(@"_str", ^{
  it(@"is an alias for _$", ^{
    id str = _str(@"<%@>", @"foo");
    expect(str).toBeKindOf([NSString class]);
    expect(str).toEqual(_$(@"<%@>", @"foo"));
  });
});

describe(@"_mstr", ^{
  it(@"is an alias for _m$", ^{
    id str = _mstr(@"<%@>", @"foo");
    expect(str).toBeKindOf([NSMutableString class]);
    expect(str).toEqual(_m$(@"<%@>", @"foo"));
  });
});

SpecEnd
