%%%-------------------------------------------------------------------
%%% @author Kasia
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. sty 2016 17:03
%%%-------------------------------------------------------------------
-module(simpleapp_server).
-behaviour(gen_server).
-author("Kasia").

%% API
-export([start_link/0, say_hello/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

start_link() ->
  gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
  {ok, []}.

say_hello() ->
  gen_server:call(?MODULE, hello).

handle_call(hello, _From, State) ->
  io:format("hello!~n", []),
  {reply, ok, State};

handle_call(_Request, _From, State) ->
  Reply = ok,
  {reply, Reply, State}.

handle_cast(_Msg, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

