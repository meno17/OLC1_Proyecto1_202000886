
package analisis;

//importaciones si fuese necesario
import java_cup.runtime.Symbol;

%%

// codigo de usuario
%{
    String cadena="";
%}

%init{ 
    yyline = 1; 
    yycolumn = 1; 
%init} 

//caracteristicas propias de jflex
%cup
%class scanner //nombre de la clase
%public // tipo de la clase
%line // conteo de lineas
%char // conteo de caracteres
%column // conteo de columnas
%full // reconocimiento de caracteres
%debug
%ignorecase // insensitive case

// creacion de estados si fuese necesario
%state CADENA

// simbolos



TKARRO = "@"
TKCI = "["
TKCD = "]"
TKPI = "("
TKPD = ")"
TKASIGNACIONI = "<-"
TKASIGNACIOND = "->"
TKDOBLEP = ":"
TKCOMA = ","
TKPCOMA = ";"
TKBLANCOS = [\ \r\t\f\n]+
TKNUMEROS = [0-9]+("."[0-9]+)?


//palabras reservadas
PROGRAM = "PROGRAM"
END = "END"
VAR= "VAR"
ARR = "ARR"
ID = [a-zA-Z][_a-zA-Z0-9]*
SUM = "SUM"
RES = "RES"
MUL = "MUL"
DIV = "DIV"
MODULO = "MOD"
MEDIA = "Media"
MEDIANA = "Mediana"
MOD = "Moda"
VARIANZA = "Varianza"
MAX = "Max"
MIN = "Min"
CONSOLE_PRINT = "console::print="
CONSOLE_COLUMN = "console::column="
DOUBLE = "DOUBLE"
CHAR = "CHAR[]"


%%

<YYINITIAL> {TKARRO}     {return new Symbol(sym.TKARRO,yyline,yycolumn,yytext());}
<YYINITIAL> {TKCI}     {return new Symbol(sym.TKCI,yyline,yycolumn,yytext());}
<YYINITIAL> {TKCD}     {return new Symbol(sym.TKCD,yyline,yycolumn,yytext());}
<YYINITIAL> {TKPI}     {return new Symbol(sym.TKPI,yyline,yycolumn,yytext());}
<YYINITIAL> {TKPD}     {return new Symbol(sym.TKPD,yyline,yycolumn,yytext());}
<YYINITIAL> {TKASIGNACIONI}     {return new Symbol(sym.TKASIGNACIONI,yyline,yycolumn,yytext());}
<YYINITIAL> {TKASIGNACIOND}     {return new Symbol(sym.TKASIGNACIOND,yyline,yycolumn,yytext());}
<YYINITIAL> {TKDOBLEP}     {return new Symbol(sym.TKDOBLEP,yyline,yycolumn,yytext());}
<YYINITIAL> {TKCOMA}     {return new Symbol(sym.TKCOMA,yyline,yycolumn,yytext());}
<YYINITIAL> {TKPCOMA}     {return new Symbol(sym.TKPCOMA,yyline,yycolumn,yytext());}
<YYINITIAL> {TKNUMEROS}     {return new Symbol(sym.TKNUMEROS,yyline,yycolumn,yytext());}
<YYINITIAL> {TKBLANCOS}     {}


<YYINITIAL> {PROGRAM}     {return new Symbol(sym.PROGRAM,yyline,yycolumn,yytext());}
<YYINITIAL> {END}     {return new Symbol(sym.END,yyline,yycolumn,yytext());}
<YYINITIAL> {VAR}     {return new Symbol(sym.VAR,yyline,yycolumn,yytext());}
<YYINITIAL> {ARR}     {return new Symbol(sym.ARR,yyline,yycolumn,yytext());}
<YYINITIAL> {SUM}     {return new Symbol(sym.SUM,yyline,yycolumn,yytext());}
<YYINITIAL> {RES}     {return new Symbol(sym.RES,yyline,yycolumn,yytext());}
<YYINITIAL> {MUL}     {return new Symbol(sym.MUL,yyline,yycolumn,yytext());}
<YYINITIAL> {DIV}     {return new Symbol(sym.DIV,yyline,yycolumn,yytext());}
<YYINITIAL> {MODULO}     {return new Symbol(sym.MODULO,yyline,yycolumn,yytext());}
<YYINITIAL> {MEDIA}     {return new Symbol(sym.MEDIA,yyline,yycolumn,yytext());}
<YYINITIAL> {MEDIANA}     {return new Symbol(sym.MEDIANA,yyline,yycolumn,yytext());}
<YYINITIAL> {MOD}     {return new Symbol(sym.MOD,yyline,yycolumn,yytext());}
<YYINITIAL> {VARIANZA}     {return new Symbol(sym.VARIANZA,yyline,yycolumn,yytext());}
<YYINITIAL> {MAX}     {return new Symbol(sym.MAX,yyline,yycolumn,yytext());}
<YYINITIAL> {MIN}     {return new Symbol(sym.MIN,yyline,yycolumn,yytext());}
<YYINITIAL> {CONSOLE_PRINT}     {return new Symbol(sym.CONSOLE_PRINT,yyline,yycolumn,yytext());}
<YYINITIAL> {CONSOLE_COLUMN}     {return new Symbol(sym.CONSOLE_COLUMN,yyline,yycolumn,yytext());}
<YYINITIAL> {DOUBLE}     {return new Symbol(sym.DOUBLE,yyline,yycolumn,yytext());}
<YYINITIAL> {CHAR}     {return new Symbol(sym.CHAR,yyline,yycolumn,yytext());}
<YYINITIAL> [\"]            {yybegin(CADENA);cadena="";}
<YYINITIAL> {ID}     {return new Symbol(sym.ID,yyline,yycolumn,yytext());}


<CADENA>                    {
    [\"]    {String tmp=cadena; cadena=""; yybegin(YYINITIAL); return new Symbol(sym.CADENA, yycolumn,yyline,tmp);}
    [^\"]   {cadena+=yytext();}
}
