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
let a : int = 5;
let b : float = 5.0;
let c : bool = true or false; // true
let d : char = 'a'; // TODO : figure out how char works

let e : []char = "hello";

// Any type can have the optional property.
// This means that the type is either "null" or the inner type.
let f : ?[]char = "world";

let g = e + f.?;

let g = 5; // type can be infered
```

## Primitive Types

The primitive types are as follows:

| Type | Description           |
| -----| ----------------------|
| int  | bigint                |
| float| 64-bit floating point |
| bool | `true` or `false`     |
| char | TODO                  |
| void | 0 bit type            |
