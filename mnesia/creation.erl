%% @author 02501699165
%% @doc @todo Add description to creation.


-module(creation).

-include_lib("../include/tables.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([install/1,insert/0, read/1]).

install(Nodes) ->
	ok = mnesia:create_schema(Nodes),
	mnesia:start(),
	mnesia:create_table(recipe,
						[{attributes, record_info(fields,
												  recipe)},
						 {index,[#recipe.id]},
						 {disc_copies, Nodes}]),
	
	io:format("Schema formed!!!!!").


insert() ->
	AdRecipe = #recipe{id = 1, name = "Teste",instruction="Instrucao"},
	Write = fun() ->
		mnesia:write(AdRecipe)
	end,
	mnesia:transaction(Write),
	io:format("data insert on table").

read(Id) ->

	Read = fun() ->
		mnesia:read(recipe, Id)
	end,
	
	mnesia:transaction(Read).


%% ====================================================================
%% Internal functions
%% ====================================================================


