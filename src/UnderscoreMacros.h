#define _a(...)   [NSArray arrayWithObjects:__VA_ARGS__, nil]
#define _ma(...)  [NSMutableArray arrayWithObjects:__VA_ARGS__, nil]
#define _s(...)   [NSSet setWithObjects:__VA_ARGS__, nil]
#define _ms(...)  [NSMutableSet setWithObjects:__VA_ARGS__, nil]
#define _d(...)   [NSDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]
#define _md(...)  [NSMutableDictionary dictionaryWithObjectsAndKeys:__VA_ARGS__, nil]
#define _kv(k, v) (v), (k)
