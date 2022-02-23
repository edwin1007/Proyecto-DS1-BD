
/*
tabla: direccciones de clientes
*/
create table address(
    address_id serial,
    st_address varchar(50) not null,
    city varchar(20) not null,
    departament varchar(20) not null,
    primary key (address_id)
);

/*
tabla: tipo de clientes natural/corporativo
*/
create table customer_type(
    cust_type_id serial,
    cust_type varchar(20) not null,
    primary key (cust_type_id)
);

/*
tabla: tipo de planes moviles
*/
create table phone_plan(
    phone_plan_id serial,
    price money not null,
    gb_cloud numeric(4, 2) not null,
    gb_share numeric(4, 2) not null,
    unlimited_min boolean not null,
    unlimited_sms boolean not null,
    minutes int not null,
    netflix int not null,
    description varchar(500) not null,
    primary key (phone_plan_id)
);


/*
tabla: clientes
*/
create table customer(
    customer_id serial,
    cust_name varchar(50) not null,
    email varchar(50) not null,
    address_id int not null,
    cust_type_id int not null,
    phone_plan_id int not null,
    primary key (customer_id),
    foreign key (address_id) references street_address(address_id),
    foreign key (cust_type_id) references customer_type(cust_type_id),
    foreign key (phone_plan_id) references phone_plan(phone_plan_id)
);

/*
tabla: lineas telefónicas
se crea una base para genera los números telefónicos.
*/
create sequence phone_seq 
start with 4001012020 increment by 23;

create table phone_number(
    number_id int default nextval('phone_seq'),
    customer_id int not null,
    primary key (phone_number_id),
    foreign key (customer_id) references customer(customer_id)
);

ALTER SEQUENCE phone_seq start with 4001012020 increment by 23;

/*
tabla: periodo del cliente activado y/o registrado
*/
create table period(
    period_id serial,
    start_p datetime not null,
    end_p datetime not null,
    primary key (period_id)
);

insert into period(start_p, end_p)
values
    ('12-12-2019', '12-11-2020');

/*
tabla: cobros que se hacen al cliente
*/
create sequence payment_seq 
start with 10101012 increment by 25;

create table payment(
    payment_id int default nextval('payment_seq'),
    basic_pay money not null,
    extra_pay_min money not null,
    extra_pay_data money not null,
    taxes money not null,
    customer_id int not null,
    period_id int not null,
    primary key (payment_id),
    foreign key (customer_id) references customer(customer_id),
    foreign key (period_id) references period(period_id)
);

/*
tabla: servicios
*/
create table services(
    service_id serial,
    service_type varchar(20) not null,
    primary key (service_id)
);

/*
tabla: creacion de registros.
*/
create table register_cust(
    register_id serial,
    date_time datetime not null,
    flux float not null,
    phone_number_id int not null,
    service_id int not null,
    period_id int not null,
    primary key (register_id),
    foreign key (phone_number_id) references phone_number(phone_number_id),
    foreign key (service_id) references services(service_id),
    foreign key (period_id) references period(period_id)
);

ALTER TABLE nombre_actual RENAME TO nuevo_nombre;

ALTER TABLE nombre_tabla RENAME COLUMN actual_nombre_columna TO nuevo_nombre_columna;

ALTER TABLE nombre_tabla ADD COLUMN nombre_columna tipo_de_dato;

ALTER TABLE nombre_tabla DROP COLUMN nombre_columna;

select price
from customer cs
join phone_plan pp on cs.customer_id = pp.phone_plan_id
where customer_id = 1;