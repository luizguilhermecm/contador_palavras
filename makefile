.PHONY: lex.yy.c
.PHONY: a.out 

all: final
	$(RM) LIST_OF_WORDS
	$(RM) contador
	$(RM) a.out
	$(RM) lex.yy.c

final: contador
	./contador LIST_OF_WORDS > total_of_words.txt

contador: run
	g++ -o contador main.cpp
	
run: ./a.out
	./a.out < $(FILE) > LIST_OF_WORDS

a.out: lex.yy.c
	cc lex.yy.c 

lex.yy.c: lexico.l
	flex  lexico.l


