PALAVRA_RESERVADA "void" | "main"
TIPO "int" | "bool"
COMANDO "skip" | ":=" | "if" | "while" | "do" | "return"
BOOLEXP "true" | "false" | "not" | "leq" | and | "or"
OPA "+" | "-"
OPM "*" | "/"
ABRE_PARENTESES "("
FECHA_PARENTESES ")"
ABRE_CHAVES "{"
FECHA_CHAVES "}"
PONTO_VIRGULA ";"
VIRGULA ","

FACAO_OPCIONAL ("."{DIGITO})?
EXPOENTE_OPCIONAL ("E"("+"|"-")?{DIGITO})?

TOKEN_ID {LETRA}({LETRA}|{DIGITOS})*"_"*
TOKEN_NUM_LITERAL {DIGITOS}{FACAO_OPCIONAL}{EXPOENTE_OPCIONAL}

DIGITO	[0-9]
LETRA	[a-zA-Z]
ID	{LETRA}({LETRA}|{DIGITO})*
%%
{DIGITO}+		{printf("Inteiro: %s\n",yytext);}
{DIGITO}+"."{DIGITO}+	{printf("Real: %s\n",yytext);}
{ID}			{printf("var: %s\n",yytext);}
{PALAVRA_RESERVADA}   {printf("Palavra Reservada: %s"\n, yytext);}
{TIPO}    {printf("Tipo: %s"\n, yytext);}
{COMANDO}   {printf("Comando: %s"\n, yytext);}
{BOOLEXP}   {printf("Expressao Booleana: %s"\n, yytext);}
{OPA}       {printf("OPA: %s"\n, yytext);}
{OPM}       {printf("OPM": %s"\n, yytext);}
{ABRE_PARENTESES}    {printf("Abre Parenteses": %s"\n, yytext);}
{FECHA_PARENTESES}    {printf("Fecha Parenteses": %s"\n, yytext);}
{ABRE_CHAVES}         {printf("Abre Chaves": %s"\n, yytext);}
{FECHA_CHAVES}        {printf("Fecha Chaves": %s"\n, yytext);}
{PONTO_VIRGULA}       {printf("Ponto e Virgula": %s"\n, yytext);}
{VIRGULA}             {printf("Virgula": %s"\n, yytext);}
{FACAO_OPCIONAL}      {printf("FACAO_OPCIONAL": %s"\n, yytext);}
{EXPOENTE_OPCIONAL}   {printf("EXPOENTE_OPCIONAL": %s"\n, yytext);}
{TOKEN_ID}            {printf("TOKEN_ID": %s"\n, yytext);}
{TOKEN_NUM_LITERAL}   {printf("TOKEN_NUM_LITERAL": %s"\n, yytext);}
%%
int yywrap();

main(){
  yylex();
}

int yywrap(){
 return 1;
}
