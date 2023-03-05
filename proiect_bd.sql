create table caini(
dog_id number(4),
name varchar(20) constraint null_nume not null,
sex varchar(20) constraint null_sex not null,
age number(4) constraint null_age not null,
join_date date default sysdate,
location_id number(4) constraint null_loc not null,
rasa varchar(20) constraint null_rasa not null,
constraint pk_caini primary key (dog_id)
);



create table angajati(
ang_id number(4),
last_name varchar(20) constraint null_last_name not null,
first_name varchar(20) constraint null_first_name not null,
email varchar(50),
phone_number varchar(20),
hire_date date default sysdate,
job_id number(4),
dep_id number(4),
salary number(4) constraint null_sal not null,
location_id number(4),
boss_id number(4),
constraint pk_ang primary key (ang_id)
);


create table departamente(
dep_id number(4),
dep_name varchar(20) constraint null_dep_name not null,
manager_id number(4) constraint null_location_id not null,
found_date date default sysdate constraint null_found not null,
constraint pk_dep primary key (dep_id)
);

     
create table locatii(
location_id number(4),
street_name varchar(20),
city varchar(20),
phone_number varchar(20),
email varchar(50),
manager_id number(4),
constraint pk_loaction primary key (location_id)
);

    
create table jobs(
job_id number(4),
job_title varchar(20) constraint null_job not null,
min_salary number(4) constraint null_min not null,
max_salary number(4),
constraint pk_job primary key (job_id)
);



create table produse(
group_id number(4),
prods_name varchar(20),
pret number(4),
nr_stoc number(4) constraint null_nr not null,
brand_name varchar(20),
constraint pk_group primary key (group_id)
);


create table produs(
prod_id number(4),
group_id number(4),
location_id number(4),
fab_date date default sysdate constraint null_fab not null,
exp_date date default sysdate,
color varchar(20),
constraint pk_prod primary key (prod_id)
);

create table clienti(
cl_id number(4),
last_name varchar(20),
first_name varchar(20),
phone_number varchar(20),
birth_date date default sysdate,
location_id number(4),
constraint pk_client primary key (cl_id)
);

create table tranzactii(
tr_id number(4),
cl_id number(4),
ang_id number(4),
location_id number(4),
group_id number(4),
purchase_date date default sysdate,
quantity number(4),
constraint pk_tranz primary key (tr_id)
);


create table adoptii (
ad_id number(4),
cl_id number(4),
dog_id number(4),
dog_name varchar(20),
ang_id number(4),
location_id number(4),
adoption_date date default sysdate,
constraint pk_adoption primary key (ad_id)
);


--STERGE TOATE FOREIGN KEYURILE!!!!!!!!!
--FOREIGN KEY MANAGER ID DE LA LOCATII!!!!!!!

alter table caini
add constraint fk_caini_loc_id foreign key (location_id) references locatii(location_id);


alter table angajati
add constraint fk_ang_loc_id foreign key (location_id) references locatii (location_id);
alter table locatii
add constraint fk_loc_man_id foreign key (manager_id) references angajati (ang_id);
alter table angajati
add constraint fk_ang_job_id foreign key (job_id) references jobs (job_id);
alter table angajati
add constraint fk_ang_dep_id foreign key (dep_id) references departamente (dep_id);

alter table departamente
add constraint fk_dep_man_id foreign key (manager_id) references angajati (ang_id);

alter table produse
add constraint fk_prods_prod_id foreign key (prod_id) references produs (prod_id);
alter table produs
add constraint fk_prod_group_id foreign key (group_id) references produse (group_id);
alter table produs
add constraint fk_prod_location_id foreign key (location_id) references locatii (location_id);
alter table clienti
add constraint fk_cl_location_id foreign key (location_id) references locatii (location_id);
alter table tranzactii
add constraint fk_tranz_cl_id foreign key (cl_id) references clienti (cl_id);
alter table tranzactii
add constraint fk_tranz_ang_id foreign key (ang_id) references angajati (ang_id);
alter table tranzactii
add constraint fk_tranz_location_id foreign key (location_id) references locatii (location_id);
alter table tranzactii 
add constraint fk_tranz_group_id foreign key (group_id) references produse (group_id);

alter table adoptii
add constraint fk_ad_cl_id foreign key (cl_id) references clienti (cl_id);
alter table adoptii
add constraint fk_ad_dog_id foreign key (dog_id) references caini (dog_id);
alter table adoptii
add constraint fk_ad_ang_id foreign key (ang_id) references angajati (ang_id);
alter table adoptii
add constraint fk_ad_location_id foreign key (location_id) references locatii (location_id);  


commit;


insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (seq_dog.nextval, 'Buzz', 'M', 1, to_date('15.07.2020','DD.MM.YYYY'), 201, 'Bulldog');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (seq_dog.nextval, 'Maggie', 'f', 10, to_date('18.05.2014','DD.MM.YYYY'), 202, 'Golden Retriever');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (seq_dog.nextval, 'Jumbo', 'M', 8, to_date('27.04.2019','DD.MM.YYYY'), 203, 'Pug');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (seq_dog.nextval, 'Shiny', 'f', 8, to_date('09.11.2014','DD.MM.YYYY'), 204, 'Pudel');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (105, 'Smiley', 'M', 8, to_date('30.10.2016','DD.MM.YYYY'), 201, 'Ciobanesc German');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (106, 'Bella', 'f', 8, to_date('20.11.2017','DD.MM.YYYY'), 202, 'Bichon');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (107, 'Champ', 'M', 7, to_date('25.05.2015','DD.MM.YYYY'), 203, 'Pug');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (108, 'Dixie', 'f', 5, to_date('24.01.2015','DD.MM.YYYY'), 204, 'Husky');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (109, 'Dude', 'M', 3, to_date('15.09.2020','DD.MM.YYYY'), 201, 'Bulldog');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (110, 'Grace', 'f', 1, to_date('01.02.2021','DD.MM.YYYY'), 202, 'Golden Retriever');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (111, 'Pepe', 'M', 4, to_date('23.04.2018','DD.MM.YYYY'), 203, 'Pug');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (112, 'Daisy', 'f', 2, to_date('18.09.2020','DD.MM.YYYY'), 204, 'Pudel');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (113, 'Zen', 'M', 3, to_date('04.03.2019','DD.MM.YYYY'), 201, 'Ciobanesc German');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (114, 'Pufi', 'f', 1, to_date('08.10.2021','DD.MM.YYYY'), 202, 'Bichon');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (115, 'Bolt', 'M', 4, to_date('21.07.2029','DD.MM.YYYY'), 203, 'Pug');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (116, 'Karma', 'f', 2, to_date('19.11.2020','DD.MM.YYYY'), 204, 'Husky');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (117, 'Blitz', 'M', 3, to_date('16.11.2019','DD.MM.YYYY'), 201, 'Bulldog');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (118, 'Minnie', 'f', 1, to_date('07.07.2021','DD.MM.YYYY'), 202, 'Golden Retriever');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (119, 'Zorro', 'M', 1, to_date('19.12.2021','DD.MM.YYYY'), 203, 'Pug');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (120, 'Cheeta', 'f', 2, to_date('26.03.2021','DD.MM.YYYY'), 204, 'Ciobanesc German');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (121, 'Toby', 'M', 1, to_date('16.11.2021','DD.MM.YYYY'), 201, 'Pudel');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (122, 'Trixie', 'f', 2, to_date('22.12.2020','DD.MM.YYYY'), 202, 'Bichon');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (123, 'Baloo', 'M', 3, to_date('22.12.2019','DD.MM.YYYY'), 203, 'Pug');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (124, 'Alma', 'f', 4, to_date('02.04.2018','DD.MM.YYYY'), 204, 'Husky');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (125, 'Appa', 'M', 5, to_date('15.07.2017','DD.MM.YYYY'), 201, 'Bulldog');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (126, 'Pearl', 'f', 1, to_date('01.05.2020','DD.MM.YYYY'), 202, 'Golden Retriever');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (127, 'Charlie', 'M', 2, to_date('28.06.2020','DD.MM.YYYY'), 203, 'Pug');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (128, 'Callie', 'f', 3, to_date('19.09.2019','DD.MM.YYYY'), 204, 'Pudel');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (129, 'Dodo', 'M', 4, to_date('06.07.2017','DD.MM.YYYY'), 201, 'Beagle');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (130, 'Crystal', 'f', 5, to_date('02.07.2017','DD.MM.YYYY'), 202, 'Beagle');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (131, 'Goofy', 'M', 1, to_date('7.06.2021','DD.MM.YYYY'), 203, 'Beagle');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (132, 'Penny', 'f', 2, to_date('11.11.2020','DD.MM.YYYY'), 204, 'Ciobanesc German');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (133, 'Toto', 'M', 3, to_date('28.08.2019','DD.MM.YYYY'), 201, 'Bichon');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (134, 'Blackie', 'f', 4, to_date('09.03.2018','DD.MM.YYYY'), 202, 'Pug');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (135, 'Gumball', 'M', 5, to_date('06.10.2017','DD.MM.YYYY'), 203, 'Husky');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (136, 'Martha', 'f', 1, to_date('15.07.2020','DD.MM.YYYY'), 204, 'Beagle');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (137, 'Darwin', 'M', 2, to_date('19.11.2020','DD.MM.YYYY'), 201, 'Bulldog');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (138, 'Luna', 'f', 3, to_date('09.11.2019','DD.MM.YYYY'), 202, 'Pudel');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (139, 'Thor', 'M', 4, to_date('04.08.2018','DD.MM.YYYY'), 203, 'Golden Retriever');

insert into caini (dog_id, name, sex, age, join_date, location_id, rasa)
values (140, 'Sierra', 'f', 1, to_date('02.07.2021','DD.MM.YYYY'), 204, 'Golden Retriever');

describe caini;

select * from caini;     


insert into locatii (location_id, street_name, city, phone_number, email, manager_id)
values (201, 'Muncii', 'Foc?ani', '0762182783', 'dog.focsani@gmail.com', 301);

insert into locatii (location_id, street_name, city, phone_number, email, manager_id)
values (202, 'Decebal', 'Gala?i', '0721487552', 'dog.galati@gmail.com', 312);

insert into locatii (location_id, street_name, city, phone_number, email, manager_id)
values (203, '?tefan cel Mare', 'Bucure?ti', '0781567213', 'dog.bucuresti@gmail.com', 307);

insert into locatii (location_id, street_name, city, phone_number, email, manager_id)
values (204, 'Crinului', 'Cluj', '0766802333', 'dog.cluj@gmail.com', 308);

insert into locatii (location_id, street_name, city, email)
values (205, 'Cuza Vodã', 'Ia?i', 'dog.iasi@gmail.com');

drop table locatii;

select * from locatii;

describe jobs;

insert into jobs (job_id, job_title, min_salary)
values (501, 'manager departamente', 4000);

insert into jobs (job_id, job_title, min_salary)
values (502, 'manager locatii', 4000);

insert into jobs (job_id, job_title, min_salary)
values (506, 'medic', 4000);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (503, 'contabil', 3000, 6000);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (504, 'lucrator comerciant', 1250, 2300);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (507, 'asistent', 2000, 4000);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (505, 'secretar', 2500, 4000);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (508, 'infirmier caine', 1250, 2300);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (509, 'ingrijitor locatii', 1250, 2300);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (510, 'operator call center', 1250, 2300);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (503, 'contabil', 3000, 6000);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (512, 'asistent tehnic', 2500, 4000);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (513, 'membru PR', 1250, 2000);

insert into jobs (job_id, job_title, min_salary, max_salary)
values (514, 'hingher', 1800, 2500);

select * from jobs
order by job_id;

insert into departamente (dep_id, dep_name, manager_id, found_date)
values (401, 'administrativ', 310, to_date('01.02.2014','DD.MM.YYYY'));

insert into departamente (dep_id, dep_name, manager_id, found_date)
values (402, 'medical', 314, to_date('10.04.2014','DD.MM.YYYY'));

insert into departamente (dep_id, dep_name, manager_id, found_date)
values (403, 'IT', 302, to_date('18.02.2015','DD.MM.YYYY'));

insert into departamente (dep_id, dep_name, manager_id, found_date)
values (404, 'ingrijire', 309, to_date('03.02.2014','DD.MM.YYYY'));

insert into departamente (dep_id, dep_name, manager_id, found_date)
values (405, 'bancar', 318, to_date('02.02.2014','DD.MM.YYYY'));

insert into departamente (dep_id, dep_name, manager_id, found_date   )
values (406, 'Relatii cu publicul', 323, to_date('23.06.2014','DD.MM.YYYY'));

