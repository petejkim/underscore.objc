#import "SpecHelper.h"

SpecBegin(Underscore)

describe(@"_", ^{
  it(@"is a global instance of UnderscoreFunctional class", ^{
    expect(_).toBeKindOf([UnderscoreFunctional class]);
  });
});

describe(@"_(obj)", ^{
  it(@"returns a new instance of UnderscoreUnchained class", ^{
    NSArray *array = [NSArray arrayWithObjects:@"foo", @"bar", nil];
    id u = _(array);
    expect(u).toBeKindOf([UnderscoreUnchained class]);
    expect(((UnderscoreUnchained *)u).object).toEqual(array);
  });
});

SpecEnd
