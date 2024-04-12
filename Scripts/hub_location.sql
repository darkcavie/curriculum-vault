create or replace function vault.add_hub_location(country varchar(32), city varchar(32), origin char(12))
returns void
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
$$
language sql;

select vault.add_hub_location('España', 'Madrid', 'initial');
select vault.add_hub_location('México', 'Ciudad de México', 'initial');
select vault.add_hub_location('México', 'San Luis Potosí', 'initial');
select vault.add_hub_location('México', 'Tampico', 'initial');

select * from vault.hub_location;
