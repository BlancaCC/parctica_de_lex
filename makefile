
.SUFFIXES:
.PHONY: exeall
.PRECIOUS: %.out
compilador:=g++


# count.out:  count.l
# 	flex count.l
# 	gcc lex.yy.c -o $@ -lfl
# 	./$@  a.txt




count: count.out
	./$< a.txt

correo: correo.out
	./$< correo.txt

url_correo: corre_url.out
	./$< corre_url.txt


%.out: %.l
	flex $<
	gcc lex.yy.c -o $@ -lfl


#$(compilador) -std=c++11 -pthread -o $@ $< Semaphore.cpp



clean:
	rm -f *.out *.yy.c *~
