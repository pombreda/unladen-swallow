// RUN: clang %s -verify -fsyntax-only &&
// RUN: clang %s -verify -fsyntax-only -DDECLAREIT

// a declaration of NSConstantString is not required.
#ifdef DECLAREIT
@interface NSConstantString;
@end
#endif



id s = @"123"; // simple
id t = @"123" @"456"; // concat
id u = @"123" @ blah; // expected-error {{unexpected token}}
