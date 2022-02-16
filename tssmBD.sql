
/*
tabla direccciones
*/
create table street_address(
    address_id int not null,
    st_address varchar(50) not null,
    city varchar(20) not null,
    departament varchar(20) not null,
    primary key (address_id)
);

/*
tabla tipo de clientes
*/
create table customer_type(
    cust_type_id int not null,
    cust_type varchar(20) not null,
    primary key (cust_type_id)
);

/*
tabla tipo de planes moviles
*/
create table phone_plan(
    phone_plan_id int not null,
    price money not null,
    gb_cloud numeric(4, 2) not null,
    gb_share numeric(4, 2) not null,
    unlimited_min boolean not null,
    unlimited_sms boolean not null,
    minutes int not null,
    netflix int not null,
    primary key (tel_plan_id)
);


/*
tabla clientes
*/
create table customer(
    customer_id int not null,
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
tabla lineas telefónicas
*/
create table phone_number(
    phone_number_id int not null,
    customer_id int not null,
    primary key (phone_number),
    foreign key (customer_id) references customer(customer_id)
);

