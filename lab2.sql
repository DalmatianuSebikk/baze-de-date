--- ------------------------------------ LABORATORUL 2 ----------------------------------------------


--1. Scrie?i o cerere care are urm?torul rezultat pentru fiecare angajat: 
--<prenume angajat> <nume angajat> castiga <salariu> lunar dar doreste <salariu de 3 ori  mai  mare>.  
--Etichetati  coloana  “Salariu  ideal”.  Pentru  concatenare,  utiliza?i  atât func?ia CONCATcât ?i operatorul “||

--SELECT CONCAT(employees.last_name, CONCAT(' ', employees.first_name)) || ' castiga ' || employees.salary || ' lunar dar doreste ' 
--|| 3*employees.salary "Salariu ideal"
--FROM employees


--2. Scrie?i o cerere prin care s? se afi?eze prenumele salariatului cu prima litera majuscul? ?i toate celelalte litere minuscule, 
--numele acestuia cu majuscule ?i lungimea numelui, pentru angaja?ii al c?ror nume 
--începe cu J sau M sau care au a treia liter? din nume A. 
--Rezultatul  va  fi  ordonat  descresc?tor  dup?  lungimea  numelui.  
--Se  vor  eticheta coloanele corespunz?tor. Se cer 2 solu?ii (cu operatorul LIKE ?i func?ia SUBSTR)


--SELECT INITCAP(employees.last_name) "Prenumele salariatului", UPPER(employees.first_name) "Numele", LENGTH(employees.first_name) "Lungimea numelui"
--FROM employees
--WHERE employees.first_name LIKE 'M%' 
--OR employees.first_name LIKE 'J%'
--OR SUBSTR(employees.first_name , 3, 3) = 'a'
--ORDER BY LENGTH(employees.first_name) DESC

--3. S? se afi?eze,pentru  angaja?ii  cu  prenumele  „Steven”,  codul ?i numele acestora, precum ?i codul departamentului 
--în care lucreaz?. C?utarea trebuie s? nu fie case-sensitive, 
--iar eventualele blank-uri care preced sau urmeaz? numelui trebuie ignorate.

--SELECT employee_id "cod",first_name "nume", department_id "Cod departament"
--FROM employees
--WHERE 'steven' IN LOWER(first_name)


--4. S? se afi?eze pentru to?i angaja?ii al c?ror nume se termin? cu litera 'e', codul, numele, 
--lungimea numelui ?i pozi?ia din nume 
--în care apare prima data litera 'a'. Utiliza?i alias-uri corespunz?toare pentru coloane. 

--SELECT employees.employee_id "cod", employees.first_name "cohones", LENGTH(employees.first_name) "lungime(cm)", INSTR(employees.first_name, 'a') "unde apare a"
--FROM employees
--WHERE employees.first_name LIKE '%e'


--5. S?  se  afi?eze  detalii  despre  salaria?ii  care  au  lucrat  un  num?r  întreg  de  s?pt?mâni pân? la data curent?. 

--SELECT *
--FROM employees
--WHERE MOD(ROUND(SYSDATE) - employees.hire_date, 7) = 0


--6. S? se afi?eze codul salariatului, numele, salariul, salariul m?rit cu 15%, exprimat cu dou?  zecimale  
--?i  num?rul  de  sute  al  salariului  nou  rotunjit la  2  zecimale.  
--Eticheta?i ultimele dou? coloane “Salariu nou”, respectiv “Numar sute”. 
--Se vor lua în considerare salaria?ii al c?ror salariu nu este divizibil cu 1000

--SELECT employee_id, last_name, salary, CAST(salary*1.15 as decimal(10,2))
--FROM employees

--SELECT employee_id, last_name, salary, to_char(TRUNC((salary + salary * NVL(commission_pct,0))*1.15, 2),'9999G999D99') "Salariu nou", Round(salary*1.15, 2) "Numar sute"
--FROM employees;


--7. S?  se  listeze  numele  ?i  data  angaj?rii  salaria?ilor  care  câ?tig?  comision.  
--S?  se eticheteze coloanele „Nume angajat”, „Data angajarii”. 
--Utiliza?i func?ia RPAD pentru  a determina ca data angaj?rii s? aib? lungimea de 20 de caractere.


--SELECT last_name "Nume angajat" , PAD(hire_date, 20) "Data angajarii"
--FROM employees
--WHERE commission_pct IS NOT NULL;

--8. S? se afi?eze data (numele lunii, ziua, anul, ora, minutul si secunda) de peste 30 zile.

--SELECT TO_CHAR(SYSDATE + 30, 'MON-DD-YYYY-HH24:MI:SS')
--FROM dual;

--9. S? se afi?eze num?rul de zile r?mase pân? la sfâr?itul anului
--SELECT ROUND(TO_DATE('31-DEC-2021') - SYSDATE)
--FROM DUAL

-- 10. a) S? se afi?eze data de peste 12 ore.
--SELECT SYSDATE + 0.5 FROM dual;
--     b) Să se afişeze data de peste 5 minute
--SELECT TO_CHAR(SYSDATE + 0.004,'MON-DD-YYYY-HH24:MI:SS') FROM dual;


