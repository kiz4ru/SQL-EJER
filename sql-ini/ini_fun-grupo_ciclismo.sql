/* IÑIGO */
set linesize 1000
set pagesize 3000
/* Ejercicio 
Enunciado: FUNCIONES_GRUPO_CICLISTAS03
*/

SELECT COUNT(DORSAL)
FROM CICLISTAS;
/*
COUNT(DORSAL)
-------------
           14
*/

SELECT DISTINCT CODEQUIPO 
FROM CICLISTAS;
/*
CODE
----
0001
0006
0005
0002
0004
0003

6 filas seleccionadas.
*/

SELECT COUNT(*)
FROM EQUIPOS;
/*

  COUNT(*)
----------
         7
*/
SELECT COUNT (DISTINCT CODEQUIPO) 
EQUIPOS FROM CICLISTAS;



/*
EJER2
*/

SELECT CODEQUIPO "21-EQUIPO", COUNT(*)AS "21-CANT"
FROM EQUIPOS GROUP BY CODEQUIPO;
/*
21-E 21-CANT
---- -----------
0001           1
0002           1
0003           1
0004           1
0005           1
0006           1
0007           1

7 filas seleccionadas.
*/

/*
EJER3
*/

SELECT SUM(NUMKMS) AS "TOTAL KMS"  FROM 
ETAPAS;
/*
TOTAL KMS
----------
      1385
*/



/*
EJER4
*/

SELECT TIPO "21-TIPO MEDIA", AVG(NUMKMS) AS "21-MEDIA KMS"
FROM ETAPAS GROUP BY TIPO;

/*
21-TIPO MEDIA                      21-MEDIA KMS
------------------------------ ----------
Alta Montaña                          181
Contrarreloj                           29
Media Montaña                         203
Llana                          193,666667
*/


/*
EJEJR5
*/

SELECT SUM(NUMKMS) AS "21-KMS"
FROM ETAPAS
WHERE INITCAP(TIPO) LIKE '%Montaña%';
/*
 21-KMS
----------
       746
*/


/*
ejer6
*/

SELECT TIPO "21-TIPO MEDIA", AVG(NUMKMS) AS "21-MEDIA KMS"
FROM ETAPAS GROUP BY TIPO
HAVING AVG(NUMKMS)<150
;
/*
21-TIPO MEDIA                  21-MEDIA KMS
------------------------------ ------------
Contrarreloj                             29
*/

/*
funcion de grupo ejer 3_1
*/

SELECT AVG(SALARIO),
       MAX(SALARIO), 
       MIN(SALARIO), 
       SUM(SALARIO)
FROM EMPLE WHERE lower(OFICIO)='COMERCIAL';



SELECT MIN(FECHA_alta) max(fecha_alta)




SELECT MIN(APELLIDO), MAX(APELLIDO) 
FROM EMPLE






SELECT COUNT(*) 
FROM EMPLE 
WHERE dept_no=40;



SELECT count(*) 
FROM EMPLE WHERE dept_no=30;

/*
COUNT(*)
----------
         6
SELECT count(comision_pct) 
FROM EMPLE WHERE dept_no=30;

COUNT(COMISION_PCT)
-------------------
                  4
*/

SELECT COUNT(DISTINCT DEPT_NO) FROM
EMPLE;


SELECT DEPT_NO,COUNT(*)
FROM EMPLE
GROUP BY DEPT_NO;

SELECT DEPT_NO COUNT(EMP_NO) 
FROM EMPLE GROUP BY DEPT_NO
HAVING COUNT(EMP_NO)>4;




