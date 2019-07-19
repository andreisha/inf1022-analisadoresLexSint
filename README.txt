# Analisadores Lexicos e Sintaticos

O Projeto consiste em usar o conjunto de ferramentas Flex/Bison (Lex/Yacc) para geraçao de compiladores com o objetivo de gerar codigo de uma linguagem imperativa (Provol-One) em Maquinas de Turing.

A gramatica usada é:
PROGRAM -> ENTRADA varlist SAIDA varlist cmds FIM
varlist -> id varlist | id
cmds -> cmd cmds | cmd
cmd -> FACA id VEZES cmds FIM
cmd -> ENQUANTO id FACA cmds FIM
cmd -> SE id ENTAO cmds SENAO cmds | SE id ENTAO cmds
cmd -> id = id | INC(id) | ZERA(id)

Todas as variaveis sao do tipo numero natural (inteiro nao-negativo).
O comando Inc(id) incrementa em um o conteudo da variavel id,
Zera(id) faz o conteudo da variavel id ser 0 (zero),
id = id copia o conteudo da variavel a direita na variavel da esquerda, ou seja é um comando de atribuiçao.
Os booleanos, usados nos comandos Enquanto e de desvio condicional (Se − Entao e Se − Entao − Senao), sao relacionados aos valores numéricos na forma: falso é 0 (zero) e verdadeiro é qualquer valor positivo.

O conteudo das pastas é:
* As pastas Exemplo1 e Exemplo2 com alguns exemplos de programa para aprender a usar Yacc/Lex

* Trabalho: conteudo do trabalho:
Para usar, executar ./build.sh e depois ./trabmain e no terminal inserir (copiar por exemplo) uma entrada. O resultado vai sair num output.
Se quiser ter um codigo gerado em C, execute da mesma forma os arquivos da pasta C.
A pasta Testes da alguns exemplos de entrada a inserir no terminal apos a execuçao.
