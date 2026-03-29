lexer grammar LALexer;

/* * Regras de ignorados (Skip)
 * Espaços e quebras de linha são ignorados na análise léxica.
 * Comentários em LA são delimitados por chaves { } e também são ignorados.
 */
WS : [ \t\n\r]+ -> skip ;
COMENTARIO : '{' ~'}'* '}' -> skip ;

/* * Palavras-chave da linguagem LA 
 */
ALGORITMO : 'algoritmo' ;
FIM_ALGORITMO : 'fim_algoritmo' ;
DECLARE : 'declare' ;
CONSTANTE : 'constante' ;
TIPO : 'tipo' ;
REGISTRO : 'registro' ;
FIM_REGISTRO : 'fim_registro' ;
LITERAL_KW : 'literal' ;
INTEIRO_KW : 'inteiro' ;
REAL_KW : 'real' ;
LOGICO_KW : 'logico' ;
PROCEDIMENTO : 'procedimento' ;
FIM_PROCEDIMENTO : 'fim_procedimento' ;
FUNCAO : 'funcao' ;
FIM_FUNCAO : 'fim_funcao' ;
LEIA : 'leia' ;
ESCREVA : 'escreva' ;
SE : 'se' ;
ENTAO : 'entao' ;
SENAO : 'senao' ;
FIM_SE : 'fim_se' ;
CASO : 'caso' ;
SEJA : 'seja' ;
FIM_CASO : 'fim_caso' ;
PARA : 'para' ;
ATE : 'ate' ;
FACA : 'faca' ;
FIM_PARA : 'fim_para' ;
ENQUANTO : 'enquanto' ;
FIM_ENQUANTO : 'fim_enquanto' ;
RETORNE : 'retorne' ;
VERDADEIRO : 'verdadeiro' ;
FALSO : 'falso' ;
NAO : 'nao' ;
E : 'e' ;
OU : 'ou' ;
VAR : 'var' ;

/* * Símbolos e Operadores
 * Operadores aritméticos, lógicos, relacionais e delimitadores estruturais.
 */
PONTO_VIRGULA : ';' ;
VIRGULA : ',' ;
DOIS_PONTOS : ':' ;
ATRIBUICAO : '<-' ;
PONTO_PONTO : '..' ;
PONTO : '.' ;
ABRE_PAR : '(' ;
FECHA_PAR : ')' ;
ABRE_COL : '[' ;
FECHA_COL : ']' ;
CIRCUNFLEXO : '^' ;
MAIS : '+' ;
MENOS : '-' ;
VEZES : '*' ;
DIVISAO : '/' ;
IGUAL : '=' ;
MENOR_IGUAL : '<=' ;
MAIOR_IGUAL : '>=' ;
MENOR : '<' ;
MAIOR : '>' ;
DIFERENTE : '<>' ;
PORCENTAGEM : '%' ;
ENDERECO : '&' ;

/* * Tipos Complexos (Tokens Dinâmicos)
 * - IDENT: Inicia com letra/underscore, seguido de letras/números/underscores.
 * - NUM_INT: Sequência de dígitos.
 * - NUM_REAL: Dígitos separados por ponto decimal.
 * - CADEIA: Texto envolto em aspas duplas, não pode conter quebra de linha.
 */
IDENT : [a-zA-Z_] [a-zA-Z0-9_]* ;
NUM_INT : [0-9]+ ;
NUM_REAL : [0-9]+ '.' [0-9]+ ;
CADEIA : '"' ~['"\r\n]* '"' ;

/* * Tratamento de Erros Léxicos
 */
ERRO_COMENTARIO_NAO_FECHADO : '{' ~'}'* ;
ERRO_CADEIA_NAO_FECHADA : '"' ~['"\r\n]* ;
ERRO_SIMBOLO : . ;