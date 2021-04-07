package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-c e-k m-z A-C E-K M-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
∫ |
lim |
dx {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"(" {lexeme=yytext(); return Parentesis_de_apertura;}
")" {lexeme=yytext(); return Parentesis_de_cierre;}
"[" {lexeme=yytext(); return Corchete_de_apertura;}
"]" {lexeme=yytext(); return Corchete_de_cierre;}

("|") {lexeme=yytext(); return Separador_de_limite;}


("^") {lexeme=yytext(); return Potencia;}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}


("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
