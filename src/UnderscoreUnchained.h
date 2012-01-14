#import <Foundation/Foundation.h>

@class
  Underscore
;

@interface UnderscoreUnchained : NSObject {
  id _object;
}

@property (nonatomic, retain) id object;

- (id)initWithObject:(id)object;
+ (UnderscoreUnchained *)underscoreUnchainedWithObject:(id)object;

#pragma mark - Collections

@property (nonatomic, readonly) void(^each)(id iterator);
@property (nonatomic, readonly) NSArray *(^map)(id iterator);
@property (nonatomic, readonly) NSUInteger(^size)(void);
@property (nonatomic, readonly) id(^reduce)(id iterator, id memo);

#pragma mark - Arrays

@property (nonatomic, readonly) id(^first)(void);
@property (nonatomic, readonly) id(^last)(void);
@property (nonatomic, readonly) NSArray *(^initial)(void);
@property (nonatomic, readonly) NSArray *(^rest)(void);
@property (nonatomic, readonly) NSArray *(^initialN)(NSUInteger n);
@property (nonatomic, readonly) NSArray *(^restN)(NSUInteger n);
@property (nonatomic, readonly) NSArray *(^firstN)(NSUInteger n);
@property (nonatomic, readonly) NSArray *(^lastN)(NSUInteger n);

#pragma mark - Utility

@property (nonatomic, readonly) void(^times)(id iterator);

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

