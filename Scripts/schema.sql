create schema if not exists vault authorization curriculum;

create table if not exists vault.hub_party (
  hub_party_key char(32) not null primary key,
  party_name varchar not null,
  hub_load_dts date not null,
  hub_rec_src varchar(12) not null
);

create table if not exists vault.lnk_party_employment (
  lnk_party_employment char(32) not null primary key,
  hub_party_key_company char(32) not null,
  hub_party_key_employee char(32) not null,
  lnk_load_dts date not null,
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

