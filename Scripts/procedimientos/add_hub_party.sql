create or replace procedure vault.add_hub_party(
	party_name_arg varchar, 
	origin char(12)
)
language sql 
as $$
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
	on conflict (hub_party_key) do nothing
$$;
