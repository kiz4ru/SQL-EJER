
/*ejer1*/
SELECT DEPT_NO
FROM EMPLE
    GROUP BY(dept_no)
    HAVING COUNT(*) > 4
    ORDER BY COUNT (EMP_NO)DESC;



/*EJER2*/
SELECT DEPT_NO, SUM(SALARIO)"SUMA", MAX(SALARIO), MIN(SALARIO)
FROM EMPLE
GROUP BY (DEPT_NO);


/*EJER3*/
SELECT DEPT_NO OFICIO COUNT(EMP_NO)
FROM EMPLE GROUP BY DEPT_NO, OFICIO
ORDER BY DEPT_NO DESC;


SELECT MAX(COUNT(*)), DEPT_NO
FROM EMPLE
GROUP BY DEPT_NO;


/*EJER5: 5. Mostrar los números de departamento y el 
salario medio para los departamentos 
cuyos salarios máximos sean mayores de 250000.*/

SELECT DEPT_NO, AVG(SALARIO) "SALARIO MEDIO"
FROM EMPLE
GROUP BY
    DEPT_NO
HAVING
    (MAX(SALARIO)) > 250000
ORDER BY 
    DEPT_NO;
    
/*EJER6*/
SELECT AVG(MAX(SALARIO)) "MASI-MEDIO"
FROM EMPLE
GROUP BY 
    DEPT_NO
;



SELECT E.COUNT(*), E.OFICIO
FROM EMPLE E, EMPLE F
WHERE E.OFICIO = F.OFICIO;




SELECT ID_JEFE, MIN(SALARIO)
FROM EMPLE
GROUP BY ID_JEFE
HAVING MIN(SALARIO) > 200000;





SELECT D.DEPT_NO, D.DNOMBRE, MAX(COUNT(E.EMP_NO))
FROM EMPLE E, DEPART D
WHERE 









 INSERT INTO EMPLE (EMP_NO,APELLIDO,SALARIO,DEPT_NO,OFICIO)
 VALUES(9999,'FERNANDEZ',1000,20,'OFICIO');
 
/*EJER1 */
SELECT APELLIDO
FROM EMPLE
WHERE UPPER(OFICIO) IN (SELECT DISTINCT OFICIO 
                       FROM EMPLE
                       WHERE UPPER(APELLIDO) = 'GIL'

                    
);



/*EJER2*/
SELECT E.*
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO = D.DEPT_NO --JOIN 
    AND UPPER(D.LOC) IN ('MADRID','BARCELONA');



/*EJER3*/
SELECT APELLIDO
FROM EMPLE
WHERE OFICIO IN()



/*EJER4*/
SELECT EMPLE.*
FROM EMPLE 
WHERE UPPER(OFICIO) IN (SELECT DISTINCT OFICIO 
                       FROM EMPLE
                       WHERE UPPER(APELLIDO) = 'JIMENEZ')
;
/*
7782	CEREZO	GERENTE	7839	19/06/81	3185		10
7698	NEGRO	GERENTE	7839	11/05/81	3705		30
7566	JIMENEZ	GERENTE	7839	12/04/81	3867		20
*/

SELECT APELLIDO, OFICIO, SALARIO, FECHA_ALTA
FROM EMPLE 
WHERE UPPER(OFICIO) ='GERENTE';

/*
APELLIDO   OFICIO             SALARIO FECHA_AL
---------- --------------- ---------- --------
JIMENEZ    GERENTE               3867 12/04/81
NEGRO      GERENTE               3705 11/05/81
CEREZO     GERENTE               3185 19/06/81
*/


/*Ejercicio 5*/
SELECT OFICIO,SALARIO
FROM EMPLE
WHERE UPPER(APELLIDO)='GIL';

/*
OFICIO             SALARIO
--------------- ----------
ANALISTA              3900
*/


SELECT APELLIDO, OFICIO, SALARIO
FROM EMPLE 
WHERE OFICIO='ANALISTA'
    AND SALARIO= 3900;
    
    /*
    APELLIDO   OFICIO             SALARIO
---------- --------------- ----------
GIL        ANALISTA              3900
FERNANDEZ  ANALISTA              3900
    */
    
    /*Ejercicio 6*/
