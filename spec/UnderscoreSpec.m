#import "SpecHelper.h"
#import "Underscore.h"

SpecBegin(Underscore)

describe(@"_", ^{
  it(@"is a global instance of Underscore class", ^{
    expect(_).toBeKindOf([Underscore class]);
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