select * from departamente;

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (301, 'Bîrãu', 'Victoria', 'vic.bir@dog.ro', '0762182783', to_date('06.03.2014','DD.MM.YYYY'), 502, 401, 9500, 201, 310);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, boss_id)
values (302, 'Teodorescu', 'Adrian', 'ad.teo@dog.ro', '0744707212', to_date('19.08.2014','DD.MM.YYYY'), 502, 401, 6500, 310);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (303, 'Popa', 'Dragos', 'dra.pop@dog.ro', '0787589898', to_date('12.04.2022','DD.MM.YYYY'), 507, 402, 4000, 201, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (304, 'Munteanu', 'Iulian', 'iul.munt@dog.ro', '0774640132', to_date('10.02.2015','DD.MM.YYYY'), 507, 402, 3500, 201, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (305, '?tefan', '?tefan', 'ste.stan@dog.ro', '0771492625', to_date('09.11.2021','DD.MM.YYYY'), 507, 402, 2000, 202, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (306, 'Drãghici', 'Claudia', 'cla.dra@dog.ro', '0732888724', to_date('21.05.2015','DD.MM.YYYY'), 507, 402, 3000, 202, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (307, 'Ghi?ã', 'Marius', 'mar.ghi@dog.ro', '0781567213', to_date('26.03.2014','DD.MM.YYYY'), 502, 401, 6000, 203, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (308, 'Nistor', 'Alberto', 'alb.nist@dog.ro', '0766802333', to_date('07.10.2014','DD.MM.YYYY'), 502, 401, 7500, 204, 310);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, boss_id)
values (309, 'Mãtã?aru', 'Adela', 'ad.mat@dog.ro', '0760443300', to_date('28.08.2014','DD.MM.YYYY'), 501, 401, 7500, 310);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, job_id, dep_id, salary)
values (310, 'Voinea', 'Homner', 'voi.hom@dog.ro', '0767030516', 501, 401, 9900);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (311, 'Manloe', 'Alberto', 'alb.man@dog.ro', '0799967900', to_date('28.09.2021','DD.MM.YYYY'), 507, 402, 3000, 203, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (312, 'Dobricã', 'Camelia', 'cam.dob@dog.ro', '0721487552', to_date('12.09.2014','DD.MM.YYYY'), 502, 401, 7000, 202, 310);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (313, 'Tama?', 'Sebastian', 'seb.tam@dog.ro', '0729140426', to_date('06.04.2017','DD.MM.YYYY'), 503, 405, 4600, 204, 318);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, boss_id)
values (314, '?onda', 'Carla', 'son.carl@dog.ro', '0746106343', to_date('21.05.2014','DD.MM.YYYY'), 501, 401, 5000, 310);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (315, 'Ioni?ã', '?tefan', 'ste.ion@dog.ro', '0723232159', to_date('12.07.2016','DD.MM.YYYY'), 507, 402, 3500, 203, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (316, 'Moiesescu', 'Valeriu', 'val.moi@dog.ro', '0763197991', to_date('06.02.2018','DD.MM.YYYY'), 505, 405, 3600, 203, 318);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (317, 'Ni?ã', 'Mãdãlin', 'mad.nit@dog.ro', '726601386', to_date('20.09.2019','DD.MM.YYYY'), 503, 405, 3600, 201, 318);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, boss_id)
values (318, 'Vîlculescu', 'Monica', 'val.mon@dog.ro', '0757049004', to_date('28.05.2014','DD.MM.YYYY'), 501, 401, 5500, 310);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (319, 'Radu', 'Dalia', 'dal.rad@dog.ro', '0787777833', to_date('18.04.2014','DD.MM.YYYY'), 506, 402, 8000, 201, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (320, 'Bu?i', 'Iulian', 'iul.but@dog.ro', '756396960', to_date('10.07.2021','DD.MM.YYYY'), 505, 405, 3000, 201, 318);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (321, 'Lazãr', 'Melania', 'mel.laz@dog.ro', '0744697904', to_date('13.04.2014','DD.MM.YYYY'), 506, 402, 8000, 202, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (322, 'Florea', '?tefan', 'ste.flo@dog.ro', '0761576546', to_date('10.03.2022','DD.MM.YYYY'), 503, 405, 4000, 202, 318);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, boss_id)
values (323, 'Bratosin', 'Valentina', 'val.bra@dog.ro', '0749926222', to_date('01.08.2014','DD.MM.YYYY'), 501, 401, 8000, 310);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (324, 'Diaconescu', 'Alexandru', 'al.di@dog.ro', '0723750841', to_date('26.11.2020','DD.MM.YYYY'), 505, 405, 2500, 202, 318);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (325, 'Florescu', 'Carla', 'carl.flo@dog.ro', '0774626629', to_date('07.01.2014','DD.MM.YYYY'), 503, 405, 5000, 204, 318);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (326, 'Tomescu', 'Nicolae', 'nic.tom@dog.ro', '0769662858', to_date('02.09.2020','DD.MM.YYYY'), 505, 405, 3000, 204, 318);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (327, 'Manolache', 'Melania', 'mel.man@dog.ro', '0763930773', to_date('05.07.2015','DD.MM.YYYY'), 506, 402, 8500, 204, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (328, 'Dima', 'Sergiu', 'ser.dim@dog.ro', '0749469685', to_date('18.09.2019','DD.MM.YYYY'), 504, 406, 2000, 201, 323);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (329, 'Olteanu', 'Laura', 'lau.olt@dog.ro', '0756627469', to_date('10.02.2015','DD.MM.YYYY'), 504, 406, 1700, 202, 323);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (330, 'Todicã', 'Alexandra', 'al.tod@dog.ro', '0766511722', to_date('22.04.2014','DD.MM.YYYY'), 506, 402, 7000, 203, 314);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (331, 'Vasilicã', 'Oana', 'oan.vas@dog.ro', '0766332731', to_date('05.07.2016','DD.MM.YYYY'), 504, 406, 1500, 204, 323);


insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (332, 'Ursu', 'Oana', 'ser.urs@dog.ro', '0740104443', to_date('26.11.2018','DD.MM.YYYY'), 504, 406, 2300, 203, 323);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (333, 'Stãruialã', 'Mirabela', 'mir.sta@dog.ro', '0737209088', to_date('23.09.2016','DD.MM.YYYY'), 508, 404, 2200, 201, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (334, 'Radu', 'Georgiana', 'geo.radu@dog.ro', '0765901701', to_date('24.01.2018','DD.MM.YYYY'), 508, 404, 1400, 202, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (335, 'Pãlici', 'Emilia', 'em.pal@dog.ro', '0768910164', to_date('23.03.2017','DD.MM.YYYY'), 508, 404, 1700, 203, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (336, 'Florescu', 'Ana', 'ana.flo@dog.ro', '0732373500', to_date('08.11.2017','DD.MM.YYYY'), 508, 404, 1300, 204, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (337, 'Dinu', 'Cosmin', 'cos.din@dog.ro', '0745264466', to_date('15.11.2017','DD.MM.YYYY'), 508, 404, 2300, 201, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (338, 'Barbu', 'David', 'dav.barb@dog.ro', '0773391734', to_date('07.08.2018','DD.MM.YYYY'), 508, 404, 2300, 202, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (339, 'Sava', 'Nicu', 'nicu.sava@dog.ro', '0771561668', to_date('06.12.2020','DD.MM.YYYY'), 508, 404, 1800, 203, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (340, '?u?ea', 'Delia', 'del.tut@dog.ro', '0760485807', to_date('25.05.2020','DD.MM.YYYY'), 508, 404, 2000, 204, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (341, 'Angelica', 'Lucia', 'ang.luc@dog.ro', '0768923615', to_date('12.03.2016','DD.MM.YYYY'), 509, 404, 2200, 201, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (342, 'Pîndaru', 'Sabina', 'sab.pin@dog.ro', '0738631938', to_date('30.01.2019','DD.MM.YYYY'), 509, 404, 1700, 201, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (343, 'Popescu', 'David', 'dav.pop@dog.ro', '0784909959', to_date('25.10.2020','DD.MM.YYYY'), 509, 404, 1900, 202, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (344, 'Petrescu', 'Razvan', 'raz.pet@dog.ro', '0764290185', to_date('02.06.2018','DD.MM.YYYY'), 509, 404, 1500, 202, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (345, 'Ifrim', 'Marius', 'mar.ifr@dog.ro', '0727243242', to_date('17.12.2021','DD.MM.YYYY'), 509, 404, 2250, 203, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (346, 'Tomulescu', 'Andrei', 'and.tom@dog.ro', '0722821423', to_date('16.07.2014','DD.MM.YYYY'), 509, 404, 1750, 203, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (347, 'Cristea', 'Vlad', 'vla.cri@dog.ro', '0724858081', to_date('16.07.2015','DD.MM.YYYY'), 509, 404, 2000, 204, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (348, 'Gheorghiu', 'Emilian', 'em.ghe@dog.ro', '0761531530', to_date('20.05.2014','DD.MM.YYYY'), 509, 404, 2250, 204, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (349, 'Puscasu', 'George', 'geo.pus@dog.ro', '0775209012', to_date('19.06.2014','DD.MM.YYYY'), 510, 403, 1850, 201, 302);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (350, 'Stoica', 'Alina', 'ali.stoi@dog.ro', '0727469512', to_date('18.07.2015','DD.MM.YYYY'), 510, 403, 1650, 202, 302);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (351, 'Stãnescu', 'Brându?a', 'bra.sta@dog.ro', '0723590358', to_date('13.08.2014','DD.MM.YYYY'), 510, 403, 1650, 203, 302);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (352, 'Iorgu', 'Claudia', 'cla.ior@dog.ro', '0741085959', to_date('12.09.2017','DD.MM.YYYY'), 510, 403, 1800, 204, 302);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (353, 'Bîrsan', 'Narcisa', 'nar.bîr@dog.ro', '0742099454', to_date('13.10.2018','DD.MM.YYYY'), 511, 404, 2500, 201, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (354, 'Crãciun', 'Geanina', 'gea.cra@dog.ro', '0724235886', to_date('10.11.2016','DD.MM.YYYY'), 511, 404, 2200, 202, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (355, 'Toma', 'Ovidiu', 'ovi.tom@dog.ro', '742037304', to_date('05.05.2022','DD.MM.YYYY'), 511, 404, 2100, 203, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (356, 'Tudor', 'Mihai', 'mih.tud@dog.ro', '0723302740', to_date('01.04.2020','DD.MM.YYYY'), 511, 404, 3400, 204, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (357, 'Mure?an', 'Codru?', 'cod.mur@dog.ro', '0722505636', to_date('09.06.2019','DD.MM.YYYY'), 512, 403, 3600, 201, 302);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (358, 'Oanã', 'Victoria', 'vic.oan@dog.ro', '0730961288', to_date('28.05.2015','DD.MM.YYYY'), 512, 403, 3200, 202, 302);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (359, 'Rusu', 'Daniel', 'dan.rus@dog.ro', '722388051', to_date('10.09.2020','DD.MM.YYYY'), 512, 403, 2850, 203, 302);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (360, 'Mihãilescu', 'Robert', 'rob.mih@dog.ro', '0738449709', to_date('16.08.2014','DD.MM.YYYY'), 512, 403, 2900, 204, 302);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (361, 'Chiri?ã', 'Casiana', 'cas.chi@dog.ro', '0785095460', to_date('26.05.2016','DD.MM.YYYY'), 513, 406, 1250, 204, 323);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (362, 'Oancea', 'Bogdan', 'bog.oan@dog.ro', '0762647286', to_date('27.02.2020','DD.MM.YYYY'), 513, 406, 1300, 203, 323);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (363, 'Grigori?ã', 'Florentina', 'flo.gri@dog.ro', '0735520737', to_date('05.11.2018','DD.MM.YYYY'), 514, 404, 2000, 201, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (364, 'Bu?e', '?tefan', 'ste.bus@dog.ro', '0770215684', to_date('03.03.2014','DD.MM.YYYY'), 514, 404, 1900, 201, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (365, 'Zainea', 'Florin', 'flo.zai@dog.ro', '0760534930', to_date('23.12.2021','DD.MM.YYYY'), 514, 404, 2300, 202, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (366, 'Gherghe', 'Oana', 'oan.ghe@dog.ro', '0767497673', to_date('24.10.2021','DD.MM.YYYY'), 514, 404, 2200, 202, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (367, 'Iancu', 'Cristi', 'cri.ian@dog.ro', '0760859510', to_date('01.02.2014','DD.MM.YYYY'), 514, 404, 2150, 203, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (368, 'Gãbureanu', 'Eugen', 'eug.gab@dog.ro', '0727160939', to_date('02.03.2015','DD.MM.YYYY'), 514, 404, 1850, 203, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (369, 'Constantinescu', 'Lucian', 'luc.con@dog.ro', '731327321', to_date('03.04.2016','DD.MM.YYYY'), 514, 404, 1950, 203, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (370, 'George', 'Cosmin', 'cos.geo@dog.ro', '0734765246', to_date('04.05.2017','DD.MM.YYYY'), 514, 404, 2200, 203, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (371, 'Chiriac', 'Vicen?iu', 'vic.chi@dog.ro', '0723964224', to_date('05.06.2018','DD.MM.YYYY'), 514, 404, 2500, 204, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (372, 'Dragomir', 'Daria', 'dar.dra@dog.ro', '0755838529', to_date('06.07.2019','DD.MM.YYYY'), 514, 404, 2450, 204, 309);

insert into angajati
(ang_id, last_name, first_name, email, phone_number, hire_date, job_id, dep_id, salary, location_id, boss_id)
values (373, 'Nedelcu', 'Sorin', 'sor.ned@dog.ro', '0770181142', to_date('07.08.2020','DD.MM.YYYY'), 514, 404, 2150, 204, 309);

select * from angajati;


insert into produse
(group_id, prods_name, pret, nr_stoc, brand_name)
values (601, 'Pasta de dinti', 25, 100, 'Beaphar');

insert into produse
(group_id, prods_name, pret, nr_stoc, brand_name)
values (602, 'Masina de tuns', 200, 52, 'Moser');

insert into produse
(group_id, prods_name, pret, nr_stoc, brand_name)
values (603, 'Scutece', 35, 54, 'Savic');

insert into produse
(group_id, prods_name, pret, nr_stoc, brand_name)
values (604, 'Snackuri dinti', 20, 66, 'Pedigree');

insert into produse
(group_id, prods_name, pret, nr_stoc, brand_name)
values (605, 'Lotiune pentru ochi', 40, 94, 'Oropharma');

insert into produse
(group_id, prods_name, pret, nr_stoc, brand_name)
values (606, 'Servetele pt urechi', 25, 78, 'Kooa');

insert into produse
(group_id, prods_name, pret, nr_stoc, brand_name)
values (607, 'Forfecuta pt labute', 10, 98, 'Trixie');

insert into produse
(group_id, prods_name, pret, nr_stoc, brand_name)
values (608, 'Unghiera', 25, 67, 'Trixie');

insert into produse
(group_id, prods_name, pret, nr_stoc, brand_name)
values (609, 'Jucarii', 50, 25, 'Noriel');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7101, 601, 202, to_date('2019-11-05','YYYY-MM-DD'), to_date('2023-07-21','YYYY-MM-DD'), 'mov');
 
insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7102, 601, 204, to_date('2016-07-01','YYYY-MM-DD'), to_date('2019-04-24','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7103, 601, 202, to_date('2018-11-03','YYYY-MM-DD'), to_date('2025-05-25','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7104, 601, 201, to_date('2019-10-09','YYYY-MM-DD'), to_date('2021-06-04','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7105, 601, 203, to_date('2015-04-22','YYYY-MM-DD'), to_date('2022-08-01','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7106, 601, 203, to_date('2021-05-28','YYYY-MM-DD'), to_date('2032-08-10','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7107, 601, 201, to_date('2019-02-06','YYYY-MM-DD'), to_date('2027-03-29','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7108, 601, 201, to_date('2015-02-12','YYYY-MM-DD'), to_date('2028-10-03','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7109, 601, 202, to_date('2021-11-10','YYYY-MM-DD'), to_date('2034-03-29','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7110, 601, 202, to_date('2017-04-13','YYYY-MM-DD'), to_date('2021-10-19','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7111, 601, 204, to_date('2018-09-13','YYYY-MM-DD'), to_date('2022-01-12','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7112, 601, 204, to_date('2021-12-15','YYYY-MM-DD'), to_date('2031-01-20','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7113, 601, 203, to_date('2017-01-20','YYYY-MM-DD'), to_date('2021-09-16','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7114, 601, 204, to_date('2018-08-26','YYYY-MM-DD'), to_date('2021-04-15','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7115, 601, 204, to_date('2019-11-10','YYYY-MM-DD'), to_date('2035-04-16','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7116, 601, 202, to_date('2020-02-10','YYYY-MM-DD'), to_date('2024-02-05','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7117, 601, 201, to_date('2017-10-21','YYYY-MM-DD'), to_date('2018-10-23','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7118, 601, 202, to_date('2020-11-09','YYYY-MM-DD'), to_date('2023-10-21','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7119, 601, 203, to_date('2018-01-19','YYYY-MM-DD'), to_date('2030-04-13','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7120, 601, 201, to_date('2019-05-03','YYYY-MM-DD'), to_date('2031-05-14','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7121, 601, 204, to_date('2015-02-21','YYYY-MM-DD'), to_date('2028-04-14','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7122, 601, 201, to_date('2020-04-26','YYYY-MM-DD'), to_date('2020-09-01','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7123, 601, 201, to_date('2020-12-28','YYYY-MM-DD'), to_date('2022-04-24','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7124, 601, 204, to_date('2019-08-21','YYYY-MM-DD'), to_date('2035-07-22','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7125, 601, 204, to_date('2016-12-24','YYYY-MM-DD'), to_date('2031-04-29','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7126, 601, 203, to_date('2020-02-26','YYYY-MM-DD'), to_date('2030-01-02','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7127, 601, 203, to_date('2019-03-28','YYYY-MM-DD'), to_date('2035-05-08','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7128, 601, 202, to_date('2015-01-03','YYYY-MM-DD'), to_date('2025-01-03','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7129, 601, 203, to_date('2020-09-18','YYYY-MM-DD'), to_date('2028-10-03','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7130, 601, 201, to_date('2017-10-14','YYYY-MM-DD'), to_date('2020-12-31','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7131, 601, 203, to_date('2018-04-12','YYYY-MM-DD'), to_date('2019-11-16','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7132, 601, 202, to_date('2019-03-20','YYYY-MM-DD'), to_date('2033-09-13','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7133, 601, 201, to_date('2016-12-29','YYYY-MM-DD'), to_date('2022-02-15','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7134, 601, 203, to_date('2015-04-04','YYYY-MM-DD'), to_date('2030-08-02','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7135, 601, 201, to_date('2021-02-06','YYYY-MM-DD'), to_date('2022-10-31','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7136, 601, 204, to_date('2019-04-12','YYYY-MM-DD'), to_date('2020-12-29','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7137, 601, 202, to_date('2020-12-25','YYYY-MM-DD'), to_date('2036-12-19','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7138, 601, 201, to_date('2017-06-01','YYYY-MM-DD'), to_date('2021-10-15','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7139, 601, 201, to_date('2020-02-28','YYYY-MM-DD'), to_date('2025-02-09','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7140, 601, 204, to_date('2021-01-13','YYYY-MM-DD'), to_date('2028-04-08','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7141, 601, 202, to_date('2014-02-04','YYYY-MM-DD'), to_date('2015-09-08','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7142, 601, 202, to_date('2014-10-03','YYYY-MM-DD'), to_date('2018-07-30','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7143, 601, 203, to_date('2016-05-25','YYYY-MM-DD'), to_date('2018-04-25','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7144, 601, 204, to_date('2021-10-14','YYYY-MM-DD'), to_date('2023-02-17','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7145, 601, 203, to_date('2019-03-18','YYYY-MM-DD'), to_date('2031-01-28','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7146, 601, 201, to_date('2014-12-26','YYYY-MM-DD'), to_date('2016-03-30','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7147, 601, 204, to_date('2017-03-27','YYYY-MM-DD'), to_date('2024-08-23','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7148, 601, 201, to_date('2020-11-29','YYYY-MM-DD'), to_date('2037-04-27','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7149, 601, 203, to_date('2016-06-23','YYYY-MM-DD'), to_date('2030-03-02','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7150, 601, 202, to_date('2018-09-11','YYYY-MM-DD'), to_date('2023-11-24','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7151, 601, 201, to_date('2020-06-21','YYYY-MM-DD'), to_date('2028-11-29','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7152, 601, 201, to_date('2017-07-05','YYYY-MM-DD'), to_date('2024-10-23','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7153, 601, 204, to_date('2016-10-03','YYYY-MM-DD'), to_date('2026-04-14','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7154, 601, 201, to_date('2017-10-26','YYYY-MM-DD'), to_date('2023-01-03','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7155, 601, 201, to_date('2020-11-27','YYYY-MM-DD'), to_date('2022-10-03','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7156, 601, 204, to_date('2015-08-06','YYYY-MM-DD'), to_date('2019-12-14','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7157, 601, 204, to_date('2015-03-10','YYYY-MM-DD'), to_date('2022-01-31','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7158, 601, 202, to_date('2020-10-10','YYYY-MM-DD'), to_date('2026-02-19','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7159, 601, 204, to_date('2017-04-28','YYYY-MM-DD'), to_date('2027-06-03','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7160, 601, 201, to_date('2020-09-22','YYYY-MM-DD'), to_date('2025-10-19','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7161, 601, 204, to_date('2019-07-15','YYYY-MM-DD'), to_date('2028-07-18','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7162, 601, 203, to_date('2021-09-27','YYYY-MM-DD'), to_date('2031-03-19','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7163, 601, 204, to_date('2014-05-12','YYYY-MM-DD'), to_date('2019-07-19','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7164, 601, 203, to_date('2020-12-01','YYYY-MM-DD'), to_date('2028-12-24','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7165, 601, 202, to_date('2018-07-28','YYYY-MM-DD'), to_date('2025-04-17','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7166, 601, 202, to_date('2017-11-24','YYYY-MM-DD'), to_date('2018-08-10','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7167, 601, 201, to_date('2018-04-08','YYYY-MM-DD'), to_date('2021-06-09','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7168, 601, 201, to_date('2018-11-29','YYYY-MM-DD'), to_date('2019-12-22','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7169, 601, 201, to_date('2014-08-05','YYYY-MM-DD'), to_date('2022-05-02','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7170, 601, 201, to_date('2015-09-12','YYYY-MM-DD'), to_date('2017-06-15','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7171, 601, 201, to_date('2017-10-08','YYYY-MM-DD'), to_date('2027-05-14','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7172, 601, 203, to_date('2018-03-02','YYYY-MM-DD'), to_date('2022-08-27','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7173, 601, 201, to_date('2015-03-25','YYYY-MM-DD'), to_date('2030-12-20','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7174, 601, 201, to_date('2015-10-24','YYYY-MM-DD'), to_date('2031-04-30','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7175, 601, 204, to_date('2017-07-29','YYYY-MM-DD'), to_date('2030-03-19','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7176, 601, 203, to_date('2016-10-26','YYYY-MM-DD'), to_date('2032-01-18','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7177, 601, 203, to_date('2021-12-05','YYYY-MM-DD'), to_date('2037-08-13','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7178, 601, 203, to_date('2014-07-04','YYYY-MM-DD'), to_date('2022-01-04','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7179, 601, 202, to_date('2017-05-07','YYYY-MM-DD'), to_date('2024-10-04','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7180, 601, 204, to_date('2017-05-15','YYYY-MM-DD'), to_date('2021-08-24','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7181, 601, 204, to_date('2019-11-10','YYYY-MM-DD'), to_date('2027-03-18','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7182, 601, 203, to_date('2018-02-17','YYYY-MM-DD'), to_date('2028-10-07','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7183, 601, 204, to_date('2018-03-25','YYYY-MM-DD'), to_date('2027-07-06','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7184, 601, 201, to_date('2021-04-28','YYYY-MM-DD'), to_date('2024-09-04','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7185, 601, 201, to_date('2016-01-19','YYYY-MM-DD'), to_date('2024-04-30','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7186, 601, 204, to_date('2020-09-05','YYYY-MM-DD'), to_date('2027-02-20','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7187, 601, 203, to_date('2021-12-25','YYYY-MM-DD'), to_date('2031-11-21','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7188, 601, 201, to_date('2015-05-29','YYYY-MM-DD'), to_date('2026-05-29','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7189, 601, 204, to_date('2015-05-05','YYYY-MM-DD'), to_date('2021-06-25','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7190, 601, 202, to_date('2016-10-12','YYYY-MM-DD'), to_date('2024-05-29','YYYY-MM-DD'), 'albastru');
 
insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7201, 602, 202, to_date('2016-02-26','YYYY-MM-DD'), to_date('2033-01-15','YYYY-MM-DD')); 








insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7202, 602, 202, to_date('2022-01-30','YYYY-MM-DD'), to_date('2036-05-04','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7203, 602, 201, to_date('2019-01-09','YYYY-MM-DD'), to_date('2033-02-12','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7204, 602, 202, to_date('2018-12-26','YYYY-MM-DD'), to_date('2019-08-27','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7205, 602, 203, to_date('2016-11-22','YYYY-MM-DD'), to_date('2027-04-09','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7206, 602, 203, to_date('2016-03-03','YYYY-MM-DD'), to_date('2025-10-26','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7207, 602, 202, to_date('2019-01-05','YYYY-MM-DD'), to_date('2019-01-30','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7208, 602, 202, to_date('2018-11-25','YYYY-MM-DD'), to_date('2024-03-23','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7209, 602, 203, to_date('2017-11-14','YYYY-MM-DD'), to_date('2022-11-26','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7210, 602, 202, to_date('2016-03-26','YYYY-MM-DD'), to_date('2027-08-22','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7211, 602, 201, to_date('2015-01-03','YYYY-MM-DD'), to_date('2015-11-15','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7212, 602, 204, to_date('2018-09-10','YYYY-MM-DD'), to_date('2021-02-07','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7213, 602, 203, to_date('2020-04-11','YYYY-MM-DD'), to_date('2026-04-25','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7214, 602, 204, to_date('2021-04-06','YYYY-MM-DD'), to_date('2023-09-09','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7215, 602, 204, to_date('2015-01-08','YYYY-MM-DD'), to_date('2025-04-25','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7216, 602, 202, to_date('2021-10-29','YYYY-MM-DD'), to_date('2022-03-29','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7217, 602, 204, to_date('2018-03-14','YYYY-MM-DD'), to_date('2020-12-24','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7218, 602, 204, to_date('2020-11-08','YYYY-MM-DD'), to_date('2028-12-19','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7219, 602, 203, to_date('2018-09-04','YYYY-MM-DD'), to_date('2019-10-19','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7220, 602, 203, to_date('2017-10-18','YYYY-MM-DD'), to_date('2033-03-29','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7221, 602, 203, to_date('2016-08-23','YYYY-MM-DD'), to_date('2017-07-07','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7222, 602, 203, to_date('2018-06-30','YYYY-MM-DD'), to_date('2019-08-13','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7223, 602, 204, to_date('2018-11-07','YYYY-MM-DD'), to_date('2020-01-07','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7224, 602, 203, to_date('2020-03-04','YYYY-MM-DD'), to_date('2020-12-14','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7225, 602, 202, to_date('2020-04-26','YYYY-MM-DD'), to_date('2031-07-28','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7226, 602, 202, to_date('2014-02-01','YYYY-MM-DD'), to_date('2019-09-11','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7227, 602, 202, to_date('2019-10-18','YYYY-MM-DD'), to_date('2023-09-24','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7228, 602, 203, to_date('2016-10-14','YYYY-MM-DD'), to_date('2028-04-14','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7229, 602, 201, to_date('2014-02-09','YYYY-MM-DD'), to_date('2023-12-19','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7230, 602, 202, to_date('2021-07-24','YYYY-MM-DD'), to_date('2021-07-28','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7231, 602, 202, to_date('2014-11-30','YYYY-MM-DD'), to_date('2029-12-07','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7232, 602, 201, to_date('2021-10-20','YYYY-MM-DD'), to_date('2023-01-03','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7233, 602, 203, to_date('2019-03-31','YYYY-MM-DD'), to_date('2020-03-18','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7234, 602, 202, to_date('2014-10-17','YYYY-MM-DD'), to_date('2023-09-22','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7235, 602, 204, to_date('2021-08-24','YYYY-MM-DD'), to_date('2031-06-20','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7236, 602, 201, to_date('2014-02-08','YYYY-MM-DD'), to_date('2025-12-21','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7237, 602, 201, to_date('2016-06-28','YYYY-MM-DD'), to_date('2020-11-29','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7238, 602, 203, to_date('2019-03-25','YYYY-MM-DD'), to_date('2024-08-29','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7239, 602, 201, to_date('2020-07-12','YYYY-MM-DD'), to_date('2034-04-29','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7240, 602, 202, to_date('2017-01-02','YYYY-MM-DD'), to_date('2019-07-30','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7241, 602, 202, to_date('2018-10-08','YYYY-MM-DD'), to_date('2035-03-10','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7242, 602, 204, to_date('2019-04-15','YYYY-MM-DD'), to_date('2033-05-29','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7243, 602, 203, to_date('2017-12-05','YYYY-MM-DD'), to_date('2030-05-15','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7244, 602, 203, to_date('2016-02-01','YYYY-MM-DD'), to_date('2019-11-22','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7245, 602, 201, to_date('2015-03-05','YYYY-MM-DD'), to_date('2025-08-04','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7246, 602, 201, to_date('2020-09-18','YYYY-MM-DD'), to_date('2023-03-22','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7247, 602, 204, to_date('2017-01-07','YYYY-MM-DD'), to_date('2031-05-13','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7248, 602, 203, to_date('2021-05-13','YYYY-MM-DD'), to_date('2026-05-24','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7249, 602, 203, to_date('2016-03-17','YYYY-MM-DD'), to_date('2022-05-05','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7250, 602, 204, to_date('2016-07-22','YYYY-MM-DD'), to_date('2017-11-26','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7251, 602, 203, to_date('2019-12-16','YYYY-MM-DD'), to_date('2035-02-26','YYYY-MM-DD')); 

insert into produs
(prod_id, group_id, location_id, fab_date, exp_date)
 values (7252, 602, 201, to_date('2021-11-14','YYYY-MM-DD'), to_date('2036-04-28','YYYY-MM-DD')); 
 
 insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7353, 603, 204, to_date('2016-02-05','YYYY-MM-DD'), to_date('2032-12-26','YYYY-MM-DD'), 'albastru');
 
 
 
 insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7301, 603, 202, to_date('2020-01-02','YYYY-MM-DD'), to_date('2022-07-09','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7302, 603, 203, to_date('2014-08-23','YYYY-MM-DD'), to_date('2029-04-14','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7303, 603, 202, to_date('2016-06-21','YYYY-MM-DD'), to_date('2027-07-17','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7304, 603, 201, to_date('2017-02-20','YYYY-MM-DD'), to_date('2022-01-28','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7305, 603, 203, to_date('2019-04-02','YYYY-MM-DD'), to_date('2026-06-12','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7306, 603, 204, to_date('2019-09-17','YYYY-MM-DD'), to_date('2022-07-27','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7307, 603, 202, to_date('2020-11-26','YYYY-MM-DD'), to_date('2028-02-16','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7308, 603, 203, to_date('2017-03-22','YYYY-MM-DD'), to_date('2025-06-25','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7309, 603, 202, to_date('2019-06-20','YYYY-MM-DD'), to_date('2030-08-09','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7310, 603, 201, to_date('2018-08-08','YYYY-MM-DD'), to_date('2033-03-08','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7311, 603, 201, to_date('2021-01-23','YYYY-MM-DD'), to_date('2023-11-03','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7312, 603, 203, to_date('2015-07-11','YYYY-MM-DD'), to_date('2025-05-04','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7313, 603, 202, to_date('2015-12-19','YYYY-MM-DD'), to_date('2032-04-29','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7314, 603, 204, to_date('2015-06-21','YYYY-MM-DD'), to_date('2031-12-09','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7315, 603, 203, to_date('2014-02-13','YYYY-MM-DD'), to_date('2019-04-21','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7316, 603, 203, to_date('2020-02-22','YYYY-MM-DD'), to_date('2034-12-29','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7317, 603, 201, to_date('2014-05-13','YYYY-MM-DD'), to_date('2031-05-06','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7318, 603, 204, to_date('2021-10-28','YYYY-MM-DD'), to_date('2031-06-17','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7319, 603, 202, to_date('2018-02-09','YYYY-MM-DD'), to_date('2027-07-18','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7320, 603, 202, to_date('2015-09-12','YYYY-MM-DD'), to_date('2017-10-27','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7321, 603, 204, to_date('2018-01-10','YYYY-MM-DD'), to_date('2034-04-15','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7322, 603, 201, to_date('2017-10-30','YYYY-MM-DD'), to_date('2021-10-22','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7323, 603, 204, to_date('2021-06-23','YYYY-MM-DD'), to_date('2033-07-17','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7324, 603, 202, to_date('2018-11-25','YYYY-MM-DD'), to_date('2030-12-12','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7325, 603, 201, to_date('2016-02-03','YYYY-MM-DD'), to_date('2018-09-02','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7326, 603, 204, to_date('2015-12-03','YYYY-MM-DD'), to_date('2031-02-24','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7327, 603, 204, to_date('2018-08-02','YYYY-MM-DD'), to_date('2030-12-15','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7328, 603, 203, to_date('2019-06-05','YYYY-MM-DD'), to_date('2029-06-03','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7329, 603, 202, to_date('2019-10-12','YYYY-MM-DD'), to_date('2035-08-25','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7330, 603, 202, to_date('2018-10-16','YYYY-MM-DD'), to_date('2019-08-31','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7331, 603, 202, to_date('2016-02-02','YYYY-MM-DD'), to_date('2020-01-23','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7332, 603, 201, to_date('2015-07-19','YYYY-MM-DD'), to_date('2025-06-26','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7333, 603, 204, to_date('2018-05-04','YYYY-MM-DD'), to_date('2034-03-23','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7334, 603, 201, to_date('2021-02-15','YYYY-MM-DD'), to_date('2028-10-09','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7335, 603, 203, to_date('2020-10-08','YYYY-MM-DD'), to_date('2027-05-21','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7336, 603, 201, to_date('2015-04-11','YYYY-MM-DD'), to_date('2032-03-05','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7337, 603, 203, to_date('2016-08-25','YYYY-MM-DD'), to_date('2022-09-26','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7338, 603, 203, to_date('2018-12-22','YYYY-MM-DD'), to_date('2023-01-24','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7339, 603, 203, to_date('2016-05-19','YYYY-MM-DD'), to_date('2032-12-23','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7340, 603, 201, to_date('2015-02-01','YYYY-MM-DD'), to_date('2016-09-25','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7341, 603, 203, to_date('2017-12-23','YYYY-MM-DD'), to_date('2025-04-21','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7342, 603, 203, to_date('2018-10-08','YYYY-MM-DD'), to_date('2023-05-12','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7343, 603, 204, to_date('2017-10-05','YYYY-MM-DD'), to_date('2029-02-23','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7344, 603, 204, to_date('2015-11-23','YYYY-MM-DD'), to_date('2016-06-07','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7345, 603, 201, to_date('2016-11-20','YYYY-MM-DD'), to_date('2033-03-31','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7346, 603, 203, to_date('2018-10-08','YYYY-MM-DD'), to_date('2022-03-19','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7347, 603, 201, to_date('2015-10-24','YYYY-MM-DD'), to_date('2032-06-20','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7348, 603, 204, to_date('2016-12-05','YYYY-MM-DD'), to_date('2025-08-13','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7349, 603, 202, to_date('2016-05-20','YYYY-MM-DD'), to_date('2026-04-27','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7350, 603, 201, to_date('2017-05-15','YYYY-MM-DD'), to_date('2034-05-02','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7351, 603, 204, to_date('2020-02-26','YYYY-MM-DD'), to_date('2022-06-08','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7352, 603, 202, to_date('2017-03-24','YYYY-MM-DD'), to_date('2019-03-04','YYYY-MM-DD'), 'mov');
 
 
 
 
 
 
 insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7401, 604, 204, to_date('2017-08-14','YYYY-MM-DD'), to_date('2023-10-06','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7402, 604, 201, to_date('2019-09-29','YYYY-MM-DD'), to_date('2025-10-10','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7403, 604, 203, to_date('2020-07-07','YYYY-MM-DD'), to_date('2035-10-05','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7404, 604, 203, to_date('2019-06-30','YYYY-MM-DD'), to_date('2022-05-26','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7405, 604, 204, to_date('2021-11-01','YYYY-MM-DD'), to_date('2037-03-05','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7406, 604, 202, to_date('2017-05-28','YYYY-MM-DD'), to_date('2019-08-06','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7407, 604, 203, to_date('2016-12-02','YYYY-MM-DD'), to_date('2029-11-04','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7408, 604, 204, to_date('2017-10-23','YYYY-MM-DD'), to_date('2024-02-17','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7409, 604, 202, to_date('2019-03-20','YYYY-MM-DD'), to_date('2025-01-27','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7410, 604, 201, to_date('2020-06-11','YYYY-MM-DD'), to_date('2031-06-21','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7411, 604, 204, to_date('2019-03-09','YYYY-MM-DD'), to_date('2029-09-08','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7412, 604, 202, to_date('2021-07-27','YYYY-MM-DD'), to_date('2036-09-06','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7413, 604, 202, to_date('2020-03-09','YYYY-MM-DD'), to_date('2031-05-26','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7414, 604, 201, to_date('2014-08-17','YYYY-MM-DD'), to_date('2030-01-02','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7415, 604, 204, to_date('2021-01-25','YYYY-MM-DD'), to_date('2029-09-30','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7416, 604, 204, to_date('2021-08-30','YYYY-MM-DD'), to_date('2034-07-18','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7417, 604, 201, to_date('2016-01-09','YYYY-MM-DD'), to_date('2028-03-24','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7418, 604, 202, to_date('2020-05-17','YYYY-MM-DD'), to_date('2022-12-16','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7419, 604, 203, to_date('2015-06-04','YYYY-MM-DD'), to_date('2028-07-16','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7420, 604, 201, to_date('2017-10-23','YYYY-MM-DD'), to_date('2032-11-17','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7421, 604, 204, to_date('2016-08-14','YYYY-MM-DD'), to_date('2019-12-17','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7422, 604, 202, to_date('2019-12-21','YYYY-MM-DD'), to_date('2020-10-13','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7423, 604, 202, to_date('2016-09-13','YYYY-MM-DD'), to_date('2023-06-21','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7424, 604, 204, to_date('2016-09-24','YYYY-MM-DD'), to_date('2032-11-06','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7425, 604, 203, to_date('2020-06-16','YYYY-MM-DD'), to_date('2032-01-23','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7426, 604, 204, to_date('2019-03-29','YYYY-MM-DD'), to_date('2024-04-30','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7427, 604, 203, to_date('2016-12-24','YYYY-MM-DD'), to_date('2030-07-24','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7428, 604, 203, to_date('2017-07-18','YYYY-MM-DD'), to_date('2018-01-18','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7429, 604, 204, to_date('2018-08-05','YYYY-MM-DD'), to_date('2035-03-12','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7430, 604, 204, to_date('2017-12-27','YYYY-MM-DD'), to_date('2028-02-18','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7431, 604, 201, to_date('2018-06-08','YYYY-MM-DD'), to_date('2027-09-03','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7432, 604, 204, to_date('2015-11-05','YYYY-MM-DD'), to_date('2031-05-25','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7433, 604, 204, to_date('2020-09-16','YYYY-MM-DD'), to_date('2033-10-12','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7434, 604, 203, to_date('2018-08-15','YYYY-MM-DD'), to_date('2027-06-19','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7435, 604, 203, to_date('2020-10-14','YYYY-MM-DD'), to_date('2024-03-12','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7436, 604, 203, to_date('2019-12-30','YYYY-MM-DD'), to_date('2027-05-02','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7437, 604, 204, to_date('2020-05-15','YYYY-MM-DD'), to_date('2023-02-24','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7438, 604, 202, to_date('2020-04-20','YYYY-MM-DD'), to_date('2035-02-10','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7439, 604, 201, to_date('2016-10-02','YYYY-MM-DD'), to_date('2031-01-26','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7440, 604, 204, to_date('2014-08-10','YYYY-MM-DD'), to_date('2022-04-09','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7441, 604, 203, to_date('2020-10-29','YYYY-MM-DD'), to_date('2035-03-04','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7442, 604, 202, to_date('2021-11-01','YYYY-MM-DD'), to_date('2023-05-15','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7443, 604, 202, to_date('2017-01-15','YYYY-MM-DD'), to_date('2031-03-27','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7444, 604, 201, to_date('2017-10-06','YYYY-MM-DD'), to_date('2029-09-13','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7445, 604, 204, to_date('2019-11-16','YYYY-MM-DD'), to_date('2027-11-21','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7446, 604, 201, to_date('2017-10-10','YYYY-MM-DD'), to_date('2023-06-22','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7447, 604, 204, to_date('2015-08-27','YYYY-MM-DD'), to_date('2026-09-07','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7448, 604, 201, to_date('2015-04-20','YYYY-MM-DD'), to_date('2020-10-15','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7449, 604, 203, to_date('2019-12-24','YYYY-MM-DD'), to_date('2032-04-28','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7450, 604, 201, to_date('2016-07-01','YYYY-MM-DD'), to_date('2029-04-12','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7451, 604, 203, to_date('2014-07-27','YYYY-MM-DD'), to_date('2021-08-25','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7452, 604, 204, to_date('2020-07-01','YYYY-MM-DD'), to_date('2022-06-09','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7453, 604, 203, to_date('2020-12-22','YYYY-MM-DD'), to_date('2024-08-17','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7454, 604, 204, to_date('2019-09-22','YYYY-MM-DD'), to_date('2021-03-18','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7455, 604, 202, to_date('2015-09-27','YYYY-MM-DD'), to_date('2017-05-03','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7456, 604, 202, to_date('2016-10-15','YYYY-MM-DD'), to_date('2026-05-09','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7457, 604, 203, to_date('2016-12-20','YYYY-MM-DD'), to_date('2021-01-28','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7458, 604, 203, to_date('2016-11-09','YYYY-MM-DD'), to_date('2024-02-19','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7459, 604, 203, to_date('2018-04-18','YYYY-MM-DD'), to_date('2019-08-15','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7460, 604, 203, to_date('2020-01-31','YYYY-MM-DD'), to_date('2032-05-17','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7461, 604, 204, to_date('2019-06-29','YYYY-MM-DD'), to_date('2036-01-31','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7462, 604, 201, to_date('2015-11-10','YYYY-MM-DD'), to_date('2019-10-24','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7463, 604, 201, to_date('2020-08-28','YYYY-MM-DD'), to_date('2027-03-16','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7464, 604, 203, to_date('2019-05-28','YYYY-MM-DD'), to_date('2023-02-20','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7465, 604, 202, to_date('2015-04-04','YYYY-MM-DD'), to_date('2032-02-21','YYYY-MM-DD'), 'galben');
 
 
 
 
 
 
 insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7501, 605, 204, to_date('2020-06-27','YYYY-MM-DD'), to_date('2033-12-09','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7502, 605, 204, to_date('2016-08-01','YYYY-MM-DD'), to_date('2030-05-01','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7503, 605, 201, to_date('2021-03-05','YYYY-MM-DD'), to_date('2034-03-28','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7504, 605, 201, to_date('2020-02-26','YYYY-MM-DD'), to_date('2022-03-04','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7505, 605, 202, to_date('2019-08-30','YYYY-MM-DD'), to_date('2021-07-03','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7506, 605, 201, to_date('2014-09-02','YYYY-MM-DD'), to_date('2031-07-07','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7507, 605, 201, to_date('2018-11-09','YYYY-MM-DD'), to_date('2019-10-12','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7508, 605, 202, to_date('2021-04-24','YYYY-MM-DD'), to_date('2024-08-09','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7509, 605, 201, to_date('2021-02-01','YYYY-MM-DD'), to_date('2027-08-23','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7510, 605, 201, to_date('2021-10-30','YYYY-MM-DD'), to_date('2035-01-23','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7511, 605, 202, to_date('2020-02-10','YYYY-MM-DD'), to_date('2032-04-07','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7512, 605, 203, to_date('2017-08-06','YYYY-MM-DD'), to_date('2027-10-18','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7513, 605, 204, to_date('2016-10-30','YYYY-MM-DD'), to_date('2028-02-26','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7514, 605, 204, to_date('2017-10-25','YYYY-MM-DD'), to_date('2023-11-28','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7515, 605, 201, to_date('2017-10-23','YYYY-MM-DD'), to_date('2030-03-26','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7516, 605, 204, to_date('2014-08-16','YYYY-MM-DD'), to_date('2018-03-12','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7517, 605, 201, to_date('2020-06-14','YYYY-MM-DD'), to_date('2030-10-19','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7518, 605, 203, to_date('2017-10-28','YYYY-MM-DD'), to_date('2026-08-29','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7519, 605, 202, to_date('2020-08-10','YYYY-MM-DD'), to_date('2030-02-26','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7520, 605, 201, to_date('2017-09-05','YYYY-MM-DD'), to_date('2019-11-18','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7521, 605, 203, to_date('2020-11-28','YYYY-MM-DD'), to_date('2029-01-19','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7522, 605, 204, to_date('2016-05-30','YYYY-MM-DD'), to_date('2019-08-06','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7523, 605, 203, to_date('2020-09-19','YYYY-MM-DD'), to_date('2029-10-26','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7524, 605, 201, to_date('2021-08-13','YYYY-MM-DD'), to_date('2038-05-02','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7525, 605, 203, to_date('2016-06-28','YYYY-MM-DD'), to_date('2020-07-05','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7526, 605, 201, to_date('2014-09-05','YYYY-MM-DD'), to_date('2015-01-24','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7527, 605, 202, to_date('2016-08-26','YYYY-MM-DD'), to_date('2023-03-17','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7528, 605, 202, to_date('2021-06-18','YYYY-MM-DD'), to_date('2036-10-04','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7529, 605, 202, to_date('2020-09-06','YYYY-MM-DD'), to_date('2028-09-25','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7530, 605, 204, to_date('2019-03-23','YYYY-MM-DD'), to_date('2019-05-26','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7531, 605, 201, to_date('2019-09-23','YYYY-MM-DD'), to_date('2029-03-09','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7532, 605, 203, to_date('2014-10-10','YYYY-MM-DD'), to_date('2025-07-14','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7533, 605, 204, to_date('2017-11-02','YYYY-MM-DD'), to_date('2034-06-25','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7534, 605, 201, to_date('2014-05-25','YYYY-MM-DD'), to_date('2030-12-02','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7535, 605, 203, to_date('2014-10-07','YYYY-MM-DD'), to_date('2014-10-12','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7536, 605, 201, to_date('2015-03-06','YYYY-MM-DD'), to_date('2023-04-19','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7537, 605, 203, to_date('2019-07-22','YYYY-MM-DD'), to_date('2031-05-27','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7538, 605, 204, to_date('2020-12-22','YYYY-MM-DD'), to_date('2030-11-15','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7539, 605, 204, to_date('2015-02-08','YYYY-MM-DD'), to_date('2032-01-04','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7540, 605, 204, to_date('2018-07-23','YYYY-MM-DD'), to_date('2021-06-11','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7541, 605, 203, to_date('2014-03-18','YYYY-MM-DD'), to_date('2025-12-04','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7542, 605, 204, to_date('2017-03-27','YYYY-MM-DD'), to_date('2028-03-16','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7543, 605, 202, to_date('2021-03-20','YYYY-MM-DD'), to_date('2032-05-16','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7544, 605, 204, to_date('2021-10-16','YYYY-MM-DD'), to_date('2024-06-04','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7545, 605, 201, to_date('2020-08-20','YYYY-MM-DD'), to_date('2036-09-26','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7546, 605, 204, to_date('2020-06-19','YYYY-MM-DD'), to_date('2026-06-07','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7547, 605, 201, to_date('2020-12-26','YYYY-MM-DD'), to_date('2025-10-19','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7548, 605, 203, to_date('2018-01-20','YYYY-MM-DD'), to_date('2032-09-13','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7549, 605, 204, to_date('2020-08-11','YYYY-MM-DD'), to_date('2035-05-11','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7550, 605, 203, to_date('2019-05-29','YYYY-MM-DD'), to_date('2024-12-16','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7551, 605, 202, to_date('2021-07-12','YYYY-MM-DD'), to_date('2021-09-11','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7552, 605, 204, to_date('2016-12-19','YYYY-MM-DD'), to_date('2018-05-08','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7553, 605, 203, to_date('2015-12-20','YYYY-MM-DD'), to_date('2018-01-31','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7554, 605, 203, to_date('2021-12-05','YYYY-MM-DD'), to_date('2023-04-25','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7555, 605, 204, to_date('2021-01-16','YYYY-MM-DD'), to_date('2025-03-30','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7556, 605, 201, to_date('2020-02-04','YYYY-MM-DD'), to_date('2020-05-23','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7557, 605, 202, to_date('2016-03-29','YYYY-MM-DD'), to_date('2021-12-14','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7558, 605, 202, to_date('2014-07-19','YYYY-MM-DD'), to_date('2019-01-20','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7559, 605, 203, to_date('2016-02-21','YYYY-MM-DD'), to_date('2020-05-02','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7560, 605, 201, to_date('2020-05-19','YYYY-MM-DD'), to_date('2028-06-16','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7561, 605, 201, to_date('2016-10-28','YYYY-MM-DD'), to_date('2021-03-03','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7562, 605, 201, to_date('2020-12-13','YYYY-MM-DD'), to_date('2026-10-05','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7563, 605, 204, to_date('2016-07-08','YYYY-MM-DD'), to_date('2018-11-29','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7564, 605, 202, to_date('2019-10-05','YYYY-MM-DD'), to_date('2030-06-01','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7565, 605, 202, to_date('2015-07-22','YYYY-MM-DD'), to_date('2016-07-19','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7566, 605, 202, to_date('2020-09-19','YYYY-MM-DD'), to_date('2032-05-06','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7567, 605, 201, to_date('2017-11-10','YYYY-MM-DD'), to_date('2019-04-22','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7568, 605, 202, to_date('2021-04-25','YYYY-MM-DD'), to_date('2024-09-28','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7569, 605, 204, to_date('2018-09-06','YYYY-MM-DD'), to_date('2034-10-19','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7570, 605, 203, to_date('2020-08-16','YYYY-MM-DD'), to_date('2023-02-28','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7571, 605, 203, to_date('2021-05-07','YYYY-MM-DD'), to_date('2023-06-04','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7572, 605, 202, to_date('2021-12-19','YYYY-MM-DD'), to_date('2027-04-09','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7573, 605, 201, to_date('2021-01-29','YYYY-MM-DD'), to_date('2022-04-16','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7574, 605, 203, to_date('2020-01-29','YYYY-MM-DD'), to_date('2024-12-19','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7575, 605, 201, to_date('2020-12-05','YYYY-MM-DD'), to_date('2033-07-18','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7576, 605, 202, to_date('2017-05-04','YYYY-MM-DD'), to_date('2021-08-07','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7577, 605, 201, to_date('2016-07-12','YYYY-MM-DD'), to_date('2020-01-26','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7578, 605, 204, to_date('2015-12-31','YYYY-MM-DD'), to_date('2018-07-06','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7579, 605, 204, to_date('2017-07-26','YYYY-MM-DD'), to_date('2020-05-18','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7580, 605, 203, to_date('2015-09-29','YYYY-MM-DD'), to_date('2028-08-14','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7581, 605, 202, to_date('2015-07-14','YYYY-MM-DD'), to_date('2030-05-31','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7582, 605, 203, to_date('2019-09-16','YYYY-MM-DD'), to_date('2022-07-29','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7583, 605, 203, to_date('2020-05-28','YYYY-MM-DD'), to_date('2033-09-12','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7584, 605, 204, to_date('2019-07-28','YYYY-MM-DD'), to_date('2031-02-15','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7585, 605, 204, to_date('2017-10-20','YYYY-MM-DD'), to_date('2026-12-23','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7586, 605, 201, to_date('2021-12-15','YYYY-MM-DD'), to_date('2022-02-27','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7587, 605, 202, to_date('2017-07-22','YYYY-MM-DD'), to_date('2026-06-06','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7588, 605, 203, to_date('2021-09-13','YYYY-MM-DD'), to_date('2022-05-13','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7589, 605, 202, to_date('2020-04-19','YYYY-MM-DD'), to_date('2023-08-01','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7590, 605, 202, to_date('2020-03-25','YYYY-MM-DD'), to_date('2031-10-01','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7591, 605, 204, to_date('2016-11-20','YYYY-MM-DD'), to_date('2025-11-15','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7592, 605, 204, to_date('2021-12-25','YYYY-MM-DD'), to_date('2022-10-20','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7593, 605, 202, to_date('2020-03-03','YYYY-MM-DD'), to_date('2026-08-04','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7594, 605, 204, to_date('2014-04-04','YYYY-MM-DD'), to_date('2025-03-04','YYYY-MM-DD'), 'rosu');








insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7601, 606, 203, to_date('2020-10-05','YYYY-MM-DD'), to_date('2025-07-01','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7602, 606, 204, to_date('2016-02-14','YYYY-MM-DD'), to_date('2030-07-04','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7603, 606, 203, to_date('2014-04-19','YYYY-MM-DD'), to_date('2017-11-14','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7604, 606, 203, to_date('2014-01-01','YYYY-MM-DD'), to_date('2029-05-10','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7605, 606, 204, to_date('2016-01-23','YYYY-MM-DD'), to_date('2032-04-08','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7606, 606, 201, to_date('2015-10-06','YYYY-MM-DD'), to_date('2020-04-12','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7607, 606, 204, to_date('2020-04-22','YYYY-MM-DD'), to_date('2027-02-28','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7608, 606, 203, to_date('2017-12-19','YYYY-MM-DD'), to_date('2021-09-30','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7609, 606, 204, to_date('2015-02-17','YYYY-MM-DD'), to_date('2027-05-28','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7610, 606, 201, to_date('2014-03-26','YYYY-MM-DD'), to_date('2022-06-06','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7611, 606, 204, to_date('2014-12-23','YYYY-MM-DD'), to_date('2024-06-05','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7612, 606, 203, to_date('2016-03-01','YYYY-MM-DD'), to_date('2032-01-08','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7613, 606, 202, to_date('2016-07-03','YYYY-MM-DD'), to_date('2027-06-02','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7614, 606, 204, to_date('2018-12-21','YYYY-MM-DD'), to_date('2019-07-19','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7615, 606, 204, to_date('2021-06-30','YYYY-MM-DD'), to_date('2023-03-10','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7616, 606, 203, to_date('2019-12-21','YYYY-MM-DD'), to_date('2020-01-23','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7617, 606, 202, to_date('2015-10-25','YYYY-MM-DD'), to_date('2029-03-24','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7618, 606, 202, to_date('2015-10-21','YYYY-MM-DD'), to_date('2026-05-30','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7619, 606, 203, to_date('2014-09-24','YYYY-MM-DD'), to_date('2023-06-08','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7620, 606, 201, to_date('2017-11-26','YYYY-MM-DD'), to_date('2028-01-18','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7621, 606, 201, to_date('2020-01-05','YYYY-MM-DD'), to_date('2032-01-05','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7622, 606, 204, to_date('2015-09-13','YYYY-MM-DD'), to_date('2028-02-03','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7623, 606, 204, to_date('2015-02-20','YYYY-MM-DD'), to_date('2020-06-26','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7624, 606, 204, to_date('2018-09-06','YYYY-MM-DD'), to_date('2028-05-25','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7625, 606, 202, to_date('2015-01-07','YYYY-MM-DD'), to_date('2028-06-18','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7626, 606, 202, to_date('2019-03-12','YYYY-MM-DD'), to_date('2022-04-19','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7627, 606, 204, to_date('2021-11-22','YYYY-MM-DD'), to_date('2026-03-02','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7628, 606, 203, to_date('2017-02-15','YYYY-MM-DD'), to_date('2019-04-06','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7629, 606, 201, to_date('2018-07-24','YYYY-MM-DD'), to_date('2029-12-26','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7630, 606, 203, to_date('2015-07-01','YYYY-MM-DD'), to_date('2030-12-06','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7631, 606, 201, to_date('2017-03-02','YYYY-MM-DD'), to_date('2018-01-03','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7632, 606, 201, to_date('2016-08-11','YYYY-MM-DD'), to_date('2024-05-10','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7633, 606, 201, to_date('2020-08-07','YYYY-MM-DD'), to_date('2026-03-16','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7634, 606, 202, to_date('2018-02-13','YYYY-MM-DD'), to_date('2025-11-20','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7635, 606, 204, to_date('2020-09-18','YYYY-MM-DD'), to_date('2033-07-19','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7636, 606, 203, to_date('2016-04-20','YYYY-MM-DD'), to_date('2029-07-18','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7637, 606, 204, to_date('2019-04-16','YYYY-MM-DD'), to_date('2024-06-06','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7638, 606, 202, to_date('2021-08-10','YYYY-MM-DD'), to_date('2032-07-31','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7639, 606, 204, to_date('2014-01-13','YYYY-MM-DD'), to_date('2021-06-14','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7640, 606, 204, to_date('2016-01-22','YYYY-MM-DD'), to_date('2028-02-11','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7641, 606, 203, to_date('2016-02-28','YYYY-MM-DD'), to_date('2017-10-08','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7642, 606, 202, to_date('2017-08-21','YYYY-MM-DD'), to_date('2026-03-27','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7643, 606, 204, to_date('2017-11-04','YYYY-MM-DD'), to_date('2030-07-19','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7644, 606, 201, to_date('2014-10-28','YYYY-MM-DD'), to_date('2020-11-27','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7645, 606, 201, to_date('2014-01-20','YYYY-MM-DD'), to_date('2023-05-02','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7646, 606, 204, to_date('2015-10-16','YYYY-MM-DD'), to_date('2029-12-15','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7647, 606, 203, to_date('2015-07-24','YYYY-MM-DD'), to_date('2020-02-07','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7648, 606, 202, to_date('2017-04-14','YYYY-MM-DD'), to_date('2025-02-26','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7649, 606, 201, to_date('2016-06-09','YYYY-MM-DD'), to_date('2018-01-16','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7650, 606, 201, to_date('2017-06-21','YYYY-MM-DD'), to_date('2034-03-01','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7651, 606, 204, to_date('2020-04-10','YYYY-MM-DD'), to_date('2024-02-01','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7652, 606, 203, to_date('2021-01-13','YYYY-MM-DD'), to_date('2033-08-05','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7653, 606, 202, to_date('2015-05-29','YYYY-MM-DD'), to_date('2026-05-13','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7654, 606, 203, to_date('2021-03-10','YYYY-MM-DD'), to_date('2030-01-03','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7655, 606, 202, to_date('2018-10-19','YYYY-MM-DD'), to_date('2034-04-20','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7656, 606, 202, to_date('2021-05-22','YYYY-MM-DD'), to_date('2037-08-07','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7657, 606, 204, to_date('2018-05-26','YYYY-MM-DD'), to_date('2020-10-18','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7658, 606, 201, to_date('2016-04-20','YYYY-MM-DD'), to_date('2019-02-25','YYYY-MM-DD'), 'albastru');
 
 
 
 
 insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7701, 607, 204, to_date('2016-02-27','YYYY-MM-DD'), to_date('2021-12-06','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7702, 607, 204, to_date('2019-07-06','YYYY-MM-DD'), to_date('2034-04-07','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7703, 607, 204, to_date('2021-09-30','YYYY-MM-DD'), to_date('2030-07-04','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7704, 607, 204, to_date('2019-10-15','YYYY-MM-DD'), to_date('2035-10-10','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7705, 607, 204, to_date('2020-06-20','YYYY-MM-DD'), to_date('2031-05-05','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7706, 607, 203, to_date('2015-07-16','YYYY-MM-DD'), to_date('2021-08-13','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7707, 607, 203, to_date('2016-11-30','YYYY-MM-DD'), to_date('2018-11-14','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7708, 607, 202, to_date('2014-07-09','YYYY-MM-DD'), to_date('2023-08-19','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7709, 607, 203, to_date('2015-12-31','YYYY-MM-DD'), to_date('2032-01-29','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7710, 607, 203, to_date('2015-06-08','YYYY-MM-DD'), to_date('2016-05-09','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7711, 607, 204, to_date('2016-06-01','YYYY-MM-DD'), to_date('2016-11-09','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7712, 607, 203, to_date('2015-01-18','YYYY-MM-DD'), to_date('2016-09-10','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7713, 607, 201, to_date('2020-09-02','YYYY-MM-DD'), to_date('2033-03-06','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7714, 607, 201, to_date('2018-06-13','YYYY-MM-DD'), to_date('2028-03-05','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7715, 607, 204, to_date('2019-05-25','YYYY-MM-DD'), to_date('2036-01-18','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7716, 607, 202, to_date('2014-05-27','YYYY-MM-DD'), to_date('2019-02-13','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7717, 607, 204, to_date('2021-08-02','YYYY-MM-DD'), to_date('2034-01-28','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7718, 607, 203, to_date('2018-02-24','YYYY-MM-DD'), to_date('2024-05-28','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7719, 607, 204, to_date('2020-05-07','YYYY-MM-DD'), to_date('2020-12-08','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7720, 607, 201, to_date('2016-12-31','YYYY-MM-DD'), to_date('2030-11-18','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7721, 607, 203, to_date('2019-08-29','YYYY-MM-DD'), to_date('2031-11-05','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7722, 607, 203, to_date('2021-07-10','YYYY-MM-DD'), to_date('2023-09-18','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7723, 607, 204, to_date('2015-01-02','YYYY-MM-DD'), to_date('2022-09-17','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7724, 607, 203, to_date('2016-02-13','YYYY-MM-DD'), to_date('2028-09-14','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7725, 607, 204, to_date('2015-12-23','YYYY-MM-DD'), to_date('2026-11-19','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7726, 607, 204, to_date('2019-06-13','YYYY-MM-DD'), to_date('2033-04-21','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7727, 607, 204, to_date('2018-02-02','YYYY-MM-DD'), to_date('2031-04-26','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7728, 607, 202, to_date('2017-02-16','YYYY-MM-DD'), to_date('2020-01-25','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7729, 607, 203, to_date('2015-04-17','YYYY-MM-DD'), to_date('2030-02-08','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7730, 607, 202, to_date('2018-11-09','YYYY-MM-DD'), to_date('2035-06-10','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7731, 607, 203, to_date('2014-09-15','YYYY-MM-DD'), to_date('2025-07-04','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7732, 607, 204, to_date('2016-09-03','YYYY-MM-DD'), to_date('2032-10-27','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7733, 607, 202, to_date('2020-12-29','YYYY-MM-DD'), to_date('2027-10-04','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7734, 607, 203, to_date('2019-05-18','YYYY-MM-DD'), to_date('2029-01-12','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7735, 607, 204, to_date('2017-07-01','YYYY-MM-DD'), to_date('2023-10-29','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7736, 607, 201, to_date('2020-10-19','YYYY-MM-DD'), to_date('2036-03-25','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7737, 607, 204, to_date('2018-03-20','YYYY-MM-DD'), to_date('2033-07-17','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7738, 607, 204, to_date('2017-04-25','YYYY-MM-DD'), to_date('2017-07-25','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7739, 607, 204, to_date('2019-09-29','YYYY-MM-DD'), to_date('2032-11-25','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7740, 607, 201, to_date('2016-10-10','YYYY-MM-DD'), to_date('2026-07-26','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7741, 607, 202, to_date('2014-02-11','YYYY-MM-DD'), to_date('2028-11-26','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7742, 607, 203, to_date('2014-12-10','YYYY-MM-DD'), to_date('2015-02-06','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7743, 607, 204, to_date('2018-02-10','YYYY-MM-DD'), to_date('2034-07-12','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7744, 607, 204, to_date('2019-07-06','YYYY-MM-DD'), to_date('2032-08-30','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7745, 607, 203, to_date('2017-12-28','YYYY-MM-DD'), to_date('2030-04-02','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7746, 607, 203, to_date('2017-08-18','YYYY-MM-DD'), to_date('2026-04-18','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7747, 607, 201, to_date('2015-09-24','YYYY-MM-DD'), to_date('2030-11-15','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7748, 607, 202, to_date('2017-03-18','YYYY-MM-DD'), to_date('2029-11-20','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7749, 607, 201, to_date('2015-06-11','YYYY-MM-DD'), to_date('2016-08-23','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7750, 607, 203, to_date('2019-09-13','YYYY-MM-DD'), to_date('2022-12-23','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7751, 607, 201, to_date('2015-02-01','YYYY-MM-DD'), to_date('2018-07-28','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7752, 607, 203, to_date('2015-09-08','YYYY-MM-DD'), to_date('2019-04-20','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7753, 607, 202, to_date('2017-05-14','YYYY-MM-DD'), to_date('2032-01-18','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7754, 607, 201, to_date('2015-01-31','YYYY-MM-DD'), to_date('2021-06-23','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7755, 607, 204, to_date('2014-04-12','YYYY-MM-DD'), to_date('2019-08-22','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7756, 607, 203, to_date('2021-07-09','YYYY-MM-DD'), to_date('2034-07-24','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7757, 607, 202, to_date('2018-09-07','YYYY-MM-DD'), to_date('2034-05-11','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7758, 607, 202, to_date('2015-10-24','YYYY-MM-DD'), to_date('2027-07-05','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7759, 607, 202, to_date('2019-02-02','YYYY-MM-DD'), to_date('2031-06-15','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7760, 607, 201, to_date('2019-02-26','YYYY-MM-DD'), to_date('2023-06-04','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7761, 607, 203, to_date('2016-04-01','YYYY-MM-DD'), to_date('2029-09-15','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7762, 607, 201, to_date('2020-07-31','YYYY-MM-DD'), to_date('2023-11-23','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7763, 607, 201, to_date('2016-09-26','YYYY-MM-DD'), to_date('2025-07-09','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7764, 607, 201, to_date('2015-06-04','YYYY-MM-DD'), to_date('2020-02-05','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7765, 607, 202, to_date('2020-06-01','YYYY-MM-DD'), to_date('2035-03-02','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7766, 607, 204, to_date('2019-07-19','YYYY-MM-DD'), to_date('2022-06-03','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7767, 607, 204, to_date('2019-01-29','YYYY-MM-DD'), to_date('2032-01-11','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7768, 607, 203, to_date('2015-09-23','YYYY-MM-DD'), to_date('2015-12-12','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7769, 607, 201, to_date('2018-05-12','YYYY-MM-DD'), to_date('2032-04-11','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7770, 607, 203, to_date('2016-07-31','YYYY-MM-DD'), to_date('2030-03-28','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7771, 607, 203, to_date('2015-12-27','YYYY-MM-DD'), to_date('2022-05-15','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7772, 607, 204, to_date('2015-08-19','YYYY-MM-DD'), to_date('2024-07-29','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7773, 607, 202, to_date('2015-09-01','YYYY-MM-DD'), to_date('2025-06-09','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7774, 607, 203, to_date('2016-09-08','YYYY-MM-DD'), to_date('2030-10-27','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7775, 607, 204, to_date('2017-08-26','YYYY-MM-DD'), to_date('2021-05-06','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7776, 607, 203, to_date('2018-04-12','YYYY-MM-DD'), to_date('2034-02-14','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7777, 607, 204, to_date('2015-09-22','YYYY-MM-DD'), to_date('2030-06-12','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7778, 607, 201, to_date('2016-09-24','YYYY-MM-DD'), to_date('2018-04-18','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7779, 607, 201, to_date('2018-08-26','YYYY-MM-DD'), to_date('2035-02-07','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7780, 607, 203, to_date('2017-03-19','YYYY-MM-DD'), to_date('2029-12-20','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7781, 607, 201, to_date('2016-08-31','YYYY-MM-DD'), to_date('2032-02-25','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7782, 607, 204, to_date('2016-11-26','YYYY-MM-DD'), to_date('2019-05-02','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7783, 607, 203, to_date('2017-07-05','YYYY-MM-DD'), to_date('2031-01-18','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7784, 607, 204, to_date('2021-04-25','YYYY-MM-DD'), to_date('2038-01-15','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7785, 607, 203, to_date('2015-06-16','YYYY-MM-DD'), to_date('2024-12-05','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7786, 607, 203, to_date('2015-03-22','YYYY-MM-DD'), to_date('2022-03-25','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7787, 607, 202, to_date('2017-09-21','YYYY-MM-DD'), to_date('2019-12-04','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7788, 607, 203, to_date('2014-06-29','YYYY-MM-DD'), to_date('2023-10-21','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7789, 607, 201, to_date('2020-05-29','YYYY-MM-DD'), to_date('2025-04-24','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7790, 607, 203, to_date('2018-05-26','YYYY-MM-DD'), to_date('2019-08-21','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7791, 607, 204, to_date('2019-12-04','YYYY-MM-DD'), to_date('2030-10-17','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7792, 607, 201, to_date('2014-07-11','YYYY-MM-DD'), to_date('2028-02-16','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7793, 607, 201, to_date('2020-12-24','YYYY-MM-DD'), to_date('2026-12-02','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7794, 607, 204, to_date('2014-08-15','YYYY-MM-DD'), to_date('2024-05-17','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7795, 607, 202, to_date('2018-10-13','YYYY-MM-DD'), to_date('2023-11-13','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7796, 607, 202, to_date('2019-05-06','YYYY-MM-DD'), to_date('2026-09-16','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7797, 607, 201, to_date('2020-01-31','YYYY-MM-DD'), to_date('2034-09-04','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7798, 607, 202, to_date('2021-08-31','YYYY-MM-DD'), to_date('2021-10-17','YYYY-MM-DD'), 'rosu');
 
 
 
 
 insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7801, 608, 203, to_date('2019-11-28','YYYY-MM-DD'), to_date('2029-06-19','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7802, 608, 201, to_date('2021-10-20','YYYY-MM-DD'), to_date('2025-09-16','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7803, 608, 204, to_date('2017-07-30','YYYY-MM-DD'), to_date('2032-05-30','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7804, 608, 201, to_date('2020-05-29','YYYY-MM-DD'), to_date('2035-03-05','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7805, 608, 202, to_date('2020-11-16','YYYY-MM-DD'), to_date('2034-03-02','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7806, 608, 202, to_date('2017-09-02','YYYY-MM-DD'), to_date('2030-06-21','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7807, 608, 203, to_date('2019-01-16','YYYY-MM-DD'), to_date('2031-08-12','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7808, 608, 202, to_date('2019-04-05','YYYY-MM-DD'), to_date('2032-11-18','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7809, 608, 204, to_date('2014-07-02','YYYY-MM-DD'), to_date('2030-03-10','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7810, 608, 202, to_date('2014-09-28','YYYY-MM-DD'), to_date('2026-10-04','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7811, 608, 203, to_date('2020-08-13','YYYY-MM-DD'), to_date('2036-12-16','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7812, 608, 202, to_date('2019-12-08','YYYY-MM-DD'), to_date('2021-01-18','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7813, 608, 204, to_date('2016-09-28','YYYY-MM-DD'), to_date('2021-10-29','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7814, 608, 203, to_date('2020-08-28','YYYY-MM-DD'), to_date('2033-06-12','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7815, 608, 204, to_date('2018-01-26','YYYY-MM-DD'), to_date('2033-03-31','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7816, 608, 202, to_date('2015-02-24','YYYY-MM-DD'), to_date('2024-08-20','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7817, 608, 204, to_date('2014-12-13','YYYY-MM-DD'), to_date('2028-10-26','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7818, 608, 203, to_date('2014-12-03','YYYY-MM-DD'), to_date('2027-01-02','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7819, 608, 204, to_date('2017-04-15','YYYY-MM-DD'), to_date('2022-02-01','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7820, 608, 204, to_date('2020-04-15','YYYY-MM-DD'), to_date('2030-11-11','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7821, 608, 201, to_date('2016-09-16','YYYY-MM-DD'), to_date('2028-05-04','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7822, 608, 201, to_date('2016-01-10','YYYY-MM-DD'), to_date('2025-10-23','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7823, 608, 204, to_date('2015-06-12','YYYY-MM-DD'), to_date('2022-02-17','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7824, 608, 202, to_date('2016-12-23','YYYY-MM-DD'), to_date('2017-04-20','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7825, 608, 202, to_date('2019-06-03','YYYY-MM-DD'), to_date('2019-07-09','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7826, 608, 203, to_date('2017-04-05','YYYY-MM-DD'), to_date('2032-08-08','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7827, 608, 203, to_date('2019-02-16','YYYY-MM-DD'), to_date('2026-07-16','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7828, 608, 203, to_date('2020-05-22','YYYY-MM-DD'), to_date('2022-09-20','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7829, 608, 202, to_date('2015-11-10','YYYY-MM-DD'), to_date('2031-12-08','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7830, 608, 202, to_date('2015-11-12','YYYY-MM-DD'), to_date('2028-09-21','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7831, 608, 202, to_date('2020-06-08','YYYY-MM-DD'), to_date('2031-10-27','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7832, 608, 204, to_date('2014-03-11','YYYY-MM-DD'), to_date('2015-05-16','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7833, 608, 203, to_date('2015-08-06','YYYY-MM-DD'), to_date('2030-07-27','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7834, 608, 202, to_date('2014-01-04','YYYY-MM-DD'), to_date('2027-08-16','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7835, 608, 202, to_date('2019-01-09','YYYY-MM-DD'), to_date('2028-06-25','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7836, 608, 201, to_date('2019-08-19','YYYY-MM-DD'), to_date('2028-06-23','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7837, 608, 201, to_date('2014-09-02','YYYY-MM-DD'), to_date('2029-02-15','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7838, 608, 202, to_date('2018-12-13','YYYY-MM-DD'), to_date('2025-03-03','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7839, 608, 202, to_date('2015-02-02','YYYY-MM-DD'), to_date('2019-12-26','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7840, 608, 203, to_date('2015-02-17','YYYY-MM-DD'), to_date('2030-07-26','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7841, 608, 203, to_date('2014-09-03','YYYY-MM-DD'), to_date('2025-09-28','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7842, 608, 204, to_date('2016-05-28','YYYY-MM-DD'), to_date('2027-01-04','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7843, 608, 201, to_date('2021-10-23','YYYY-MM-DD'), to_date('2037-11-27','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7844, 608, 204, to_date('2018-07-15','YYYY-MM-DD'), to_date('2020-05-21','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7845, 608, 201, to_date('2016-06-16','YYYY-MM-DD'), to_date('2017-08-24','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7846, 608, 201, to_date('2020-05-13','YYYY-MM-DD'), to_date('2035-04-29','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7847, 608, 203, to_date('2014-09-02','YYYY-MM-DD'), to_date('2023-07-22','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7848, 608, 201, to_date('2019-08-16','YYYY-MM-DD'), to_date('2034-01-28','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7849, 608, 204, to_date('2015-08-04','YYYY-MM-DD'), to_date('2017-02-15','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7850, 608, 203, to_date('2018-11-28','YYYY-MM-DD'), to_date('2031-04-21','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7851, 608, 202, to_date('2015-11-30','YYYY-MM-DD'), to_date('2022-04-15','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7852, 608, 202, to_date('2014-11-12','YYYY-MM-DD'), to_date('2018-02-25','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7853, 608, 202, to_date('2018-09-04','YYYY-MM-DD'), to_date('2024-12-14','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7854, 608, 202, to_date('2021-01-13','YYYY-MM-DD'), to_date('2034-01-03','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7855, 608, 201, to_date('2017-08-08','YYYY-MM-DD'), to_date('2021-12-17','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7856, 608, 204, to_date('2015-04-14','YYYY-MM-DD'), to_date('2031-03-12','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7857, 608, 204, to_date('2017-08-28','YYYY-MM-DD'), to_date('2034-02-02','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7858, 608, 203, to_date('2021-09-10','YYYY-MM-DD'), to_date('2030-07-02','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7859, 608, 204, to_date('2015-04-18','YYYY-MM-DD'), to_date('2026-07-22','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7860, 608, 204, to_date('2020-05-01','YYYY-MM-DD'), to_date('2031-09-05','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7861, 608, 203, to_date('2018-09-19','YYYY-MM-DD'), to_date('2023-01-22','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7862, 608, 203, to_date('2019-01-28','YYYY-MM-DD'), to_date('2026-04-28','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7863, 608, 201, to_date('2015-10-04','YYYY-MM-DD'), to_date('2028-06-20','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7864, 608, 204, to_date('2018-08-21','YYYY-MM-DD'), to_date('2031-11-21','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7865, 608, 201, to_date('2018-06-21','YYYY-MM-DD'), to_date('2034-03-02','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7866, 608, 203, to_date('2014-08-13','YYYY-MM-DD'), to_date('2029-01-24','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7867, 608, 202, to_date('2016-04-03','YYYY-MM-DD'), to_date('2032-03-28','YYYY-MM-DD'), 'galben');
 
 
 
 
 insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7901, 609, 204, to_date('2019-03-17','YYYY-MM-DD'), to_date('2020-08-11','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7902, 609, 203, to_date('2016-05-20','YYYY-MM-DD'), to_date('2032-02-04','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7903, 609, 201, to_date('2018-07-06','YYYY-MM-DD'), to_date('2028-09-10','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7904, 609, 202, to_date('2019-05-30','YYYY-MM-DD'), to_date('2027-11-29','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7905, 609, 201, to_date('2014-07-27','YYYY-MM-DD'), to_date('2025-01-12','YYYY-MM-DD'), 'alb');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7906, 609, 202, to_date('2021-12-09','YYYY-MM-DD'), to_date('2022-09-13','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7907, 609, 202, to_date('2020-02-10','YYYY-MM-DD'), to_date('2020-12-29','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7908, 609, 204, to_date('2017-10-02','YYYY-MM-DD'), to_date('2019-12-02','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7909, 609, 204, to_date('2021-12-27','YYYY-MM-DD'), to_date('2034-07-04','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7910, 609, 202, to_date('2016-01-13','YYYY-MM-DD'), to_date('2025-12-24','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7911, 609, 204, to_date('2020-10-05','YYYY-MM-DD'), to_date('2025-11-19','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7912, 609, 204, to_date('2020-01-25','YYYY-MM-DD'), to_date('2030-08-01','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7913, 609, 202, to_date('2021-09-13','YYYY-MM-DD'), to_date('2031-05-09','YYYY-MM-DD'), 'galben');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7914, 609, 203, to_date('2016-06-10','YYYY-MM-DD'), to_date('2016-08-23','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7915, 609, 204, to_date('2014-07-06','YYYY-MM-DD'), to_date('2019-03-19','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7916, 609, 204, to_date('2014-06-14','YYYY-MM-DD'), to_date('2016-01-14','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7917, 609, 202, to_date('2020-04-04','YYYY-MM-DD'), to_date('2031-03-11','YYYY-MM-DD'), 'negru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7918, 609, 202, to_date('2017-03-23','YYYY-MM-DD'), to_date('2021-11-14','YYYY-MM-DD'), 'mov');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7919, 609, 203, to_date('2021-11-18','YYYY-MM-DD'), to_date('2025-04-22','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7920, 609, 202, to_date('2018-09-24','YYYY-MM-DD'), to_date('2031-05-19','YYYY-MM-DD'), 'verde');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7921, 609, 204, to_date('2021-11-29','YYYY-MM-DD'), to_date('2034-02-15','YYYY-MM-DD'), 'portocaliu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7922, 609, 204, to_date('2015-07-06','YYYY-MM-DD'), to_date('2030-04-18','YYYY-MM-DD'), 'rosu');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7923, 609, 204, to_date('2019-02-17','YYYY-MM-DD'), to_date('2026-08-26','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7924, 609, 202, to_date('2021-03-10','YYYY-MM-DD'), to_date('2034-09-28','YYYY-MM-DD'), 'albastru');


insert into produs
(prod_id, group_id, location_id, fab_date, exp_date, color)
 values (7925, 609, 201, to_date('2017-07-27','YYYY-MM-DD'), to_date('2033-03-14','YYYY-MM-DD'), 'verde');
 
 
insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (801, 'Podaru', 'Elena', '0751423621', to_date('1984-10-14','YYYY-MM-DD'), 201);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (802, 'Pasclaru', 'Miruna', '0712488233', to_date('1990-01-06','YYYY-MM-DD'), 202);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (803, 'Popescu', 'Ana-Maria', '0724615469', to_date('1993-02-12','YYYY-MM-DD'), 203);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (804, 'Iftimoaie', 'Crina', '0777408804', to_date('1973-07-16','YYYY-MM-DD'), 204);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (805, 'Bratu', 'Andrei', '0716505200', to_date('2000-11-14','YYYY-MM-DD'), 201);
commit;
insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (806, 'Sava', 'Radu', '0766801.22', to_date('1983-11-27','YYYY-MM-DD'), 202);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (807, 'Alexe', 'Diana', '0762188780', to_date('2003-12-15','YYYY-MM-DD'), 203);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (808, 'Miron', 'Marian', '0715184123', to_date('196-04-06','YYYY-MM-DD'), 204);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (809, 'Ciocan', 'Vlad', '0722905706', to_date('2002-05-02','YYYY-MM-DD'), 201);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (810, 'Micutu', 'Florin', '0721423621', to_date('1984-05-26','YYYY-MM-DD'), 202);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (811, 'Dorobantu', 'Adrian', '0788203155', to_date('1997-02-09','YYYY-MM-DD'), 203);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (812, 'Marius', 'Carmen', '0751243621', to_date('2001-04-01','YYYY-MM-DD'), 204);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (813, 'Iute', 'Larisa', '0708090105', to_date('1971-05-05','YYYY-MM-DD'), 201);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (814, 'Enache', 'Cosmin', '0712345987', to_date('1990-08-07','YYYY-MM-DD'), 202);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (815, 'Onea', 'Florentina', '0798417504', to_date('1981-03-21','YYYY-MM-DD'), 203);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (816, 'Balan', 'Denis', '0745203102', to_date('2000-01-14','YYYY-MM-DD'), 204);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (817, 'Diaconescu', 'Mariana', '0799881772', to_date('1961-12-10','YYYY-MM-DD'), 201);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (818, 'Mocanu', 'Catalina', '0708099344', to_date('1940-02-01','YYYY-MM-DD'), 202);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (819, 'Rusu', 'Valentin', '0751123621', to_date('1993-10-14','YYYY-MM-DD'), 203);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (820, 'Tanase', 'Lara', '0788203401', to_date('1969-11-29','YYYY-MM-DD'), 204);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (821, 'Nechita', 'Isabela', '0751402806', to_date('1964-02-15','YYYY-MM-DD'), 201);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (822, 'Constantinescu', 'Marius', '0711238881', to_date('1958-06-17','YYYY-MM-DD'), 202);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (823, 'Murgu', 'Razvan', '0764581973', to_date('1999-11-22','YYYY-MM-DD'), 203);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (824, 'Dumitru', 'Mario', '0722444301', to_date('2000-08-30','YYYY-MM-DD'), 204);

insert into clienti
(cl_id, last_name, first_name, phone_number, birth_date, location_id)
values (825, 'Grozavescu', 'Nicusor', '0751423401', to_date('1971-02-14','YYYY-MM-DD'), 201);



insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (901, 813, 328, 201, 609, to_date('2020-10-14','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (902, 822, 329, 202, 605, to_date('2016-01-06','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (903, 815, 332, 203, 608, to_date('2021-08-12','YYYY-MM-DD'), 2);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (904, 811, 332, 203, 607, to_date('2017-07-16','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (905, 811, 332, 203, 602, to_date('2017-11-14','YYYY-MM-DD'), 3);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (906, 811, 332, 203, 609, to_date('2017-11-27','YYYY-MM-DD'), 2);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (907, 803, 332, 203, 607, to_date('2018-12-16','YYYY-MM-DD'), 4);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (908, 809, 328, 201, 603, to_date('2015-04-06','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (910, 817, 328, 201, 601, to_date('2015-05-02','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (911, 817, 328, 201, 606, to_date('2015-05-26','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (912, 823, 332, 203, 602, to_date('2019-05-05','YYYY-MM-DD'), 3);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (913, 819, 332, 203, 609, to_date('2019-08-07','YYYY-MM-DD'), 2);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (914, 809, 328, 201, 603, to_date('2020-12-06','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (915, 821, 328, 201, 605, to_date('2019-12-22','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (916, 806, 329, 202, 603, to_date('2017-02-09','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (917, 823, 332, 203, 603, to_date('2021-10-24','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (918, 813, 328, 201, 607, to_date('2021-04-01','YYYY-MM-DD'), 5);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (919, 821, 328, 201, 606, to_date('2020-02-15','YYYY-MM-DD'), 4);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (920, 818, 329, 202, 605, to_date('2018-05-28','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (921, 823, 332, 203, 607, to_date('2022-04-01','YYYY-MM-DD'), 2);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (922, 811, 332, 203, 606, to_date('2015-05-26','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (923, 802, 329, 202, 607, to_date('2019-07-17','YYYY-MM-DD'), 3);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (924, 825, 328, 201, 604, to_date('2016-01-02','YYYY-MM-DD'), 1);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (925, 821, 328, 201, 605, to_date('2020-06-17','YYYY-MM-DD'), 2);

insert into tranzactii
(tr_id, cl_id, ang_id, location_id, group_id, purchase_date, quantity)
values (926, 802, 329, 202, 605, to_date('2019-07-30','YYYY-MM-DD'), 1);


insert into adoptii
(ad_id, cl_id, dog_id, dog_name, ang_id, location_id, adoption_date)
values (1001, 813, 137, 'Darwin', 328, 201, to_date('2019-07-30','YYYY-MM-DD'));

insert into adoptii
(ad_id, cl_id, dog_id, dog_name, ang_id, location_id, adoption_date)
values (1002, 811, 131, 'Goofy', 332, 203, to_date('2021-12-16','YYYY-MM-DD'));

insert into adoptii
(ad_id, cl_id, dog_id, dog_name, ang_id, location_id, adoption_date)
values (1003, 817, 129, 'Dodo', 328, 201, to_date('2018-05-26','YYYY-MM-DD'));

insert into adoptii
(ad_id, cl_id, dog_id, dog_name, ang_id, location_id, adoption_date)
values (1004, 822, 122, 'Trixie', 329, 202, to_date('2021-04-06','YYYY-MM-DD'));

insert into adoptii
(ad_id, cl_id, dog_id, dog_name, ang_id, location_id, adoption_date)
values (1005, 823, 127, 'Charlie', 332, 203, to_date('2022-02-24','YYYY-MM-DD'));

insert into adoptii
(ad_id, cl_id, dog_id, dog_name, ang_id, location_id, adoption_date)
values (1006, 821, 125, 'Appa', 328, 201, to_date('2019-02-15','YYYY-MM-DD'));

insert into adoptii
(ad_id, cl_id, dog_id, dog_name, ang_id, location_id, adoption_date)
values (1007, 809, 105, 'Smiley', 328, 201, to_date('2017-03-01','YYYY-MM-DD'));

insert into adoptii
(ad_id, cl_id, dog_id, dog_name, ang_id, location_id, adoption_date)
values (1008, 815, 135, 'Gumball', 332, 203, to_date('2018-07-08','YYYY-MM-DD'));

insert into adoptii
(ad_id, cl_id, dog_id, dog_name, ang_id, location_id, adoption_date)
values (1009, 819, 107, 'Champ', 332, 203, to_date('2015-12-12','YYYY-MM-DD'));

insert into adoptii
(ad_id, cl_id, dog_id, dog_name, ang_id, location_id, adoption_date)
values (1010, 803, 139, 'Thor', 332, 203, to_date('2019-02-21','YYYY-MM-DD'));

 
 select * from clienti;
 
 
 select * from produs;
 
 
 
 
 
 
 select * from locatii;
 
 describe departamente;
 describe angajati;
 
 select last_name, job_title, dep_name
 from jobs j, departamente d, angajati a, locatii l
 where j.job_id = a.job_id and d.dep_id = a.dep_id and a.location_id = l.location_id and lower(l.city) like 'gal%';
 
 
 
 select * from angajati;
 select hire_date from angajati;
 select * from produse;
 
 select dog_id, name, join_date,
 months_between(
 join_date,
 (select min(join_date) from
 caini c, locatii l, produs p, produse po
 where c.location_id = l.location_id and 
 l.location_id = p.location_id and
 po.group_id = p.group_id
 and lower(po.prods_name) like 'jucarii')
 ) as "dif"
 from caini
 order by join_date;
  
 
 select min(join_date) from
 caini c, locatii l, produs p, produse po
 where c.location_id = l.location_id and 
 l.location_id = p.location_id and
 po.group_id = p.group_id
 and lower(po.prods_name) like 'jucarii';
 
 
 
 select 
 MONTHS_BETWEEN(
 (select max(hire_date) from angajati),
 (select min(hire_date) from angajati)
 )
 from dual;
 
 select max(hire_date) from angajati;
 select min(hire_date) from angajati;
 
 select least(select hire_date from angajati) from angajati;
 
 select 
 
 
 SELECT MONTHS_BETWEEN 
   (TO_DATE('02-02-1995','MM-DD-YYYY'),
    TO_DATE('01-01-1995','MM-DD-YYYY') ) "Months"
    FROM DUAL;


select * from angajati
where hire_date = (select max(hire_date) from angajati);

select * from produse
;

select decode(select prds.color from produse prds where prds.prod_id = p.prod_id), 'rosu', 'DA', 'NU' from dual;


describe locatii;
select DECODE ('a', 'a', 'b', 'c') from dual;

select prod_id, p.location_id, decode(p.color, 'rosu', 'DA', 'NU') as "rezultat"
from produs p, produse pr, locatii l
where p.group_id = pr.group_id and 
      pr.pret < (select pret from produse where lower(prods_name) like '%ochi%')
      and lower(l.city) like '%bucu%';
      
      
      
      select * from produs;
      
select p.location_id, city, count(*),
case
when (nvl(city, null)) is null then 'Peste 130 de produse'
else 'Sub 130 de produse'
end as "Numar Produse"
from produs p, locatii l
where nvl(color, NULL) is null and p.location_id = l.location_id
group by p.location_id, city
order by p.location_id;
    
      
select p.location_id, city, count(*)
from produs p, locatii l
where nvl(color, NULL) is null and p.location_id = l.location_id
group by p.location_id, city
order by p.location_id;

-------------------------EXERCITII--------------------------
--1
select unique concat(concat(concat(concat(concat('Angajatul ', last_name), ' cu jobul '), job_title), ' lucreaza in departamentul '), dep_name) 
 as "Descriere_angajati"
 from jobs j, departamente d, angajati a, locatii l
 where j.job_id = a.job_id and d.dep_id = a.dep_id and a.location_id = l.location_id and lower(l.city) like 'gal%';

--2
with medie_varsta(medie) as
(select avg(age) from caini)
select *
from caini c, medie_varsta mv
where c.age > mv.medie;

--3
select dog_id, name, join_date,
 months_between(
 join_date,
 last_day((select min(join_date) from
 caini c, locatii l, produs p, produse po
 where c.location_id = l.location_id and 
 l.location_id = p.location_id and
 po.group_id = p.group_id
 and lower(po.prods_name) like 'jucarii'))
 ) as "dif"
 from caini
 order by join_date;
 
 
 select min(join_date) from
 caini c, locatii l, produs p, produse po
 where c.location_id = l.location_id and 
 l.location_id = p.location_id and
 po.group_id = p.group_id
 and lower(po.prods_name) like 'jucarii';
 
 --4
 select prod_id, p.location_id, decode(p.color, 'rosu', 'DA', 'NU') as "rezultat"
from produs p, produse pr, locatii l
where p.group_id = pr.group_id and 
      pr.pret < (select pret from produse where lower(prods_name) like '%ochi%')
      and lower(l.city) like '%bucu%';
      
--5
select p.location_id, city, count(*),
case
when (nvl(city, null)) is null then 'Peste 130 de produse'
else 'Sub 130 de produse'
end as "Numar Produse"
from produs p, locatii l
where nvl(color, NULL) is null and p.location_id = l.location_id
group by p.location_id, city
order by p.location_id;




select *  from produs;
select * from produse;

select pr.group_id, max(fab_date)
from produs p, produse pr
where p.group_id = pr.group_id
group by pr.group_id;










------------------------ACTUALIZARI/SUPRIMARI----------

update produse
set pret = 30
where brand_name = (select brand_name from produse where lower(brand_name) like '%trixie%' group by brand_name);
select * from produse;

update locatii
set manager_id = 373
where city = 'Ia?i';

update locatii
set phone_number = (select phone_number from angajati where ang_id = 373)
where city = 'Ia?i';
select * from locatii;

delete from caini
where age >= (select avg(age) from caini);

delete from produs
where to_date(exp_date,'DD.MM.YYYY') < (select sysdate from dual);



delete from angajati
where phone_number like ‘%1’;

