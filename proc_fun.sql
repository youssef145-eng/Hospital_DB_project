 Calculate number of rows in table doctor 

  create or replace procedure p2(doctor_id) 
 is 
 n_count number ;
 begin 
 select count (*) into n_count from Doctor where doctorId = doctor_id;
 dbms_output.put_line(n_count);
 end p2;
 exec p(2);
insert values to nurse table 
create or replace procedure nurse_insert
 (
 nur_id Nurse.NurseID%type,
 f_name Nurse.FirstName%type,
 l_name Nurse.LastName%type,
 c_num Nurse.ContactNumber%type,
 dept Nurse.Department%type,
 dept_id Nurse.DepartmentID%type
 )
is 
begin 
insert into Nurse (NurseID,FirstName,LastName,ContactNumber,Department,DepartmentID) 
values (nur_id , f_name,l_name,c_num,dept,dept_id);
commit;
dbms_output.put_line('the concat number  '||c_num||'that inserted');
end;
exec nurse_insert(8 , 'mona','ahmed',024536650,'surgery room',303);



select columns 

create or replace procedure appointment (appoint_id number  )
is 
details number ;
date_app date ;
begin 
select  DoctorID , PatientID into details from Appointment where AppointmentID=appoint_id;
select AppointmentDate into date_app from Appointment where  AppointmentID=appoint_id;
dbms_output.put_line('doctor id  and patient id is  '||details);
dbms_output.put_line('the date is  '||date_app);
end;
exec appointment;

-- functions

set serveroutput on;
create or replace function patientinfo (Patient_ID number )
  return varchar2
  is 
  info varchar2 ;
  begin 
  select firstName , lastName , Gender into info
from patient 
  where PatientID=paient_id;
  return info ;
  end patientinfo ;

  declare 
  information varchar2;
  begin
  information :=patientinfo(patient_id);
  dbms_output.put_line(information);
  end;
  


create or replace function test_info(doctor_id number )
  return varchar2
  is 
  details varchar2;
  begin 
  select result , TestType , testDate into details  from test 
  where DoctorID=doctor_id ;
  return details;
  end test_info;

  declare 
  informaion_test varchar2 
  begin 
  information_test:=test_info(doctor_id);
  dbma_output.put_line(information_test);
  end;


create or replace function doctorcontact (doctor_id number )
  return varchar2 
  is 
  special varchar2;
  begin 
  select ContactNumber ,Specialization into special from Doctor where DoctorID=doctor_id;
  return special;
  end doctorcontact ;

  declare 
  s varchar2;
  begin 
  s:=doctorcontact(doctor_id);
  dbma_output.put_line(s);
  end;
