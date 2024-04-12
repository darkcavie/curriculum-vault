create or replace function vault.add_sat_party_employment_start (
  company varchar,
  employee varchar,
  starts date,
  rec_src char(12)
)
returns void as $$
  insert into vault.sat_party_employment_start (
    lnk_party_employment_key,
    sat_party_employment_start_key,
    starts,
    sat_load_dts,
    sat_rec_src
  )
  values (
    md5(concat(company, '||', employee)),
    md5(to_char(starts, 'YYYY-MM-DD')),
    starts,
    now(),
    rec_src
  )
  on conflict (lnk_party_employment_key, sat_party_employment_start_key) do nothing
  $$
language sql;

select vault.add_sat_party_employment_start('Deko Data', 'Adrián Vega Gómez', make_date(2023,10,10), 'initial');
select vault.add_sat_party_employment_start('Pragsis Bidoop', 'Adrián Vega Gómez', make_date(2019,02,18), 'initial');
select vault.add_sat_party_employment_start('Neoris', 'Adrián Vega Gómez', make_date(2016,11,23), 'initial');

select * from vault.sat_party_employment_start;

select company.party_name, employee.party_name, start.starts
from  vault.sat_party_employment_start start
inner join vault.lnk_party_employment lpe on start.lnk_party_employment_key = lpe.lnk_party_employment_key
inner join vault.hub_party company on company.hub_party_key = lpe.hub_party_key_company
inner join vault.hub_party employee on employee.hub_party_key = lpe.hub_party_key_employee;

