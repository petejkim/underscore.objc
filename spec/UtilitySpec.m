#import "SpecHelper.h"

SpecBegin(Underscore_Utility)

describe(@"times", ^{
  __block NSMutableArray *arr;
  __block id val;

  before(^{
    arr = _ma(nil);
  });

  specify(@"functional style", ^{
    _.times(3, ^(NSUInteger i) {
      [arr addObject:[NSString stringWithFormat:@"%d", (unsigned int)i]];
    });
    expect(arr).toEqual(_a(@"0",@"1",@"2"));
  });

  specify(@"object oriented style", ^{
    _(3).times(^(NSUInteger i) {
      [arr addObject:[NSString stringWithFormat:@"%d", (unsigned int)i]];
    });
    expect(arr).toEqual(_a(@"0",@"1",@"2"));
  });

  specify(@"chained", ^{
    val = _(3).chain().times(^(NSUInteger i) {
      [arr addObject:[NSString stringWithFormat:@"%d", (unsigned int)i]];
    }).value();
    expect(val).toBeNil();
    expect(arr).toEqual(_a(@"0",@"1",@"2"));
  });
});

SpecEnd
