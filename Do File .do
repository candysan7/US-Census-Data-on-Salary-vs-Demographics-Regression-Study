
clear
cls

use "C:\Users\schoo\OneDrive\Desktop\USC\USC Fall 2020\ECON 318 Econometrics\ECON 318 PROJECT\ECON PROJECT.DTA"

*gen female = 1 if a_sex == 2
*replace female = 0 if a_sex == 1 

*gen age_square = age^2 

*rename pemlr employed
*rename a_wkstat fulltime
*rename a_age age
*rename a_sex male
*rename wsal_val salary 

*gen race = 1 if prdtrace ==1 
*replace race = 2 if prdtrace ==2 
*replace race = 3 if prdtrace ==3 
*replace race = 4 if prdtrace ==4 
*replace race = 5 if prdtrace >=5 
 
*tab race, gen(m)
*rename m1 white 
*rename m2 black
*rename m3 american_indian 
*rename m4 asian 
*rename m5 other_race (base)

*gen educ = 1 if a_hga <=39 
*replace educ =2 if a_hga >=40 <=42
*replace educ =3 if a_hga == 43
*replace educ = 4 if a_hga == 44   

*tab educ, gen(m)
*rename m1 high_school
*rename m2 some_college
*rename m3 bachelor
*rename m4 graduate

*gen logsalary = log(salary)

*gen female = 1 if a_sex == 2
*replace female = 0 if a_sex == 1

*gen male = 1 if a_sex == 1
*replace male = 0 if a_sex == 2

*rename wsal_yn receive_wage

*gen married =1 if a_maritl <=2
*replace married =1 if a_maritl >2

*rename mig_reg region 
*tab region, gen(m)
*rename m1 no_data
*rename m2 northeast
*rename m3 midwest
*rename m4 south
*rename m5 west
*rename m6 abroad


sum logsalary age age_square male white black american_indian asian bachelor graduate northeast midwest south west if employed == 1 & fulltime==2 & receive_wage==1

reg logsalary age age_square i.male i.white i.black i.american_indian i.asian i.bachelor i.graduate i.male#i.graduate  i.northeast i.midwest i.south i.west if employed == 1 & fulltime==2 & receive_wage==1, robust 

test age=age_square=1.male=1.white=1.black=1.american_indian=1.asian=1.bachelor=1.graduate=1.male#1.graduate=1.northeast=1.midwest=1.south=1.west

reg logsalary age if employed == 1 & fulltime==2 & receive_wage==1, robust 

tab prcitshp if employed == 1 & fulltime==2 & receive_wage==1

