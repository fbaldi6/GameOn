%%%-------------------------------------------------------------------
%% @doc ws_server public API
%% @end
%%%-------------------------------------------------------------------

-module(ws_server_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/ws", ws_handler, #{}}]} %% #{} initial state is an empty map
    ]),
    {ok, _} = cowboy:start_clear(http_listener,
        [{port, 8090}],
        #{env => #{dispatch => Dispatch}}
    ),
    ets:new(matches, [public, set, named_table]), %% Public table that will store all the matches => (UserPID, OpponentUsername)
    ws_server_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
