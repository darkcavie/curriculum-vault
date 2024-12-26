create table if not exists vault.sat_party_employment_period (
  lnk_party_employment_key char(32) not null,
  sat_party_employment_period_key char(32) not null,
  starts date,
  ends date,
  sat_load_dts timestamp not null,
  sat_rec_src varchar(12) not null,
  constraint sat_party_employment_period_pk
    primary key (lnk_party_employment_key, sat_party_employment_period_key)
);
