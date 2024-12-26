create table if not exists vault.lnk_party_employment (
  lnk_party_employment_key char(32) not null primary key,
  hub_party_key_company char(32) not null,
  hub_party_key_employee char(32) not null,
  lnk_load_dts timestamp not null,
  lnk_rec_src varchar(12) not null
);

