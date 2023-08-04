unit show_menu;
interface

uses
    crt, menu;

procedure show_menu_game(var game_menu: cmenu; x, y: integer);
procedure show_start_menu(var game: cmenu; x, y: integer);
procedure show_cursor(x, y : integer);
implementation

procedure show_cursor(x, y: integer);
var
    cur : string;
begin
    cur := '->';
    gotoxy(x, y);
    write(cur);
end;

procedure show_menu_game(var game_menu: cmenu; x,y : integer);
begin
    if not game_menu.state then
    begin
        gotoxy(x - 2, y-4);
        write(copy(game_menu.game, 1, 5));
        gotoxy(x + 2, y - 3);
        write(copy(game_menu.start, 1, 5));
        gotoxy(x + 2, y - 2);
        write(copy(game_menu.scores, 1, 6));
        gotoxy(x + 2, y - 1);
        write(copy(game_menu.options, 1, 7));
        gotoxy(x + 2, y);
        write(copy(game_menu.exit, 1, 4));
    end
    else
    begin
        gotoxy(x - 2, y - 4);
        write(copy(game_menu.game, 6, 10));
        gotoxy(x + 2, y - 3);
        write(copy(game_menu.start, 7, 11));
        gotoxy(x + 2, y - 2);
        write(copy(game_menu.scores, 8, 11));
        gotoxy(x + 2, y - 1);
        write(copy(game_menu.options, 9, 13));
        gotoxy(x + 2, y);
        write(copy(game_menu.exit, 6, 10));
    end;
end;

procedure show_start_menu(var game: cmenu; x, y: integer);
begin
    clrscr;
    gotoxy(x - 10, y);
    write(game.name);
    gotoxy(x - 2, y + 1);
    write('*****');
    gotoxy(1, 1);
end;
end.