--11. Să se afişeze numele şi prenumele angajatului (într-o singură coloană), data angajării şi  data  negocierii  salariului,  
--care  este  prima  zi  de  Luni  după 6  luni  de  serviciu. Etichetaţi această coloană “Negociere”

--SELECT first_name || ' ' || last_name, hire_date, NEXT_DAY(ADD_MONTHS(hire_date, 6), 'Monday') "Negociere"
--FROM employees

--12. Pentru fiecare angajat să se afişeze numele şi numărul de luni de la data angajării. 
--Etichetaţi  coloana  “Luni  lucrate”.  Să  se  ordoneze  rezultatul  după  numărul  de  luni lucrate. 
--Se va rotunji numărul de luni la celmai apropiat număr întreg.

--SELECT first_name, TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) "Luni lucrate"
--FROM employees
--ORDER BY "Luni lucrate"



--13. Să se afişeze numele, data angajării şi ziua săptămânii în care a început lucrul fiecare salariat. Etichetaţi coloana “Zi”. 
--Ordonaţi rezultatul după ziua săptămânii, începând cu Luni.


--SELECT last_name, TO_CHAR(hire_date, 'DAY') "Zi"
--FROM employees
--ORDER BY TO_CHAR(hire_date,'D');


--14. Să se afişeze numele angajaţilor şi comisionul. Dacă un angajat nu câştigă comision, să se scrie “Fara comision”. 
--Etichetaţi coloana “Comision”.

--SELECT last_name, NVL(TO_CHAR(commission_pct), 'Fara comision') as "Comision"
--FROM employees;


--15. Să  se  listeze  numele,  salariul  şi  comisionul  tuturor  angajaţilor  al  căror  venit  lunar 
--(salariu + valoare comision) depăşeşte 10000

--SELECT last_name, salary, commission_pct
--FROM employees
--WHERE salary + commission_pct > 10000

--16. Să se afişeze numele, codul job-ului, salariul şi o coloană care să arate salariul după mărire. 
--Se presupune că pentru IT_PROG are loc o mărire de 20%, pentru SA_REP creşterea este de 25%, iar pentru  
--SA_MANare loc o mărire de 35%. Pentru ceilalţi angajaţi nu se acordă mărire. Să se denumească coloana "Salariu renegociat"

--SELECT last_name, job_id, salary, 
--DECODE(
--job_id,
--'IT_PROG', salary*1.2,
--'SA_REP', salary*1.25,
--'SA_MAN', salary*1.35
--) "Salariu renegociat"
--FROM employees

-- VARIANTA CU CASE

--SELECT last_name, job_id, salary,
--    CASE job_id
--        WHEN 'IT_PROG' THEN salary*1.2
--        WHEN 'SA_REP' THEN salary*1.25
--        WHEN 'SA_MAN' THEN salary*1.35
--        ELSE salary
--        END "Salariul actualizat:", hire_date
--FROM employees;


--17. Să  se  afişeze  numele  salariatului,  codul  şi  numele  departamentului  pentru  toţi angajaţii.

--SELECT employees.last_name, employees.department_id, departments.department_name
--FROM employees, departments
--WHERE employees.department_id = departments.department_id
        

--19. S? se afi?eze numele angajatului, numele departamentului ?i ora?ulpentru to?i angaja?ii care câ?tig? comision.

--SELECT employees.last_name, departments.department_name, locations.city
--FROM employees, departments, locations
--WHERE employees.department_id = departments.department_id
--AND departments.location_id = locations.location_id


--20. S? se afi?eze numele salariatului ?i numele departamentului pentru to?i salaria?ii care au litera A inclus? în nume.

--SELECT employees.last_name, departments.department_name
--FROM employees, departments
--WHERE employees.last_name LIKE '%A%' AND employees.department_id = departments.department_id;

--21. S? se afi?eze numele, titlul job-ului?i denumirea departamentului pentru to?i angaja?ii care lucreaz? în Oxford.

--SELECT employees.last_name, jobs.job_title, departments.department_name
--FROM employees, jobs, departments, locations
--WHERE employees.job_id = jobs.job_id 
--AND employees.department_id = departments.department_id
--AND departments.location_id = locations.location_id
--AND locations.city LIKE 'Oxford';


--SELECT employees.last_name, employees.job_id, departments.department_name, d2.department_name
--FROM employees, departments, departments d2, job_history
--WHERE (employees.department_id = departments.department_id 
--AND departments.department_id = job_history.department_id) 
--AND employees.d2.department_id = ??

-- 22. S?  se  afi?eze  codul  angajatului  ?i  numele  acestuia,  împreun?  
--cu  numele  ?i  codul ?efului s?u direct. Se vor eticheta coloanele Ang#, Angajat, Mgr#, Manager

--SELECT employees.employee_id "Ang#", employees.last_name "Angajat", employees2.employee_id "Mgr#", employees2.last_name "Manager"
--FROM employees, employees employees2
--WHERE employees2.employee_id = employees.manager_id
