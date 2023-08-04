unit handler_menu;
interface

uses
    crt, menu, show_menu;

function get_name(var gamemenu: cmenu) : string;
function get_choice(var gamemenu: cmenu): integer;
implementation

procedure getkey(var code: integer);
var
    symbol: char;
begin
    symbol:= readkey;
    if symbol = #0 then
    begin
        symbol := readkey;
        code := -ord((symbol))
    end
    else
    begin
        code := ord(symbol);
    end
end;

function get_name(var gamemenu: cmenu) : string;
var
    name    : string;
    code    : integer;
    x, y    : integer;
    cx, cy  : integer;
begin
    x := screenwidth div 2;
    y := screenheight div 2;
    name := '';
    show_start_menu(gamemenu, x, y);
    cx := x  - 2;
    cy := y + 1;
    while True do
    begin
        if not keypressed then
        begin
            textcolor(red + blink);
            show_cursor(x - 5, y + 1);
            gotoxy(1, 1);
        end;
        getkey(code);
        if code = 27 then
        begin
            break;
        end;
        if code = 13 then
        begin
           if length(name) < 1 then
           begin
               gotoxy(x - 12, y + 2);
               write('you must enter a name!');
               delay(3000);
               gotoxy(x - 12, y + 2);
               write('                      ');
           end
           else
           begin
               break
           end;
        end;
        if ((code >= 65) and (code <= 90)) or ((code >= 97) and (code <= 122)) then
        begin
            if length(name) < 5 then
            begin
                textcolor(blue);
                gotoxy(cx, cy);
                write(chr(code));
                cx := cx + 1;
                name := name + chr(code);
            end;
        end;
        if code = 8 then
        begin
            if length(name) > 0 then
            begin
                cx := cx - 1;
                gotoxy(cx, cy);
                textcolor(lightgray);
                write('*');
                name := copy(name, 1, length(name) - 1);
            end;
        end;
    end;
    clrscr;
    textcolor(lightgray);
    get_name := name;
end;

procedure set_direction(var cx, cy, y, choice: integer; delta: integer);
var
    ncy : integer;
begin
    gotoxy(cx, cy);
    write('  ');
    ncy := cy  + delta;
    if (ncy >= y - 3) and (ncy <= y) then
    begin    
        cy := cy + delta;
        if choice <= 3 then
        begin
            choice := choice + delta;
        end;
    end;
    gotoxy(1, 1);
end;

function get_choice(var gamemenu: cmenu): integer;
var
    choice : integer;
    code   : integer;
    x, y   : integer;
    cx, cy : integer; 
begin;
    choice := 0;
    x := screenwidth div 2;
    y := screenheight div 2;
    cx:= x - 2;
    cy:= y - 3;
    while True do
    begin
        if not keypressed then
        begin
            show_cursor(cx, cy);
            show_menu_game(gamemenu, x, y);
            gotoxy(1, 1);
        end;
        getkey(code);
        case code of
            -80 : set_direction(cx, cy, y, choice,1);
            -72 : set_direction(cx, cy, y, choice ,-1);
             27 : break;
             13 : break;
        end;
    end;

    get_choice := choice;
end;

end.
