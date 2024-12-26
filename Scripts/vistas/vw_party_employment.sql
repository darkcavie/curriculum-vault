create or replace view vault.vw_party_employment as
with satelite as (
	select
		lnk_party_employment_key,
		starts,
		ends,
		rank() over (
			partition by 
				lnk_party_employment_key,
				starts,
				ends
			order by 
				sat_load_dts desc
		) as ranked
	from vault.sat_party_employment_period
)
select
	company.hub_party_key as company_key,
	company.party_name as company_name,
	employee.hub_party_key as employee_name,
	employee.party_name as employee_key, 
	period.starts, 
	period.ends
from satelite as period
inner join vault.lnk_party_employment lpe on 
	period.lnk_party_employment_key = lpe.lnk_party_employment_key
inner join vault.hub_party company on 
	company.hub_party_key = lpe.hub_party_key_company
inner join vault.hub_party employee on 
	employee.hub_party_key = lpe.hub_party_key_employee
where 
	period.ranked = 1;

