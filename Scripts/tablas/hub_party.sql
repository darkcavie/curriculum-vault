create table if not exists vault.hub_party (
  hub_party_key char(32) not null primary key,
  party_name varchar not null,
  hub_load_dts timestamp not null,
  hub_rec_src varchar(12) not null
);

