# Underscore.ObjC

Underscore.ObjC is a utility-belt library for Objective-C that provides a lot of the functional programming support that you would expect in languages like Ruby, but without extending any of the built-in Foundation classes. It is heavily inspired by [Underscore.js](http://documentcloud.github.com/underscore) and aims to emulate the original syntax as closely as possible within language limitations.

Underscore.ObjC requires Mac OS X 10.6+ / iOS 4.0+, due to the heavy use of blocks. You may be able to compile and use the library on Mac OS X 10.5+ / iOS 3.0+ with the help of [PLBlocks](http://code.google.com/p/plblocks/), but I have not tested that myself.

# WORK IN PROGRESS

✓ : Implemented
× : Unimplemented

### Macros

```
✓ a_               = ✓ arr_
✓ ma_              = ✓ marr_
✓ s_               = ✓ str_
✓ ms_              = ✓ mstr_
✓ d_               = ✓ dict_
✓ md_              = ✓ mdict_
✓ kv_
✓ $_               = ✓ str_
✓ m$_              = ✓ mstr_
✓ bool_
✓ int_
✓ float_
✓ char_
✓ double_
✓ integer_
✓ long_
✓ longlong_        = ✓ longLong_
✓ short_
✓ uchar_           = ✓ unsignedChar_
✓ uint_            = ✓ unsignedInt_
✓ uinteger_        = ✓ unsignedInteger_
✓ ulong_           = ✓ unsignedLong_
✓ ulonglong_       = ✓ unsignedLongLong_
✓ ushort_          = ✓ unsignedShort_
✓ nonretained_     = ✓ nonretainedObject_
✓ pointer_
✓ point_
✓ range_
✓ rect_
✓ size_
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
✓ compact
✓ flatten
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
