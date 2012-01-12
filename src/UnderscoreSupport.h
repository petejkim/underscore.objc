#import "UnderscoreUnchained.h"

#define _(object) [UnderscoreUnchained underscoreUnchainedWithObject:(UnderscoreObjectify(@encode(__typeof__((object))), (object)))]

id UnderscoreObjectify(char *type, ...);
