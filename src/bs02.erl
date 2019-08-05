-module(bs02).
-export([words/1]).

%Разделить строку на слова

words(Bin) ->
    words(Bin, <<>>, []).

%when is_binary(Bin) - не обязательно

words(<<" ", Rest/binary>>, <<>>, Result) ->
    words(Rest, <<>>, Result);
words(<<" ", Rest/binary>>, Acc, Result) ->
    words(Rest, <<>>, [Acc|Result]);
words(<<C/utf8, Rest/binary>>, Acc, Result) ->
    words(Rest, <<Acc/binary, C/utf8>>, Result);
words(<<>>, <<>>, Result) ->
    p05:reverse(Result);
words(<<>>, Acc, Result) ->
    p05:reverse([Acc|Result]).


