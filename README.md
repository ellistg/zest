# Introduction

**Disclamer : the following documentation is all vapourware. The software is currently under development and the purpose of this is for reference and feedback, with everything being subject to change.**

Zest is a general-purpose scripting language for prototyping algorithms and writing glue code, it is statically typed, polymorphic and has a strong type inference system. It is designed to be a tool in the path to a finished product, however, not suggested for use in production, after an algorithm is prototyped, we suggest you compile it to Zig, manage the memory yourself and then incorporate it within your project.

# Comments

```
@print("Hello, World!\n"); // This is a comment.

// The line bellow is also a comment.
// @println("Hello, Again!");
```
Zest comments start with `//` and finish at the end of the line. Following in [Zig's](https://ziglang.org/) footsteps there are no multiline comments, for the same reason as determined by them; any line can be tokenized out of context.

# Values
```
let a : u64 = 5;
let b = a + 5;;
let c : i25 = -3;

let d = true or false; // infered as bool 
let e : rune = 'a';

let f : string = "hello";
let g = string[0]; // 'h'

// Any type can have the optional property.
// This means that the type is either "null" or the inner type.
let g : ?[]char = "world";

// assume that `f` isn't null, h = "hello world"
let h = e + " " + f.?; 
```

## Primitive Types

The primitive types are as follows:

| Type       | Description                                                       |
|------------|-------------------------------------------------------------------|
| string     | byte array representing unicode characters                        |
| u[1-65535] | unsigned integer with size as specified                           |
| i[1-65535] | signed integer with size as specified                             |
| f16        | 16-bit floating point (10-bit mantissa) IEEE-754-2008 binary16    |
| f32        | 32-bit floating point (23-bit mantissa) IEEE-754-2008 binary32    |
| f64        | 64-bit floating point (52-bit mantissa) IEEE-754-2008 binary64    |
| f128       | 128-bit floating point (112-bit mantissa) IEEE-754-2008 binary128 |
| bool       | `true` or `false`                                                 |
| void       | 0 bit type                                                        |

## Primitive Values

| Name               | Description                           |
|--------------------|---------------------------------------|
| `true` and `false` | bool values                           |
| null               | used to set and optional type to null |

# Strings

The string is the most complex primative type, it is a sequence of Unicode code points with automatic encoding and decoding to/from integer types. 

```
let a = "Hello World!";

// When indexing a string the type returned will be `u21` which would then need to be explicitly casted to any other in type you would want.
@assert(@TypeOf(a[0]) == u21);

```

TODO : string methods

## Unicode Code Points

When wanting to store single characters we can store then as integers, the standard would be to store them in `u21`, however, there is nothing forcing this.

```
let a = 'a';
let b : u8 = 'b';

@assert(@TypeOf(a) == u21);
@assert(@TypeOf(b) == u8);
```

| Escape Sequence | Name                                                            |
|-----------------|-----------------------------------------------------------------|
|`\n`             | Newline                                                         |
|`\r`             | Carriage Return                                                 |
|`\t`             | Tab                                                             |
|`\\`             | Backslash                                                       |
|`\'`             | Single Quote                                                    |
|`\"`             | Double Quote                                                    |
|`\xNN`           | hexadecimal 8-bit byte value (2 digits)                         |
|`\u{NNNNNN}`     | hexadecimal Unicode code point UTF-8 encoded (1 or more digits) |
