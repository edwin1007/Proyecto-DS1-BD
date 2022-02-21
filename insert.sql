
create table phone_plan(
    phone_plan_id serial,
    price money not null,
    gb_cloud numeric(4, 2) not null,
    gb_share numeric(4, 2) not null,
    unlimited_min boolean not null,
    unlimited_sms boolean not null,
    minutes int not null,
    netflix int not null,
    primary key (phone_plan_id)
);

insert into phone_plan(price, gb_cloud, gb_share, unlimited_min, unlimited_sms, minutes, netflix)
values
    (34990, 5, 2, false, true, 500, 0),
    (49990, 5, 5, false, true, 750, 0),
    (59990, 5, 10, false, true, 1000, 0),
    (75990, 5, 12, true, true, 10000, 1);