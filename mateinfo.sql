-- 3.S? se listeze structura tabelelor din schema HR (EMPLOYEES, DEPARTMENTS,
--JOBS, JOB_HISTORY, LOCATIONS, COUNTRIES, REGIONS), observând tipurile de
--date ale coloanelor

--DESCRIBE EMPLOYEES;


--4. S? se listeze con?inutul tabelelor din schema considerat?, afi?ând valorile tuturor
--câmpurilor

--SELECT * FROM DEPARTMENTS; si asa faci la toate


--5. S? se afi?eze codul angajatului, numele, codul job-ului, data angajarii. Ce fel de
--opera?ie este aceasta (selec?ie sau proiec?ie)

--SELECT employee_id, job_id, hire_date FROM employees; 
-- E O PROIECTIE PENTRU CA TU ITI ALEGI DOAR NISTE COLOANE, IN CAZUL ASTA employee_id, job_id, hire_date sunt proiectii


--6. Modifica?i cererea anterioar? astfel încât, la rulare, capetele coloanelor s? aib? numele
--cod, nume, cod job, data angajarii

--SELECT employee_id "cod", last_name "nume", job_id "cod job", hire_date "data angajarii" 
--FROM employees;


--7. S? se listeze, cu ?i f?r? duplicate, codurile job-urilor din tabelul EMPLOYEES.

--SELECT DISTINCT job_id 
--FROM employees;

--SELECT job_id 
--FROM employees;

-- 8. S? se afi?eze numele concatenat cu job_id-ul, separate prin virgula ?i spatiu. Eticheta?i
--coloana “Angajat si titlu”

--SELECT last_name || ', ' || job_id "Angajat si titlu"
--FROM employees;

--9. Crea?i o cerere prin care s? se afi?eze toate datele din tabelul EMPLOYEES pe o
--singur? coloan?. Separa?i fiecare coloan? printr-o virgul?. Etichetati coloana ”Informatii
--complete”

--SELECT
--    employee_id || ', ' ||
--    first_name || ', ' ||
--    last_name || ', ' ||
--    email || ', ' ||
--    phone_number || ', ' ||
--    hire_date || ', ' ||
--    job_id || ', ' ||
--    salary || ', ' ||
--    commission_pct || ', ' ||
--    manager_id || ', ' ||
--    department_id "Informatii complete"
--FROM employees;


--10. S? se listeze numele si salariul angaja?ilor care câ?tig? mai mult de 2850

--SELECT last_name, salary FROM employees WHERE salary > 2850;


--11. S? se creeze o cerere pentru a afi?a numele angajatului ?i codul departamentului
--pentru angajatul având codul 104

--SELECT last_name, department_id FROM employees WHERE employee_id = 104;


--12. S? se afi?eze numele ?i salariul angaja?ilor al c?ror salariu nu se afl? în intervalul
--[1500, 2850]

--SELECT last_name, salary FROM employees WHERE salary < 1500 OR salary > 2850; varianta 1
--SELECT last_name, salary FROM employees WHERE salary NOT BETWEEN 1500 and 2850; varianta 2


--13. S? se afi?eze numele, job-ul ?i data la care au început lucrul salaria?ii angaja?i între 20
--Februarie 1987 ?i 1 Mai 1989. Rezultatul va fi ordonat cresc?tor dup? data de început

--SELECT last_name, job_id, hire_date
--FROM employees
--WHERE hire_date BETWEEN '20-FEB-1987' AND '1-MAY-1989'
--ORDER BY hire_date

--14. S? se afi?eze numele salaria?ilor ?i codul departamentelor pentru toti angaja?ii din
--departamentele 10, 30 ?i 50 în ordine alfabetic? a numelor

--SELECT last_name, department_id 
--FROM employees
--WHERE department_id IN (10, 30, 50)
--ORDER BY last_name

--15. S? se listeze numele ?i salariile angaja?ilor care câ?tig? mai mult decât 1500 ?i
--lucreaz? în departamentul 10, 30 sau 50. Se vor eticheta coloanele drept Angajat si
--Salariu lunar

--SELECT last_name || ', ' || salary " Angajat si Salariu lunar"
--FROM employees
--WHERE salary > 1500 AND department_id IN (10, 30, 50)


--Care este data curent?? Afi?a?i diferite formate ale acesteia

--SELECT TO_CHAR(SYSDATE, 'DDD')
--FROM dual;


--16. S? se afi?eze numele ?i data angaj?rii pentru fiecare salariat care a fost angajat în
--1987. Se cer 2 solu?ii: una în care se lucreaz? cu formatul implicit al datei ?i alta prin
--care se formateaz? data.

--SELECT last_name, hire_date
--FROM employees
--WHERE hire_date LIKE('%99%')

--SELECT last_name, hire_date
--FROM employees
--WHERE TO_CHAR(hire_date, 'YYYY') = '1987' nu ai neaparata nevoie de ghilimici
--WHERE EXTRACT(YEAR from hire_date)=1987;

-- 18. S? se afi?eze numele, prenumele ?i data angaj?rii persoanelor care au început
--activitatea într-o zi a lunii egal? cu cea a datei curente

--SELECT first_name, last_name, hire_date
--FROM employees
--WHERE EXTRACT(DAY FROM hire_date) = EXTRACT(DAY FROM SYSDATE)

--19. S? se afi?eze numele ?i job-ul pentru to?i angaja?ii care nu au manager.

--SELECT last_name, job_id 
--FROM employees
--WHERE manager_id IS NULL

--20. S? se afi?eze numele, salariul ?i comisionul pentru toti salaria?ii care câ?tig? comision
--(se presupune c? aceasta înseamn? prezen?a unei valori nenule în coloana
--respectiv?). S? se sorteze datele în ordine descresc?toare a salariilor ?i comisioanelor

--SELECT last_name, salary, commission_pct 
--FROM employees
--WHERE commission_pct IS NOT NULL
--ORDER BY salary, commission_pct DESC

--21. Elimina?i clauza WHERE din cererea anterioar?. Unde sunt plasate valorile NULL în
--ordinea descresc?toare?

--SELECT last_name, salary, commission_pct 
--FROM employees
--ORDER BY salary, commission_pct DESC cam dubios ca pui null la inceput n-am sa mint

--22. S? se listeze numele tuturor angaja?ilor care au a treia liter? din nume ‘A

--SELECT first_name 
--FROM employees
--WHERE first_name LIKE '__A%'

--23. S? se listeze numele tuturor angajatilor care au 2 litere ‘L’ in nume ?i lucreaz? în
--departamentul 30 sau managerul lor este 102.

--SELECT last_name
--FROM employees
--WHERE (LENGTH(last_name) - LENGTH(REPLACE(last_name, 'L', '')) = 2 AND department_id = 30 ) OR manager_id = 102
-- WHERE (last_name LIKE '%e%e%' AND department_id = 30 ) OR manager_id = 102 alta varianta!!!

--24. S? se afiseze numele, job-ul si salariul pentru toti salariatii al caror job con?ine ?irul
--“CLERK” sau “REP” ?i salariul nu este egal cu 1000, 2000 sau 3000. (operatorul NOT
--IN)

--SELECT last_name, job_id, salary
--FROM employees
--WHERE (job_id LIKE '%CLERK%' OR job_id LIKE '%REP%') AND salary NOT in (1000, 2000, 3000)

-- 25. S? se afi?eze numele departamentelor care nu au manager. 
SELECT department_name
FROM departments
WHERE manager_id IS NULL



