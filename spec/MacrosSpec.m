#import "SpecHelper.h"
#import "Underscore.h"

SpecBegin(Underscore_Macros)

describe(@"_a(...)", ^{
  it(@"creates an array with the objects in the arguments", ^{
    id arr = _a(@"foo", @"bar", @"baz");
    expect(arr).toBeKindOf([NSArray class]);
    expect(arr).toEqual(([NSArray arrayWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"_ma(...)", ^{
  it(@"creates a mutable array with the objects in the arguments", ^{
    id arr = _ma(@"foo", @"bar", @"baz");
    expect(arr).toBeKindOf([NSMutableArray class]);
    expect(arr).toEqual(([NSMutableArray arrayWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"_s(...)", ^{
  it(@"creates a set with the objects in the arguments", ^{
    id set = _s(@"foo", @"bar", @"baz");
    expect(set).toBeKindOf([NSSet class]);
    expect(set).toEqual(([NSSet setWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"_ms(...)", ^{
  it(@"creates a mutable set with the objects in the arguments", ^{
    id set = _ms(@"foo", @"bar", @"baz");
    expect(set).toBeKindOf([NSMutableSet class]);
    expect(set).toEqual(([NSMutableSet setWithObjects:@"foo", @"bar", @"baz", nil]));
  });
});

describe(@"_d(...)", ^{
  it(@"creates a dictionary with the objects in the arguments", ^{
    id dic = _d(@"val1", @"key1", @"val2", @"key2");
    expect(dic).toBeKindOf([NSDictionary class]);
    expect(dic).toEqual(([NSDictionary dictionaryWithObjectsAndKeys:@"val1", @"key1", @"val2", @"key2", nil]));
  });
});

describe(@"_md(...)", ^{
  it(@"creates a mutable dictionary with the objects in the arguments", ^{
    id dic = _md(@"val1", @"key1", @"val2", @"key2");
    expect(dic).toBeKindOf([NSMutableDictionary class]);
    expect(dic).toEqual(([NSMutableDictionary dictionaryWithObjectsAndKeys:@"val1", @"key1", @"val2", @"key2", nil]));
  });
});

describe(@"_kv(key, val)", ^{
  it(@"swaps the order of two arguments", ^{
    id dic = _d(_kv(@"key1", @"val1"), _kv(@"key2", @"val2"));
    expect(dic).toBeKindOf([NSDictionary class]);
    expect(dic).toEqual(([NSDictionary dictionaryWithObjectsAndKeys:@"val1", @"key1", @"val2", @"key2", nil]));
  });
});

SpecEnd
