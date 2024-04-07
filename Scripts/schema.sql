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
  lnk_rec_src varchar(12) not null,
  constraint lnk_party_employment_company_fk
    foreign key (hub_party_key_company)
    references vault.hub_party (hub_party_key)
    on delete no action,
  constraint lnk_party_employment_employee_fk
    foreign key (hub_party_key_employee)
    references vault.hub_party (hub_party_key)
    on delete no action
);

create table if not exists vault.sat_party_employment_period (
  sat_party_employment_period_key char(32) not null primary key,
  lnk_party_employment_key char(32) not null,
  starts date not null,
  ends date not null,
  sat_load_dts timestamp not null,
  sat_rec_src varchar(12) not null,
  constraint sat_party_employment_period_fk
    foreign key (lnk_party_employment_key)
    references vault.lnk_party_employment (lnk_party_employment_key)
    on delete no action
);

create table if not exists vault.sat_party_employment_start (
  sat_party_employment_start_key char(32) not null primary key,
  lnk_party_employment_key char(32) not null,
  starts date not null,
  sat_load_dts timestamp not null,
  sat_rec_src varchar(12) not null,
  constraint sat_party_employment_period_fk
    foreign key (lnk_party_employment_key)
    references vault.lnk_party_employment (lnk_party_employment_key)
    on delete no action
);

