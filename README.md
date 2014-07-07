compiler-libs-examples
======================

Easy applications of OCaml compiler-libs
@no_maddo

* OCaml 4.02.0. Try install it in opam
* make

All of Makefile were originally [compiler-libs-hack](https://bitbucket.org/camlspotter/compiler-libs-hack/src).
See details in compiler-libs-hack to know compiler-libs in itself.
I modified it little.

All .ml files come from OCaml compiler's source code except /warn-short-name/search.ml

# vanilla
This compiler is really equal to original OCaml compiler.
In vanilla directory, just type make to compile vanilla opt compiler.

# warn-short-names
Hacked compiler to warn short names below two.
I add the waring function and the option "-ignore-tooshort" make it quite
In warn-short-names directory, just type make to compile the hacked compiler.

## TypedtreeIter
Search.ml is the main part to warn. Very short code.
In this file, I apply typedtreeIter.ml.
This is an utility module to make it easy to check all of componets of ast.
To find componets including names, we have to trace ast.
But it's dull for users to write traversal functions.

TypedtreeIter provide traversal functions.
Functor __MakeIterator__ make a module to traverse ast.
MakeItertor's argument module have functions called when a related componet to the function is found.
(When we traverse __pattern__ , __enter_pattern__ and __leave_pattern__ are called)

Now, We need only define functions which affect componets now we want to check because __DefaultIteratorArgument__.
In this case, I want to check patterns.
So I define __entry_pattern__ and shadowing definition in __DefaultIterArgument__'s one.
(See definiton of __DefaultIteratorArgument__. All of function in this module are id)
