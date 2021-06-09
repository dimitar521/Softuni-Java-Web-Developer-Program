CREATE TABLE `models`(
`model_id`INT NOT NULL, 
`name`VARCHAR (50),
`manufacturer_id` INT
);
CREATE TABLE `manufacturers`(
`manufacturer_id` INT  NOT NULL  ,
`name` VARCHAR (50) ,
`established_on` DATE
);
INSERT INTO models VALUES
(101,'X1',1),
(102,'i6',1),
(103,'Model S',2),
(104,'Model X',2),
(105,'Model 3',2),
(106,'Nova',3);
INSERT INTO manufacturers VALUES
(1,'BMW','1916-03-01'),
(2,'Tesla','2003-01-01'),
(3,'Lada','1966-05-01');
ALTER TABLE models
ADD CONSTRAINT pk_model_id
PRIMARY KEY (model_id);
ALTER TABLE manufacturers
ADD CONSTRAINT pk_manufacturer_id
PRIMARY KEY(manufacturer_id);
ALTER TABLE models 
ADD CONSTRAINT fk_models_manufacturers
FOREIGN KEY (manufacturer_id)REFERENCES manufacturers(manufacturer_id);