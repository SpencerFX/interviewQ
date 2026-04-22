.question.overloads.q1:"What are the overloaded glyphs?";
.question.overloads.a1:"@, \, !, ., $, #, ?, /";

.question.overloads.q2:"What is the syntax for index at? Please wrap within a function";
.question.overloads.a2:{[l;i] l@i};

.question.overloads.q3:"What is the infix syntax for index at? Please wrap within a function";
.question.overloads.a3:{[l;i] @[l;i]};

.question.overloads.q4:"What is the syntax for apply at? Please wrap within a function";
.question.overloads.a4:{[f;y] f@y};

.question.overloads.q5:"What is the infix syntax for apply at? Please wrap within a function";
.question.overloads.a5:{[f;y] @[f;y]};

.question.overloads.q6:"What is the syntax for trap at? Please wrap within a function";
.question.overloads.a6:{[f;y;e] @[f;y;e]};

.question.overloads.q7:"What is the syntax for amend at? Please wrap within a function";
.question.overloads.a7:{[d;i;u] @[d;i;u]};;

.question.overloads.q8:"What is the additional syntax for amend at? Please wrap within a function";
.question.overloads.a8:{[d;i;m;my] @[d;i;m;my]};

.question.overloads.q9:"What is the syntax for replace at? Please wrap within a function";
.question.overloads.a9:{[d;i;:;y] @[d;i;:;y]};

.question.overloads.q10:"What is the syntax for converge using an overloaded glyph?";
.question.overloads.a10:{[u;d] u\[d]};

.question.overloads.q11:"What is the syntax for do using an overloaded glyph?";
.question.overloads.a11:{[n;u;d] n u\d};

.question.overloads.q12:"What is the syntax for while using an overloaded glyph?";
.question.overloads.a12:{[t;u;d] t u\d};

.question.overloads.q13:"What is the syntax for map reduce using an overloaded glyph?"
.question.overloads.a13:{[x;v;y] x v\y};

.question.overloads.q14:
.question.overloads.a14:

.question.overloads.q15:
.question.overloads.a15:


/
"! bang
rank	syntax	semantics
2	x!y	Dict: make a dictionary
2	i!ts	Enkey: make a simple table keyed
2	0!tk	Unkey: make a keyed table simple
2	noasv!iv	Enumeration from index
2	sv!h	Flip Splayed or Partitioned
2	0N!y	display y and return it
2	-i!y	internal function
4	![t;c;b;a]	Update, Delete

". dot
rank	syntax	semantics
2	l . i, .[l;i]	Index
2	g . gx, .[g;gx]	Apply
3	.[g;gx;e]	Trap
3	.[d;i;u]	Amend
4	.[d;i;m;my]	Amend
4	.[d;i;:;y]	Replace

$ dollar
rank	example	semantics
3	$[x>10;y;z]	Cond: conditional evaluation
2	"h"$y, `short$y, 11h$y	Cast: cast datatype
2	"H"$y, -11h$y	Tok: interpret string as data
2	x$y	Enumerate: enumerate y from x
2	10$"abc"	Pad: pad string
2	(1 2 3f;4 5 6f)$(7 8f;9 10f;11 12f)	dot product, matrix multiply, mmu

# hash
rank	example	semantics
2	2 3#til 6	Take
2	s#1 2 3	Set Attribute

? query
rank	example	semantics
2	"abcdef"?"cab"	Find y in x
2	10?1000, 5?01b	Roll
2	-10?1000, -1?`yes`no	Deal
2	0N?1000, 0N?`yes`no	Permute
2	x?v	extend an enumeration: Enum Extend
3	?[11011b;"black";"flock"]	Vector Conditional
3	?[t;i;p]	Simple Exec
4	?[t;c;b;a]	Select, Exec
5	?[t;c;b;a;n]	Select
6	?[t;c;b;a;n;(g;cn)]	Select

/ slash
rank	syntax	semantics
n/a	/a comment	comment: ignore rest of line
1	(u/)y, u/[y]	Converge
1	n u/ y, u/[n;y]	Do
1	t u/ y, u/[t;y]	While
1	(v/)y, v/[y]	map-reduce: reduce a list or lists
\