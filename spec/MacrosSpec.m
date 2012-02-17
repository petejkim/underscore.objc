#import "SpecHelper.h"

SpecBegin(Underscore_Macros)

describe(@"a_", ^{
  it(@"creates an array with the objects in the arguments", ^{
    id arr = a_(@"foo", @"bar", @"baz");
    expect(arr).toBeKindOf([NSArray class]);
    expect(arr).toEqual(([NSArray arrayWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"ma_", ^{
  it(@"creates a mutable array with the objects in the arguments", ^{
    id arr = ma_(@"foo", @"bar", @"baz");
    expect(arr).toBeKindOf([NSMutableArray class]);
    expect(arr).toEqual(([NSMutableArray arrayWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"s_", ^{
  it(@"creates a set with the objects in the arguments", ^{
    id set = s_(@"foo", @"bar", @"baz");
    expect(set).toBeKindOf([NSSet class]);
    expect(set).toEqual(([NSSet setWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"ms_", ^{
  it(@"creates a mutable set with the objects in the arguments", ^{
    id set = ms_(@"foo", @"bar", @"baz");
    expect(set).toBeKindOf([NSMutableSet class]);
    expect(set).toEqual(([NSMutableSet setWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"d_", ^{
  it(@"creates a dictionary with the objects in the arguments", ^{
    id dic = d_(@"val1", @"key1", @"val2", @"key2");
    expect(dic).toBeKindOf([NSDictionary class]);
    expect(dic).toEqual(([NSDictionary dictionaryWithObjectsAndKeys:@"val1", @"key1", @"val2", @"key2", nil]));
  });
});

describe(@"md_", ^{
  it(@"creates a mutable dictionary with the objects in the arguments", ^{
    id dic = md_(@"val1", @"key1", @"val2", @"key2");
    expect(dic).toBeKindOf([NSMutableDictionary class]);
    expect(dic).toEqual(([NSMutableDictionary dictionaryWithObjectsAndKeys:@"val1", @"key1", @"val2", @"key2", nil]));
  });
});

describe(@"kv_", ^{
  it(@"swaps the order of two arguments", ^{
    id dic = d_(kv_(@"key1", @"val1"), kv_(@"key2", @"val2"));
    expect(dic).toBeKindOf([NSDictionary class]);
    expect(dic).toEqual(([NSDictionary dictionaryWithObjectsAndKeys:@"val1", @"key1", @"val2", @"key2", nil]));
  });
});

describe(@"$_", ^{
  it(@"creates a formatted string", ^{
    id str = $_(@"<%@>", @"foo");
    expect(str).toBeKindOf([NSString class]);
    expect(str).toEqual(@"<foo>");
  });
});

describe(@"m$_", ^{
  it(@"creates a formatted mutable string", ^{
    id str = m$_(@"<%@>", @"foo");
    expect(str).toBeKindOf([NSMutableString class]);
    expect(str).toEqual(@"<foo>");
  });
});

describe(@"arr_", ^{
  it(@"is an alias for _a", ^{
    id arr = arr_(@"foo", @"bar");
    expect(arr).toBeKindOf([NSArray class]);
    expect(arr).toEqual(a_(@"foo", @"bar"));
  });
});

describe(@"marr_", ^{
  it(@"is an alias for _ma", ^{
    id arr = marr_(@"foo", @"bar");
    expect(arr).toBeKindOf([NSMutableArray class]);
    expect(arr).toEqual(ma_(@"foo", @"bar"));
  });
});

describe(@"set_", ^{
  it(@"is an alias for _s", ^{
    id set = set_(@"foo", @"bar");
    expect(set).toBeKindOf([NSSet class]);
    expect(set).toEqual(s_(@"foo", @"bar"));
  });
});

describe(@"mset_", ^{
  it(@"is an alias for _ms", ^{
    id set = mset_(@"foo", @"bar");
    expect(set).toBeKindOf([NSMutableSet class]);
    expect(set).toEqual(ms_(@"foo", @"bar"));
  });
});

describe(@"dict_", ^{
  it(@"is an alias for _d", ^{
    id dic = dict_(@"val1", @"key1", @"val2", @"key2");
    expect(dic).toBeKindOf([NSDictionary class]);
    expect(dic).toEqual(d_(@"val1", @"key1", @"val2", @"key2"));
  });
});

describe(@"mdict_", ^{
  it(@"is an alias for _md", ^{
    id dic = mdict_(@"val1", @"key1", @"val2", @"key2");
    expect(dic).toBeKindOf([NSMutableDictionary class]);
    expect(dic).toEqual(md_(@"val1", @"key1", @"val2", @"key2"));
  });
});

describe(@"str_", ^{
  it(@"is an alias for _$", ^{
    id str = str_(@"<%@>", @"foo");
    expect(str).toBeKindOf([NSString class]);
    expect(str).toEqual($_(@"<%@>", @"foo"));
  });
});

describe(@"mstr_", ^{
  it(@"is an alias for _m$", ^{
    id str = mstr_(@"<%@>", @"foo");
    expect(str).toBeKindOf([NSMutableString class]);
    expect(str).toEqual(m$_(@"<%@>", @"foo"));
  });
});

SpecEnd