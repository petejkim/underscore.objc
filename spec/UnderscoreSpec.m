#import "SpecHelper.h"

SpecBegin(Underscore)

describe(@"_", ^{
  it(@"is a global instance of UnderscoreFunctional class", ^{
    expect(_).toBeKindOf([UnderscoreFunctional class]);
  });
});

describe(@"_(obj)", ^{
  it(@"returns a new instance of Underscore class", ^{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
    Underscore * u = _(array);
    expect(u).toBeKindOf([Underscore class]);
    expect(u.object).toEqual(array);
  });
});

SpecEnd
