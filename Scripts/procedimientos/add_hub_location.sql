create or replace procedure vault.add_hub_location(
	country varchar(32), 
	city varchar(32), 
	origin char(12)
)
language sql
as $$
  insert into vault.hub_location (
    hub_location_key,
    country,
    city,
    hub_load_dts,
    hub_rec_src
  )
  values (
    md5(concat(country, '||', city)),
    country,
    city,
    now(),
    origin
  )
  on conflict (hub_location_key) do nothing
$$;