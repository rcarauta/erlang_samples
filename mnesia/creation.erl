%% @author 02501699165
%% @doc @todo Add description to creation.


-module(creation).

-include_lib("../include/tables.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([install/1]).

install(Nodes) ->
	ok = mnesia:create_schema(Nodes),
	application:start(mnesia),
	mnesia:create_table(recipe,
						[{attributes, record_info(fields,
												  recipe)},
						 {index,[#recipe.id]},
						 {disc_copies, Nodes}]),
	io:format("Schema formed!!!!!"),
	application:stop(mnesia).



%% ====================================================================
%% Internal functions
%% ====================================================================


