


/*ejjer1*/
SELECT *
FROM EMPLE P
WHERE SALARIO > (SELECT AVG(SALARIO)
                FROM EMPLE
                );
                
/*EJER2*/                
SELECT DEPT_NO, APELLIDO, SALARIO
FROM EMPLE P
WHERE SALARIO > (SELECT AVG(SALARIO)
                FROM EMPLE
                WHERE DEPT_NO= P.DEPT_NO);
                
                
/*EJER3*/

UPDATE EMPLE 
SET COMISION_PCT=20
WHERE UPPER(APELLIDO)='SANCHEZ';

/*EJER4*/
SELECT LOC
FROM EMPLE P
WHERE EXISTS (SELECT DEPT_NO
             FROM EMPLE
             AND EMPLE=P.EMPLE);
             
             
             
/*EJER5*/ 
SELECT APELLIDO
FROM EMPLE E
WHERE EXISTS (SELECT 'X'
             FROM EMPLE
             WHERE DEPT_NO = E.DEPT_NO 
             AND FECHA_ALTA > E.FECHA_ALTA
             AND SALARIO > E.SALARIO);

             
/*EJER6*/ 

             
             
             
             
             
             
             
             
