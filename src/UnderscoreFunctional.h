#import <Foundation/Foundation.h>

@interface UnderscoreFunctional : NSObject

@property (nonatomic, readonly) id(^each)(id list, id iterator);
@property (nonatomic, readonly) id(^map)(id list, id iterator);

@end

extern UnderscoreFunctional *_;