SELECT OFICIO, AVG(MAX(SALARIO))
FROM EMPLE
GROUP BY OFICIO
;


/*Ejercicio 7*/
SELECT EMP_NO, APELLIDO
FROM EMPLE
WHERE SALARIO = (SELECT MIN(SALARIO)
				FROM EMPLE
				GROUP BY DEPT_NO
                ORDER BY DEPT_NO);

                
         /*Ejercicio 8*/   
SELECT APELLIDO, OFICIO
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO
			FROM EMPLE
			WHERE UPPER(APELLIDO)='PEREZ');
            
            
            


/*Ejercicio 9*/

SELECT APELLIDO
FROM EMPLE
WHERE EMP_NO <> ALL (
    SELECT ID_JEFE FROM EMPLE
);

/*Ejercicio 10*/

SELECT APELLIDO
FROM EMPLE
WHERE EMP_NO IN (SELECT ID_JEFE FROM EMPLE);




/*11
 Escribir una consulta para mostrar los códigos de empleado y los 
apellidos de todos los empleados que trabajen en un departamento 
con cualquier empleado cuyo apellido contenga una 'U'.
*/
SELECT EMP_NO, APELLIDO
FROM EMPLE
WHERE DEPT_NO IN (SELECT DEPT_NO
                  FROM EMPLE
                  WHERE UPPER(APELLIDO) LIKE '%U%'
);







/*Ejercicio 12
 Modificar la consulta anterior para mostrar los códigos de empleado y 
los apellidos de todos los empleados 
que ganan más del salario medio y que trabajen en 
un departamento con un empleado que tenga una 'U' en su apellido.
*/

SELECT EMP_NO, APELLIDO
FROM EMPLE
WHERE DEPT_NO IN (SELECT DEPT_NO
                 FROM EMPLE
                 WHERE UPPER(APELLIDO) LIKE '%U%')
            AND
                SALARIO > (SELECT AVG(SALARIO) 
                FROM EMPLE
);




/*Ejercicio 13
Escribir una consulta para mostrar el apellido, número de departamento y el 
salario de cualquier empleado cuyo número de departamento  
y salario coincidan con el número de departamento 
y salario de cualquier empleado que ganen comisión.
*/

SELECT DEPT_NO, APELLIDO, SALARIO
FROM EMPLE 
WHERE DEPT_NO = ANY (SELECT DEPT_NO 
                FROM EMPLE 
                WHERE COMISION_PCT > 0)
            AND 
              SALARIO = ANY (SELECT SALARIO 
                FROM EMPLE
                WHERE COMISION_PCT > 0
);






/*Ejercicio 14
Escribir una consulta para encontrar todos los empleados que ganan más que el 
salario medio de sus departamentos. Mostrar el apellido, 
el salario y el código del departamento .
*/

SELECT DEPT_NO, APELLIDO, SALARIO
FROM EMPLE E
WHERE SALARIO > ANY (SELECT AVG(SALARIO) 
                FROM EMPLE 
                WHERE DEPT_NO = E.DEPT_NO 
                GROUP BY DEPT_NO
);



/*Ejercicio 15
 Modificar el ejercicio anterior para visualizar el apellido, el salario, 
el código del departamento y el salario medio de 
los sueldos de ese departamento. Ordenar por salario medio.
*/

SELECT E.APELLIDO, E.SALARIO, I.DEPT_NO, AVG(I.SALARIO)
FROM EMPLE E, EMPLE I
WHERE E.DEPT_NO = I.DEPT_NO --JOIN
    AND
        E.SALARIO > ANY(SELECT AVG(SALARIO) 
                FROM EMPLE
                WHERE DEPT_NO = E.DEPT_NO 
                GROUP BY DEPT_NO)
                GROUP BY E.APELLIDO, E.SALARIO, I.DEPT_NO
;


















INSERT INTO EMPLE 
VALUES (1111,'GUTIERREZ','AUXILIAR',7839,)




