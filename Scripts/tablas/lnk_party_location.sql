create table if not exists vault.lnk_party_location (
  lnk_party_location_key char(32) not null primary key,
  hub_party_key char(32) not null,
  hub_location_key char(32) not null,
  lnk_load_dts timestamp not null,
  lnk_rec_src varchar(12) not null
);
