#import "SpecHelper.h"
#import "Underscore.h"

SpecBegin(Underscore_Collections)

describe(@"each", ^{
  context(@"Array", ^{
    __block NSArray *arr;
    __block NSMutableArray *arr2;

    before(^{
      arr = _a(@"foo", @"bar");
      arr2 = _ma(nil);
    });

    specify(@"functional style", ^{
      _.each(arr, ^(id element, NSUInteger index, NSArray *list) {
        expect([list objectAtIndex:index]).toEqual(element);
        [arr2 addObject:element];
      });
      expect(arr).toEqual(arr2);
    });

    specify(@"object-oriented style", ^{
      _(arr).each(^(id element, NSUInteger index, NSArray *list) {
        expect([list objectAtIndex:index]).toEqual(element);
        [arr2 addObject:element];
      });
      expect(arr).toEqual(arr2);
    });
  });

  context(@"Set", ^{
    __block NSSet *set;
    __block NSMutableSet *set2;

    before(^{
      set = _s(@"foo", @"bar");
      set2 = _ms(nil);
    });

    specify(@"functional style", ^{
      _.each(set, ^(id element, NSUInteger index, NSSet *list) {
        expect([list containsObject:element]).toEqual(YES);
        [set2 addObject:element];
      });
      expect(set).toEqual(set2);
    });

    specify(@"object-oriented style", ^{
      _(set).each(^(id element, NSSet *list) {
        expect([list containsObject:element]).toEqual(YES);
        [set2 addObject:element];
      });
      expect(set).toEqual(set2);
    });
  });

  context(@"Dictionary", ^{
    __block NSDictionary *dic;
    __block NSMutableDictionary *dic2;

    before(^{
      dic = _d(_kv(@"foo", @"bar"), _kv(@"baz", @"qux"));
      dic2 = _md(nil);
    });

    specify(@"functional style", ^{
      _.each(dic, ^(id value, id key, NSDictionary *list) {
        expect([list objectForKey:key]).toEqual(value);
        [dic2 setObject:value forKey:key];
      });
      expect(dic).toEqual(dic2);
    });

    specify(@"object-oriented style", ^{
      _(dic).each(^(id value, id key, NSDictionary *list) {
        expect([list objectForKey:key]).toEqual(value);
        [dic2 setObject:value forKey:key];
      });
      expect(dic).toEqual(dic2);
    });
  });
});

SpecEnd
