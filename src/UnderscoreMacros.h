/* Adapted from ConciseKit */
#define a_(...)   [NSArray arrayWithObjects:__VA_ARGS__, nil]
#define ma_(...)  [NSMutableArray arrayWithObjects:__VA_ARGS__, nil]
#define s_(...)   [NSSet setWithObjects:__VA_ARGS__, nil]
#define ms_(...)  [NSMutableSet setWithObjects:__VA_ARGS__, nil]
#define d_(...)   [NSDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]
#define md_(...)  [NSMutableDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]
#define kv_(k, v) (v), (k)
#define $_(...)   [NSString stringWithFormat:__VA_ARGS__]
#define m$_(...)  [NSMutableString stringWithFormat:__VA_ARGS__]

#define arr_(...)   a_(__VA_ARGS__)
#define marr_(...)  ma_(__VA_ARGS__)
#define set_(...)   s_(__VA_ARGS__)
#define mset_(...)  ms_(__VA_ARGS__)
#define dict_(...)  d_(__VA_ARGS__)
#define mdict_(...) md_(__VA_ARGS__)
#define str_(...)   $_(__VA_ARGS__)
#define mstr_(...)  m$_(__VA_ARGS__)

#define bool_(val)      [NSNumber numberWithBool:(val)]
#define char_(val)      [NSNumber numberWithChar:(val)]
#define double_(val)    [NSNumber numberWithDouble:(val)]
#define float_(val)     [NSNumber numberWithFloat:(val)]
#define int_(val)       [NSNumber numberWithInt:(val)]
#define integer_(val)   [NSNumber numberWithInteger:(val)]
#define long_(val)      [NSNumber numberWithLong:(val)]
#define longlong_(val)  [NSNumber numberWithLongLong:(val)]
#define short_(val)     [NSNumber numberWithShort:(val)]
#define uchar_(val)     [NSNumber numberWithUnsignedChar:(val)]
#define uint_(val)      [NSNumber numberWithUnsignedInt:(val)]
#define uinteger_(val)  [NSNumber numberWithUnsignedInteger:(val)]
#define ulong_(val)     [NSNumber numberWithUnsignedLong:(val)]
#define ulonglong_(val) [NSNumber numberWithUnsignedLongLong:(val)]
#define ushort_(val)    [NSNumber numberWithUnsignedShort:(val)]

#define nonretained_(val) [NSValue valueWithNonretainedObject:(val)]
#define pointer_(val)     [NSValue valueWithPointer:(val)]
#define point_(val)       [NSValue valueWithPoint:(val)]
#define range_(val)       [NSValue valueWithRange:(val)]
#define rect_(val)        [NSValue valueWithRect:(val)]
#define size_(val)        [NSValue valueWithSize:(val)]

#define longLong_(val)          longlong_(val)
#define unsignedChar_(val)      uchar_(val)
#define unsignedInt_(val)       uint_(val)
#define unsignedInteger_(val)   uinteger_(val)
#define unsignedLong_(val)      ulong_(val)
#define unsignedLongLong_(val)  ulonglong_(val)
#define unsignedShort_(val)     ushort_(val)
#define nonretainedObject_(val) nonretained_(val)
