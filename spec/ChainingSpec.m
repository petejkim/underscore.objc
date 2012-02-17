#import "SpecHelper.h"

SpecBegin(Underscore_Chaining)

__block NSArray *arr;
__block NSMutableArray *arr2;

before(^{
  arr = a_(@"foo", @"bar", @"baz", @"qux");
  arr2 = ma_(nil);
});

describe(@"chain", ^{
  specify(@"functional style", ^{
    _.chain(arr).map(^(id element, NSUInteger index, NSArray *list) {
      return [element stringByAppendingString:@"."];
    }).each(^(id element, NSUInteger index, NSArray *list) {
      [arr2 addObject:element];
    }).value();
    expect(arr2).toEqual(a_(@"foo.", @"bar.", @"baz.", @"qux."));
  });

  specify(@"object-oriented style", ^{
    _(arr).chain().map(^(id element, NSUInteger index, NSArray *list) {
      return [element stringByAppendingString:@"."];
    }).each(^(id element, NSUInteger index, NSArray *list) {
      [arr2 addObject:element];
    }).value();
    expect(arr2).toEqual(a_(@"foo.", @"bar.", @"baz.", @"qux."));
  });
});

describe(@"value", ^{
  it(@"returns the wrapped object", ^{
    expect(_(@"hello").value()).toEqual(@"hello");
    expect(_(@"hello").chain().value()).toEqual(@"hello");
  });
});

