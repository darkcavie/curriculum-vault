create or replace function vault.add_hub_party(party_name_arg varchar, origin char(12))
returns void as 
$$
begin 
	insert into vault.hub_party (
	  hub_party_key,
	  party_name,
	  hub_load_dts,
	  hub_rec_src
	) values (
	  md5(party_name_arg),
	  party_name_arg,
	  now(),
	  'initial'
	)
	on conflict (hub_party_key) do nothing;
end;
$$
language plpgsql;


select vault.add_hub_party('Adrián Vega Gómez', 'initial');
select vault.add_hub_party('Deko Data', 'initial');
select vault.add_hub_party('Accenture', 'initial');
select vault.add_hub_party('Pragsis Bidoop', 'initial');

select * from vault.hub_party hp;