
.SUFFIXES:
.PHONY: exeall
.PRECIOUS: %.out

pruebas:
	gcc pruebas.c -o pruebas.out
	./pruebas.out

count: count.out
	./$< a.txt
correo: correo.out
	./$< correo.txt

url_correo: corre_url.out
	./$< corre_url.txt

nif_fechas_telefonos: nif_fechas_telefonos.out
	./$< nif.txt

comentario: comentario.out
	./$< barberia.cpp

translate: translate.out
	./$< fbd.txt

%.out: %.l
	flex $<
	gcc lex.yy.c -o $@ -lfl



#$(compilador) -std=c++11 -pthread -o $@ $< Semaphore.cpp



clean:
	rm -f *.out *.yy.c *~
