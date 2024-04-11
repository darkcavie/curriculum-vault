create schema if not exists vault authorization curriculum;

create table if not exists vault.hub_party (
  hub_party_key char(32) not null primary key,
  party_name varchar not null,
  hub_load_dts timestamp not null,
  hub_rec_src varchar(12) not null
);

create table if not exists vault.lnk_party_employment (
  lnk_party_employment_key char(32) not null primary key,
  hub_party_key_company char(32) not null,
  hub_party_key_employee char(32) not null,
  lnk_load_dts timestamp not null,
  lnk_rec_src varchar(12) not null
);

create table if not exists vault.sat_party_employment_period (
  lnk_party_employment_key char(32) not null,
  sat_party_employment_period_key char(32) not null,
  starts date not null,
  ends date not null,
  sat_load_dts timestamp not null,
  sat_rec_src varchar(12) not null,
  constraint sat_party_employment_period_pk
    primary key (lnk_party_employment_key, sat_party_employment_period_key)
);

create table if not exists vault.sat_party_employment_start (
  lnk_party_employment_key char(32) not null,
  sat_party_employment_start_key char(32) not null,
  starts date not null,
  sat_load_dts timestamp not null,
  sat_rec_src varchar(12) not null,
  constraint sat_party_employment_start_pk
    primary key (lnk_party_employment_key, sat_party_employment_start_key)
);

