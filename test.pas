program test;
uses
    crt, handler_menu, menu;

var
    gamemenu : cmenu;
    p        : boolean;
begin
   p := handler_menu_start;
   if not p then
   begin
       clrscr;
       gotoxy(screenwidth div 2, screenheight div 2);
       write('GoodBye');
       delay(1000);
       clrscr;
   end;
end.
