#import <Foundation/Foundation.h>

@interface Underscore : NSObject {
  id _object;
}

@property (nonatomic, retain) id object;

- (id)initWithObject:(id)object;
+ (Underscore *)underscoreWithObject:(id)object;

#pragma mark - Collections

@property (nonatomic, readonly) Underscore *(^each)(id iterator);
@property (nonatomic, readonly) Underscore *(^map)(id iterator);
@property (nonatomic, readonly) Underscore *(^reduce)(id iterator, id memo);
@property (nonatomic, readonly) Underscore *(^size)(void);

#pragma mark - Arrays

@property (nonatomic, readonly) Underscore *(^first)(void);
@property (nonatomic, readonly) Underscore *(^last)(void);
@property (nonatomic, readonly) Underscore *(^initial)(void);
@property (nonatomic, readonly) Underscore *(^rest)(void);
@property (nonatomic, readonly) Underscore *(^initialN)(NSUInteger n);
@property (nonatomic, readonly) Underscore *(^restN)(NSUInteger n);
@property (nonatomic, readonly) Underscore *(^firstN)(NSUInteger n);
@property (nonatomic, readonly) Underscore *(^lastN)(NSUInteger n);

#pragma mark - Utility

@property (nonatomic, readonly) Underscore *(^times)(id iterator);

#pragma mark - Chaining

@property (nonatomic, readonly) Underscore *(^chain)(void);
@property (nonatomic, readonly) id(^value)(void);
@property (nonatomic, readonly) BOOL(^boolValue)(void);
@property (nonatomic, readonly) char(^charValue)(void);
@property (nonatomic, readonly) double(^doubleValue)(void);
@property (nonatomic, readonly) float(^floatValue)(void);
@property (nonatomic, readonly) int(^intValue)(void);
@property (nonatomic, readonly) NSInteger(^integerValue)(void);
@property (nonatomic, readonly) long long(^longlongValue)(void);
@property (nonatomic, readonly) long long(^longLongValue)(void);
@property (nonatomic, readonly) long(^longValue)(void);
@property (nonatomic, readonly) short(^shortValue)(void);
@property (nonatomic, readonly) unsigned char(^ucharValue)(void);
@property (nonatomic, readonly) unsigned char(^unsignedCharValue)(void);
@property (nonatomic, readonly) NSUInteger(^uintegerValue)(void);
@property (nonatomic, readonly) NSUInteger(^unsignedIntegerValue)(void);
@property (nonatomic, readonly) unsigned int(^uintValue)(void);
@property (nonatomic, readonly) unsigned int(^unsignedIntValue)(void);
@property (nonatomic, readonly) unsigned long long(^ulonglongValue)(void);
@property (nonatomic, readonly) unsigned long long(^unsignedLongLongValue)(void);
@property (nonatomic, readonly) unsigned long(^ulongValue)(void);
@property (nonatomic, readonly) unsigned long(^unsignedLongValue)(void);
@property (nonatomic, readonly) unsigned short(^ushortValue)(void);
@property (nonatomic, readonly) unsigned short(^unsignedShortValue)(void);

#pragma mark -

@end
