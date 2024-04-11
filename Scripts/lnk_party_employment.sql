create or replace function vault.add_lnk_party_employment (company varchar, employee varchar, rec_src char(12))
returns void as $$
	insert into vault.lnk_party_employment (
	  lnk_party_employment_key,
	  hub_party_key_company,
	  hub_party_key_employee,
	  lnk_load_dts,
	  lnk_rec_src
	)
	values (
	  md5(concat(company,'||',employee)),
	  md5(company),
	  md5(employee),
	  now(),
	  rec_src
	)
	on conflict(lnk_party_employment_key) do nothing
	$$
language sql;

select vault.add_lnk_party_employment('Deko Data', 'Adrián Vega Gómez', 'initial');
select vault.add_lnk_party_employment('Pragsis Bidoop', 'Adrián Vega Gómez', 'initial');
select vault.add_lnk_party_employment('Neoris', 'Adrián Vega Gómez', 'initial');

select * from vault.lnk_party_employment lpe;

select company.party_name, employee.party_name from vault.lnk_party_employment lpe
inner join vault.hub_party company on company.hub_party_key = lpe.hub_party_key_company 
inner join vault.hub_party employee on employee.hub_party_key = lpe.hub_party_key_employee 
