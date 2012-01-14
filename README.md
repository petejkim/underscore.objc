# Underscore.cocoa

Underscore.cocoa is a utility-belt library for Objective-C & Cocoa that provides a lot of the functional programming support that you would expect in languages like Ruby, but without extending any of the built-in Foundation classes. It is heavily inspired by [Underscore.js](http://documentcloud.github.com/underscore) and aims to emulate the original syntax as close as possible.

# WORK IN PROGRESS

✓ : Implemented
× : Unimplemented

### Macros

```
✓ _a               = × _arr
✓ _ma              = × _marr
✓ _s               = × _str
✓ _ms              = × _mstr
✓ _d               = × _dict
✓ _md              = × _mdict
✓ _kv
✓ _$               = × _str
✓ _m$              = × _mstr
✓ _bool
✓ _int
✓ _float
✓ _char
✓ _double
✓ _integer
✓ _long
✓ _longlong        = × _longLong
✓ _short
✓ _uchar           = × _unsignedChar
✓ _uint            = × _unsignedInt
✓ _uinteger        = × _unsignedInteger
✓ _ulong           = × _unsignedLong
✓ _ulonglong       = × _unsignedLongLong
✓ _ushort          = × _unsignedShort
✓ _nonretained     = × _nonretainedObject
✓ _pointer
✓ _point
✓ _range
✓ _rect
✓ _size
```

### Collections (Arrays, Sets, Dictionaries)

```
✓ each             = × forEach
✓ map              = × collect
✓ reduce           = × inject                 = × foldl
× reduceRight      = × foldr
× find             = × detect
× filter           = × select
× reject
× all              = × every
× any              = × some
× include          = × contains
× pluck
× max
× min
× sortBy
× groupBy
× sortedIndex
× shuffle
× toArray
✓ size
```

### Arrays

```
✓ first            = × head
✓ firstN
✓ initial
✓ initialN
✓ last
✓ lastN
✓ rest             = × tail
✓ restN
× compact
× flatten
× union
× intersection
× difference
× uniq             = × unique
× zip
× indexOf
× lastIndexOf
× range
× slice
× push
× pop
× shift
× unshift
× join
```

### Sets

```
× rest
× compact
× flatten
× without
× union
× intersection
× difference
```

### Dictionaries

```
× keys
× values
× extend
× defaults
× clone
```

### Objects

```
× tap
× isEqual
× isEmpty
× isArray
× isString
× isNumber
× isDate
× isNull
```

### Utility

```
× identity
✓ times
× uniqueId
× escape
```

### Chaining

```
✓ chain
✓ value
✓ boolValue
✓ charValue
✓ doubleValue
✓ floatValue
✓ intValue
✓ integerValue
✓ longlongValue    = ✓ longLongValue
✓ longValue
✓ shortValue
✓ ucharValue       = ✓ unsignedCharValue
✓ uintegerValue    = ✓ unsignedIntegerValue
✓ uintValue        = ✓ unsignedIntValue
✓ ulonglongValue   = ✓ unsignedLongLongValue
✓ ulongValue       = ✓ unsignedLongValue
✓ ushortValue      = ✓ unsignedShortValue
```

## CREDITS

Thanks to Jeremy Ashkenas and all contributors to Underscore.js.

## AUTHOR & LICENSE

Copyright (c) 2012 Peter Jihoon Kim. This software is licensed under the [MIT License](http://github.com/petejkim/specta/raw/master/LICENSE).

