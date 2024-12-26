create or replace procedure vault.add_lnk_party_employment (
	company varchar,
	employee varchar,
	rec_src char(12)
)
language sql
as $$
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
$$;