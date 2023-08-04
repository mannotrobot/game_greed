unit menu;
interface

uses
    crt;

type
    cmenu = record
        name   : string;
        game   : string;
        start  : string;
        scores : string;
        options: string;
        exit   : string;
        lang   : string;
        state  : boolean;
    end;

function get_menu(): cmenu;
implementation

function get_menu() : cmenu;
var
    f         : text;
    game_menu : cmenu;
    array_menu: array [0..6] of string;
    count     : integer;
begin
    {$I-}
    assign(f, 'config.txt');
    reset(f);
    if IOResult <> 0 then
    begin
        writeln('Couldn''t open file config.txt');
        halt(1)
    end;
    count := 0;
    while not seekeof(f) do
    begin
        readln(f, array_menu[count]);
        count := count + 1;
    end;
    close(f);

    game_menu.name   := array_menu[0];
    game_menu.game   := array_menu[1];
    game_menu.start  := array_menu[2];
    game_menu.scores := array_menu[3];
    game_menu.options:= array_menu[4];
    game_menu.lang   := array_menu[5];
    game_menu.exit   := array_menu[6];

    get_menu := game_menu;
end;
end.
