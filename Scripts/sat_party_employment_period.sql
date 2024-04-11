create or replace function vault.add_sat_party_employment_period (
  company varchar,
  employee varchar,
  starts date,
  ends date,
  rec_src char(12)
)
returns void as $$
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
  $$
language sql;

select vault.add_sat_party_employment_period('Deko Data', 'Adrián Vega Gómez', make_date(2023,10,10), make_date(2024,02,09), 'initial');
select vault.add_sat_party_employment_period('Pragsis Bidoop', 'Adrián Vega Gómez', make_date(2019,02,18), make_date(2023, 10, 07), 'initial');
select vault.add_sat_party_employment_period('Neoris', 'Adrián Vega Gómez', make_date(2016,11,23), make_date(2019,02,14), 'initial');

select * from vault.sat_party_employment_period;

select company.party_name, employee.party_name, period.starts, period.ends
from  vault.sat_party_employment_period period
inner join vault.lnk_party_employment lpe on period.lnk_party_employment_key = lpe.lnk_party_employment_key
inner join vault.hub_party company on company.hub_party_key = lpe.hub_party_key_company
inner join vault.hub_party employee on employee.hub_party_key = lpe.hub_party_key_employee

