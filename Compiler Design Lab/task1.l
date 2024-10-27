%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

int cal(int l, int r, char op) {
    return (op == '+') ? l + r : 0;
}

bool com(int l, int r, const char* op) {
    if (op[0] == '>' && op[1] == '\0') return l > r;
    if (op[0] == '=' && op[1] == '=' && op[2] == '\0') return l == r;
    return false;
}

int power(int base, int exp) {
    int result = 1;
    for (int i = 0; i < exp; i++) result *= base;
    return result;
}
%}

%option noyywrap
DIGIT    [0-9]+
WS       [ \t]*

%%

{DIGIT}{WS}"+"{WS}{DIGIT}    {
                     // Find the position of '+' in yytext
                     char* operator_pos = strchr(yytext, '+');
                     
                     // Split yytext around '+'
                     char left_operand[operator_pos - yytext + 1];
                     strncpy(left_operand, yytext, operator_pos - yytext);
                     left_operand[operator_pos - yytext] = '\0';

                     int l = atoi(left_operand);
                     int r = atoi(operator_pos + 1);
                     printf("%d\n", cal(l, r, '+'));
                   }

{DIGIT}{WS}">"{WS}{DIGIT}     {
                     char* operator_pos = strchr(yytext, '>');
                     
                     char left_operand[operator_pos - yytext + 1];
                     strncpy(left_operand, yytext, operator_pos - yytext);
                     left_operand[operator_pos - yytext] = '\0';

                     int l = atoi(left_operand);
                     int r = atoi(operator_pos + 1);
                     printf("%s\n", com(l, r, ">") ? "True" : "False");
                   }

{DIGIT}{WS}"=="{WS}{DIGIT}    {
                     char* operator_pos = strstr(yytext, "==");
                     
                     char left_operand[operator_pos - yytext + 1];
                     strncpy(left_operand, yytext, operator_pos - yytext);
                     left_operand[operator_pos - yytext] = '\0';

                     int l = atoi(left_operand);
                     int r = atoi(operator_pos + 2);
                     printf("%s\n", com(l, r, "==") ? "True" : "False");
                   }

{DIGIT}{WS}"**"{WS}{DIGIT}    {
                     char* operator_pos = strstr(yytext, "**");
                     
                     char left_operand[operator_pos - yytext + 1];
                     strncpy(left_operand, yytext, operator_pos - yytext);
                     left_operand[operator_pos - yytext] = '\0';

                     int base = atoi(left_operand);
                     int exp = atoi(operator_pos + 2);
                     printf("%d\n", power(base, exp));
                   }

\n                   ;    // Ignore new lines
[ \t]+               ;    // Ignore whitespace

%%

int main() {
    FILE *file = fopen("ip.txt", "r");
    if (!file) {
        fprintf(stderr, "Error opening file 'ip.txt'\n");
        return 1;
    }
    yyin = file;
    yylex();
    fclose(file);
    return 0;
}
