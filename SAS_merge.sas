PROC IMPORT DATAFILE = "D:\SAS_DATA\Bonds\AAA.xls" OUT = AAA_origin DBMS = Excel REPLACE;
run;
PROC IMPORT DATAFILE = "D:\SAS_DATA\Bonds\AA1.xls" OUT = AA1_origin DBMS = Excel REPLACE;
run;
PROC IMPORT DATAFILE = "D:\SAS_DATA\Bonds\AA.xls" OUT = AA_origin DBMS = Excel REPLACE;
run;
PROC IMPORT DATAFILE = "D:\SAS_DATA\Bonds\CJDL.xls" OUT = CJDL_origin DBMS = Excel REPLACE;
run;
PROC IMPORT DATAFILE = "D:\SAS_DATA\Bonds\INDEX.xls" OUT = INDEX_origin DBMS = Excel REPLACE;
run;

data INDEX;
set INDEX_origin;
run;

proc sort data = INDEX;
by date;
run;


data CJDL;
set CJDL_origin;
run;

proc sort data = CJDL;
by date;
run;


data AAA;
set AAA_origin;
run;

proc sort data = AAA;
by date;
run;

data AA1;
set AA1_origin;
run;

proc sort data = AA1;
by date;
run;

data AA;
set AA_origin;
run;

proc sort data = AA;
by date;
run;

data merged;
merge AAA(IN=A) AA1(IN=B) AA(IN=C) CJDL(IN=D) INDEX(IN=E);
BY DATE;
IF A and B and c and d AND E;
run;
