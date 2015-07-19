-module(transformer).
-import(rbc, [transaction_history/1]).
-export([transform/2]).

transform(Input_Format, Data) ->
    case Input_Format of
        rbc_transaction_history ->
            rbc:transaction_history(Data)
    end.