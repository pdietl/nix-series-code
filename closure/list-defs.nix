#!/bin/nix-instantiate
with builtins;
let
	cons    = h: t: (x: if x then h else t);
	nil     = null;
	isEmpty = l: l == nil;
	access  = x: l: if isEmpty l
		then throw "list is empty"
		else l x
	;
	car = access true;
	cdr = access false;

	x = nil;
	y = cons 3 nil;
	z = cons "hello" (cons 3 (cons (x: x) nil));
	# We're being "lazy" here...
	w = cons nil (cons nil nil);
in
	# This is just to force Nix to evaluate everything;
	# in a later exercise, we'll learn how to print such
	# lists.
	deepSeq [x y z w]
	"ok"
