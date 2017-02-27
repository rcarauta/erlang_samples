-module(recursion).

-export([fib/1, pieces/1,perimeter/1,area/1,bits/1]).

fib(0) ->
  0;
fib(1) ->
  1;
fib(X) when X>0 ->
    fib(X-2) + fib(X-1). 
 
pieces(0) ->
	1;
pieces(N) ->
  N + pieces(N-1).
  
 
perimeter({circle, R}) ->
	2*R*3.14;
perimeter({triangle, A, B, C})->
	A+B+C.
	
area({circle,R}) ->
	3.14*(R*R);
area({triangle,B,H}) ->
	(B*H)/2.
	
bits(N) ->
	bits(N,0).
	
bits(0,C) ->
	C;
bits(N,C) ->
	bits(N div 2, C +(N rem 2)).


	
	


	
  
