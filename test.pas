program test;
uses
    crt, handler_menu, menu;

var
    gamemenu : cmenu;
    p        : integer;
begin
   gamemenu := get_menu;
   get_name(gamemenu);
   p := get_choice(gamemenu);
   write(p);
   delay(2000);
   clrscr;
end.
