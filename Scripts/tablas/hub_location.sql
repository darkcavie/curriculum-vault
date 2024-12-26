create table if not exists vault.hub_location (
  hub_location_key char(32) not null primary key,
  country varchar(32) not null,
  city varchar(32) not null,
  hub_load_dts timestamp not null,
  hub_rec_src varchar(12) not null
);
