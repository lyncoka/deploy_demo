DROP TABLE IF EXISTS t_demo;
CREATE TABLE if not exists  t_demo(
	name varchar(255),
	file_path varchar(1024)
);
insert into t_demo values('HCJ','HOLY SHIT DEPLOY');