-module(signup_rest_handler).

-export([post/1]).

post(#{data := SignupData}) ->
    case SignupData of
        #{name := _, email := _, password := _} ->
            Result = worker_sup:run(signup_sup,
                                    fun (Pid) ->
                                            signup_server:signup(Pid, SignupData)
                                    end),
            case Result of
                ok ->
                    ok;
                error ->
                    forbidden
            end;
        #{email := _, password := _} ->
            {bad_request, "Missing name"};
        #{password := _} ->
            {bad_request, "Missing email"};
        #{} ->
            {bad_request, "Missing password"}
    end.