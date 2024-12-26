create or replace procedure vault.add_sat_party_employment_period (
  company varchar,
  employee varchar,
  starts date,
  ends date,
  rec_src char(12)
)
language sql
as $$
  insert into vault.sat_party_employment_period (
    lnk_party_employment_key,
    sat_party_employment_period_key,
    starts,
    ends,
    sat_load_dts,
    sat_rec_src
  )
  values (
    md5(concat(company, '||', employee)),
    md5(concat(to_char(starts, 'YYYY-MM-DD'), '||', to_char(starts, 'YYYY-MM-DD'))),
    starts,
    ends,
    now(),
    rec_src
  )
  on conflict (lnk_party_employment_key, sat_party_employment_period_key) do nothing
$$;
