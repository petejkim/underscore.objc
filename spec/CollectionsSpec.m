#import "SpecHelper.h"

SpecBegin(Underscore_Collections)

__block NSArray *arr;
__block NSMutableArray *arr2;
__block NSSet *set;
__block NSMutableSet *set2;
__block NSDictionary *dic;
__block NSMutableDictionary *dic2;
__block id val;

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

    specify(@"chained", ^{
      val = _(arr).chain().each(^(id element, NSUInteger index, NSArray *list) {
        expect([list objectAtIndex:index]).toEqual(element);
        [arr2 addObject:element];
      }).value();
      expect(val).toBeNil();
      expect(arr).toEqual(arr2);
    });
  });

  context(@"Set", ^{
    specify(@"functional style", ^{
      _.each(set, ^(id element, NSSet *list) {
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

    specify(@"chained", ^{
      val = _(set).chain().each(^(id element, NSSet *list) {
        expect([list containsObject:element]).toEqual(YES);
        [set2 addObject:element];
      }).value();
      expect(val).toBeNil();
      expect(set).toEqual(set2);
    });
  });

  context(@"Dictionary", ^{
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

    specify(@"chained", ^{
      val = _(dic).chain().each(^(id value, id key, NSDictionary *list) {
        expect([list objectForKey:key]).toEqual(value);
        [dic2 setObject:value forKey:key];
      }).value();
      expect(val).toBeNil();
      expect(dic).toEqual(dic2);
    });
  });
});

describe(@"map", ^{
  context(@"Array", ^{
    specify(@"functional style", ^{
      arr = _.map(arr, ^(id element, NSUInteger index, NSArray *list) {
        expect([list objectAtIndex:index]).toEqual(element);
        return [element stringByAppendingString:@"."];
      });
      expect(arr).toEqual(_a(@"foo.", @"bar."));
    });

    specify(@"object-oriented style", ^{
      arr = _(arr).map(^(id element, NSUInteger index, NSArray *list) {
        expect([list objectAtIndex:index]).toEqual(element);
        return [element stringByAppendingString:@"."];
      });
      expect(arr).toEqual(_a(@"foo.", @"bar."));
    });

    specify(@"chained", ^{
      val = _(arr).chain().map(^(id element, NSUInteger index, NSArray *list) {
        expect([list objectAtIndex:index]).toEqual(element);
        return [element stringByAppendingString:@"."];
      }).value();
      expect(val).toEqual(_a(@"foo.", @"bar."));
    });
  });

  context(@"Set", ^{
    specify(@"functional style", ^{
      arr = _.map(set, ^(id element, NSSet *list) {
        expect([list containsObject:element]).toEqual(YES);
        return [element stringByAppendingString:@"."];
      });
      expect(arr).toEqual(_a(@"foo.", @"bar."));
    });

    specify(@"object-oriented style", ^{
      arr = _(set).map(^(id element, NSSet *list) {
        expect([list containsObject:element]).toEqual(YES);
        return [element stringByAppendingString:@"."];
      });
      expect(arr).toEqual(_a(@"foo.", @"bar."));
    });

    specify(@"chained", ^{
      val = _(set).chain().map(^(id element, NSSet *list) {
        expect([list containsObject:element]).toEqual(YES);
        return [element stringByAppendingString:@"."];
      }).value();
      expect(val).toEqual(_a(@"foo.", @"bar."));
    });
  });

  context(@"Dictionary", ^{
    specify(@"functional style", ^{
      arr = _.map(dic, ^(id value, id key, NSDictionary *list) {
        expect([list objectForKey:key]).toEqual(value);
        return [value stringByAppendingString:@"."];
      });
      expect(arr).toEqual(_a(@"bar.", @"qux."));
    });

    specify(@"object-oriented style", ^{
      arr = _(dic).map(^(id value, id key, NSDictionary *list) {
        expect([list objectForKey:key]).toEqual(value);
        return [value stringByAppendingString:@"."];
      });
      expect(arr).toEqual(_a(@"bar.", @"qux."));
    });

    specify(@"object-oriented style", ^{
      val = _(dic).chain().map(^(id value, id key, NSDictionary *list) {
        expect([list objectForKey:key]).toEqual(value);
        return [value stringByAppendingString:@"."];
      }).value();
      expect(val).toEqual(_a(@"bar.", @"qux."));
    });
  });
});

SpecEnd