describe(@"boolValue", ^{
  context(@"when the wrapped object represents a BOOL value", ^{
    it(@"returns the bool value of the object", ^{
      BOOL val = YES;
      expect(_(val).boolValue()).toEqual(val);
      expect(_(val).chain().boolValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a BOOL value", ^{
    it(@"returns NO", ^{
      expect(_(@"hello").boolValue()).toEqual(NO);
      expect(_(@"hello").chain().boolValue()).toEqual(NO);
    });
  });
});

describe(@"charValue", ^{
  context(@"when the wrapped object represents a char value", ^{
    it(@"returns the char value of the object", ^{
      char val = 127;
      expect(_(val).charValue()).toEqual(val);
      expect(_(val).chain().charValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a char value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").charValue()).toEqual(0);
      expect(_(@"hello").chain().charValue()).toEqual(0);
    });
  });
});

describe(@"doubleValue", ^{
  context(@"when the wrapped object represents a double value", ^{
    it(@"returns the double value of the object", ^{
      double val = 3.141592653589793;
      expect(_(val).doubleValue()).toEqual(val);
      expect(_(val).chain().doubleValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a double value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").doubleValue()).toEqual(0);
      expect(_(@"hello").chain().doubleValue()).toEqual(0);
    });
  });
});

describe(@"floatValue", ^{
  context(@"when the wrapped object represents a float value", ^{
    it(@"returns the float value of the object", ^{
      float val = 3.141592f;
      expect(_(val).floatValue()).toEqual(val);
      expect(_(val).chain().floatValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a float value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").floatValue()).toEqual(0);
      expect(_(@"hello").chain().floatValue()).toEqual(0);
    });
  });
});

describe(@"intValue", ^{
  context(@"when the wrapped object represents a int value", ^{
    it(@"returns the int value of the object", ^{
      int val = 2147483647;
      expect(_(val).intValue()).toEqual(val);
      expect(_(val).chain().intValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a int value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").intValue()).toEqual(0);
      expect(_(@"hello").chain().intValue()).toEqual(0);
    });
  });
});

describe(@"integerValue", ^{
  context(@"when the wrapped object represents a NSInteger value", ^{
    it(@"returns the NSInteger value of the object", ^{
    #ifdef __LP64__
      NSInteger val = 9223372036854775807;
    #else
      NSInteger val = 2147483647;
    #endif
      expect(_(val).integerValue()).toEqual(val);
      expect(_(val).chain().integerValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a NSInteger value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").integerValue()).toEqual(0);
      expect(_(@"hello").chain().integerValue()).toEqual(0);
    });
  });
});

describe(@"longlongValue", ^{
  context(@"when the wrapped object represents a long long value", ^{
    it(@"returns the long long value of the object", ^{
      long long val = 9223372036854775807;
      expect(_(val).longlongValue()).toEqual(val);
      expect(_(val).chain().longlongValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a long long value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").longlongValue()).toEqual(0);
      expect(_(@"hello").chain().longlongValue()).toEqual(0);
    });
  });
});

describe(@"longLongValue", ^{
  context(@"when the wrapped object represents a long long value", ^{
    it(@"returns the long long value of the object", ^{
      long long val = 9223372036854775807;
      expect(_(val).longLongValue()).toEqual(val);
      expect(_(val).chain().longLongValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a long long value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").longLongValue()).toEqual(0);
      expect(_(@"hello").chain().longLongValue()).toEqual(0);
    });
  });
});

describe(@"longValue", ^{
  context(@"when the wrapped object represents a long value", ^{
    it(@"returns the long value of the object", ^{
    #ifdef __LP64__
      long val = 9223372036854775807;
    #else
      long val = 2147483647;
    #endif
      expect(_(val).longValue()).toEqual(val);
      expect(_(val).chain().longValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a long value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").longValue()).toEqual(0);
      expect(_(@"hello").chain().longValue()).toEqual(0);
    });
  });
});

describe(@"shortValue", ^{
  context(@"when the wrapped object represents a short value", ^{
    it(@"returns the short value of the object", ^{
      short val = 32767;
      expect(_(val).shortValue()).toEqual(val);
      expect(_(val).chain().shortValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a short value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").shortValue()).toEqual(0);
      expect(_(@"hello").chain().shortValue()).toEqual(0);
    });
  });
});

describe(@"ucharValue", ^{
  context(@"when the wrapped object represents a unsigned char value", ^{
    it(@"returns the unsigned char value of the object", ^{
      unsigned char val = 255;
      expect(_(val).ucharValue()).toEqual(val);
      expect(_(val).chain().ucharValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a unsigned char value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").ucharValue()).toEqual(0);
      expect(_(@"hello").chain().ucharValue()).toEqual(0);
    });
  });
});

describe(@"unsignedCharValue", ^{
  context(@"when the wrapped object represents a unsigned char value", ^{
    it(@"returns the unsigned char value of the object", ^{
      unsigned char val = 255;
      expect(_(val).unsignedCharValue()).toEqual(val);
      expect(_(val).chain().unsignedCharValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a unsigned char value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").unsignedCharValue()).toEqual(0);
      expect(_(@"hello").chain().unsignedCharValue()).toEqual(0);
    });
  });
});

describe(@"uintegerValue", ^{
  context(@"when the wrapped object represents a NSUInteger value", ^{
    it(@"returns the NSUInteger value of the object", ^{
    #ifdef __LP64__
      NSUInteger val = 18446744073709551615u;
    #else
      NSUInteger val = 4294967295;
    #endif
      expect(_(val).uintegerValue()).toEqual(val);
      expect(_(val).chain().uintegerValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a NSUInteger value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").uintegerValue()).toEqual(0);
      expect(_(@"hello").chain().uintegerValue()).toEqual(0);
    });
  });
});

describe(@"unsignedIntegerValue", ^{
  context(@"when the wrapped object represents a NSUInteger value", ^{
    it(@"returns the NSUInteger value of the object", ^{
    #ifdef __LP64__
      NSUInteger val = 18446744073709551615u;
    #else
      NSUInteger val = 4294967295;
    #endif
      expect(_(val).unsignedIntegerValue()).toEqual(val);
      expect(_(val).chain().unsignedIntegerValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a NSUInteger value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").unsignedIntegerValue()).toEqual(0);
      expect(_(@"hello").chain().unsignedIntegerValue()).toEqual(0);
    });
  });
});

describe(@"uintValue", ^{
  context(@"when the wrapped object represents a unsigned int value", ^{
    it(@"returns the unsigned int value of the object", ^{
      unsigned int val = 4294967295;
      expect(_(val).uintValue()).toEqual(val);
      expect(_(val).chain().uintValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a unsigned int value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").uintValue()).toEqual(0);
      expect(_(@"hello").chain().uintValue()).toEqual(0);
    });
  });
});

describe(@"unsignedIntValue", ^{
  context(@"when the wrapped object represents a unsigned int value", ^{
    it(@"returns the unsigned int value of the object", ^{
      unsigned int val = 4294967295;
      expect(_(val).unsignedIntValue()).toEqual(val);
      expect(_(val).chain().unsignedIntValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a unsigned int value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").unsignedIntValue()).toEqual(0);
      expect(_(@"hello").chain().unsignedIntValue()).toEqual(0);
    });
  });
});

describe(@"ulonglongValue", ^{
  context(@"when the wrapped object represents a unsigned long long value", ^{
    it(@"returns the unsigned long long value of the object", ^{
      unsigned long long val = 18446744073709551615u;
      expect(_(val).ulonglongValue()).toEqual(val);
      expect(_(val).chain().ulonglongValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a unsigned long long value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").ulonglongValue()).toEqual(0);
      expect(_(@"hello").chain().ulonglongValue()).toEqual(0);
    });
  });
});

describe(@"unsignedLongLongValue", ^{
  context(@"when the wrapped object represents a unsigned long long value", ^{
    it(@"returns the unsigned long long value of the object", ^{
      unsigned long long val = 18446744073709551615u;
      expect(_(val).unsignedLongLongValue()).toEqual(val);
      expect(_(val).chain().unsignedLongLongValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a unsigned long long value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").unsignedLongLongValue()).toEqual(0);
      expect(_(@"hello").chain().unsignedLongLongValue()).toEqual(0);
    });
  });
});

describe(@"ulongValue", ^{
  context(@"when the wrapped object represents a unsigned long value", ^{
    it(@"returns the unsigned long value of the object", ^{
    #ifdef __LP64__
      unsigned long val = 18446744073709551615u;
    #else
      unsigned long val = 4294967295;
    #endif
      expect(_(val).ulongValue()).toEqual(val);
      expect(_(val).chain().ulongValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a unsigned long value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").ulongValue()).toEqual(0);
      expect(_(@"hello").chain().ulongValue()).toEqual(0);
    });
  });
});

describe(@"unsignedLongValue", ^{
  context(@"when the wrapped object represents a unsigned long value", ^{
    it(@"returns the unsigned long value of the object", ^{
    #ifdef __LP64__
      unsigned long val = 18446744073709551615u;
    #else
      unsigned long val = 4294967295;
    #endif
      expect(_(val).unsignedLongValue()).toEqual(val);
      expect(_(val).chain().unsignedLongValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a unsigned long value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").unsignedLongValue()).toEqual(0);
      expect(_(@"hello").chain().unsignedLongValue()).toEqual(0);
    });
  });
});

describe(@"ushortValue", ^{
  context(@"when the wrapped object represents a unsigned short value", ^{
    it(@"returns the unsigned short value of the object", ^{
      unsigned short val = 65535;
      expect(_(val).ushortValue()).toEqual(val);
      expect(_(val).chain().ushortValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a unsigned short value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").ushortValue()).toEqual(0);
      expect(_(@"hello").chain().ushortValue()).toEqual(0);
    });
  });
});

describe(@"unsignedShortValue", ^{
  context(@"when the wrapped object represents a unsigned short value", ^{
    it(@"returns the unsigned short value of the object", ^{
      unsigned short val = 65535;
      expect(_(val).unsignedShortValue()).toEqual(val);
      expect(_(val).chain().unsignedShortValue()).toEqual(val);
    });
  });

  context(@"when the wrapped object does not represent a unsigned short value", ^{
    it(@"returns 0", ^{
      expect(_(@"hello").unsignedShortValue()).toEqual(0);
      expect(_(@"hello").chain().unsignedShortValue()).toEqual(0);
    });
  });
});

SpecEnd