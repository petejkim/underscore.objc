#import "SpecHelper.h"

SpecBegin(Underscore_Collections)

__block NSArray *arr;
__block NSMutableArray *arr2;
__block NSSet *set;
__block NSMutableSet *set2;
__block NSDictionary *dic;
__block NSMutableDictionary *dic2;

before(^{
  arr = _a(@"foo", @"bar");
  arr2 = _ma(nil);
  set = _s(@"foo", @"bar");
  set2 = _ms(nil);
  dic = _d(_kv(@"foo", @"bar"), _kv(@"baz", @"qux"));
  dic2 = _md(nil);
});

describe(@"each", ^{
  context(@"Array", ^{
    specify(@"functional", ^{
      _.each(arr, ^(id element, NSUInteger index, NSArray *list) {
        expect([list objectAtIndex:index]).toEqual(element);
        [arr2 addObject:element];
      });
      expect(arr).toEqual(arr2);
    });

    specify(@"object-oriented", ^{
      Underscore *u = _(arr).each(^(id element, NSUInteger index, NSArray *list) {
        expect([list objectAtIndex:index]).toEqual(element);
        [arr2 addObject:element];
      });
      expect(u).toBeKindOf([Underscore class]);
      expect(u.value()).toEqual(arr2);
    });
  });

  context(@"Set", ^{
    specify(@"functional", ^{
      _.each(set, ^(id element, NSSet *list) {
        expect([list containsObject:element]).toEqual(YES);
        [set2 addObject:element];
      });
      expect(set).toEqual(set2);
    });

    specify(@"object-oriented", ^{
      Underscore *u = _(set).each(^(id element, NSSet *list) {
        expect([list containsObject:element]).toEqual(YES);
        [set2 addObject:element];
      });
      expect(u).toBeKindOf([Underscore class]);
      expect(u.value()).toEqual(set2);
    });
  });

  context(@"Dictionary", ^{
    specify(@"functional", ^{
      _.each(dic, ^(id value, id key, NSDictionary *list) {
        expect([list objectForKey:key]).toEqual(value);
        [dic2 setObject:value forKey:key];
      });
      expect(dic).toEqual(dic2);
    });

    specify(@"object-oriented", ^{
      Underscore *u = _(dic).each(^(id value, id key, NSDictionary *list) {
        expect([list objectForKey:key]).toEqual(value);
        [dic2 setObject:value forKey:key];
      });
      expect(u).toBeKindOf([Underscore class]);
      expect(u.value()).toEqual(dic2);
    });
  });
});

describe(@"map", ^{
  context(@"Array", ^{
    specify(@"functional", ^{
      arr = _.map(arr, ^(id element, NSUInteger index, NSArray *list) {
        expect([list objectAtIndex:index]).toEqual(element);
        return [element stringByAppendingString:@"."];
      });
      expect(arr).toEqual(_a(@"foo.", @"bar."));
    });

    specify(@"object-oriented", ^{
      Underscore *u = _(arr).map(^(id element, NSUInteger index, NSArray *list) {
        expect([list objectAtIndex:index]).toEqual(element);
        return [element stringByAppendingString:@"."];
      });
      expect(u).toBeKindOf([Underscore class]);
      expect(u.value()).toEqual(_a(@"foo.", @"bar."));
    });
  });

  context(@"Set", ^{
    specify(@"functional", ^{
      arr = _.map(set, ^(id element, NSSet *list) {
        expect([list containsObject:element]).toEqual(YES);
        return [element stringByAppendingString:@"."];
      });
      expect(arr).toEqual(_a(@"foo.", @"bar."));
    });

    specify(@"object-oriented", ^{
      Underscore *u = _(set).map(^(id element, NSSet *list) {
        expect([list containsObject:element]).toEqual(YES);
        return [element stringByAppendingString:@"."];
      });
      expect(u).toBeKindOf([Underscore class]);
      expect(u.value()).toEqual(_a(@"foo.", @"bar."));
    });
  });

  context(@"Dictionary", ^{
    specify(@"functional", ^{
      arr = _.map(dic, ^(id value, id key, NSDictionary *list) {
        expect([list objectForKey:key]).toEqual(value);
        return [value stringByAppendingString:@"."];
      });
      expect(arr).toEqual(_a(@"bar.", @"qux."));
    });

    specify(@"object-oriented", ^{
      Underscore *u = _(dic).map(^(id value, id key, NSDictionary *list) {
        expect([list objectForKey:key]).toEqual(value);
        return [value stringByAppendingString:@"."];
      });
      expect(u).toBeKindOf([Underscore class]);
      expect(u.value()).toEqual(_a(@"bar.", @"qux."));
    });
  });
});

SpecEnd
