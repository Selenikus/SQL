select 
ad_date , 
campaign_id,
sum(spend) as total_spend,
sum(impressions) as total_impressions,
sum(clicks) as total_clicks,
sum(value) as total_value,

round(sum(cast(spend as decimal )) / sum(cast(facebook_ads_basic_daily.clicks 
as decimal )),2) as CPC, 

case when 
sum(cast(impressions as decimal)) = 0 then null else  
round(sum(cast(spend as decimal ))/ sum(cast(impressions 
as decimal )) * 1000, 2)
end as CPM,

CASE when 
sum(cast(impressions as decimal)) =0 then null else 
round(sum(cast(clicks as decimal )) /sum(cast(impressions
as decimal )) * 100,2)
end as CTR,

Round(((SUM(cast(value as decimal (10,2))) - SUM(cast(spend as decimal (10,2)))) / nullif(SUM(cast(spend as decimal (10,2))), 0 )) * 100,2)
as ROMI

from facebook_ads_basic_daily

where clicks > 0

group by ad_date , campaign_id

order by ad_date desc ;




    SELECT campaign_id,
           Round(((SUM(cast(value as decimal (10,2))) - SUM(cast(spend as decimal (10,2)))) / nullif(SUM(cast(spend as decimal (10,2))), 0 )) * 100,2)
as ROMI
    FROM facebook_ads_basic_daily fabd 
    GROUP BY campaign_id
    HAVING SUM(spend) > 500000
order by romi desc
limit 1 ;






      
      
                                                                                                  