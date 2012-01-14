// Adapted from ConciseKit
#define _a(...)   [NSArray arrayWithObjects:__VA_ARGS__, nil]
#define _ma(...)  [NSMutableArray arrayWithObjects:__VA_ARGS__, nil]
#define _s(...)   [NSSet setWithObjects:__VA_ARGS__, nil]
#define _ms(...)  [NSMutableSet setWithObjects:__VA_ARGS__, nil]
#define _d(...)   [NSDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]
#define _md(...)  [NSMutableDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]
#define _kv(k, v) (v), (k)
#define _$(...)   [NSString stringWithFormat:__VA_ARGS__]
#define _m$(...)  [NSMutableString stringWithFormat:__VA_ARGS__]

#define _arr(...)   _a(__VA_ARGS__)
#define _marr(...)  _ma(__VA_ARGS__)
#define _set(...)   _s(__VA_ARGS__)
#define _mset(...)  _ms(__VA_ARGS__)
#define _dict(...)  _d(__VA_ARGS__)
#define _mdict(...) _md(__VA_ARGS__)
#define _str(...)   _$(__VA_ARGS__)
#define _mstr(...)  _m$(__VA_ARGS__)

#define _bool(val)      [NSNumber numberWithBool:(val)]
#define _char(val)      [NSNumber numberWithChar:(val)]
#define _double(val)    [NSNumber numberWithDouble:(val)]
#define _float(val)     [NSNumber numberWithFloat:(val)]
#define _int(val)       [NSNumber numberWithInt:(val)]
#define _integer(val)   [NSNumber numberWithInteger:(val)]
#define _long(val)      [NSNumber numberWithLong:(val)]
#define _longlong(val)  [NSNumber numberWithLongLong:(val)]
#define _short(val)     [NSNumber numberWithShort:(val)]
#define _uchar(val)     [NSNumber numberWithUnsignedChar:(val)]
#define _uint(val)      [NSNumber numberWithUnsignedInt:(val)]
#define _uinteger(val)  [NSNumber numberWithUnsignedInteger:(val)]
#define _ulong(val)     [NSNumber numberWithUnsignedLong:(val)]
#define _ulonglong(val) [NSNumber numberWithUnsignedLongLong:(val)]
#define _ushort(val)    [NSNumber numberWithUnsignedShort:(val)]

#define _nonretained(val) [NSValue valueWithNonretainedObject:(val)]
#define _pointer(val)     [NSValue valueWithPointer:(val)]
#define _point(val)       [NSValue valueWithPoint:(val)]
#define _range(val)       [NSValue valueWithRange:(val)]
#define _rect(val)        [NSValue valueWithRect:(val)]
#define _size(val)        [NSValue valueWithSize:(val)]

#define _longLong(val)          _longlong(val)
#define _unsignedChar(val)      _uchar(val)
#define _unsignedInt(val)       _uint(val)
#define _unsignedInteger(val)   _uinteger(val)
#define _unsignedLong(val)      _ulong(val)
#define _unsignedLongLong(val)  _ulonglong(val)
#define _unsignedShort(val)     _ushort(val)
#define _nonretainedObject(val) _nonretained(val)
