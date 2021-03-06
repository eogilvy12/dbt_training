with source as (
    
    select * from {{ ref('order_upload') }}
    
),

renamed as (
    
    select
        --ids
        id as order_id,
        customer_id,
        nullif(email,'') as email,
        
        --dimensions
        
        total as total_price,
        nullif(ip_address,'') as ip_address,
        nullif(street_address,'') as street_address,
        nullif(billing_country_code,'') as billing_country_code,
        nullif(referral_domain,'') as referral_domain,
        nullif(referral_url,'') as referral_url,
        
        completed as is_completed,
        
        --dates
        created_at,
        case
            when completed = false then {{ dbt_utils.current_timestamp() }}
            else null
        end as cancelled_at
        
    from source
    
)

select * from renamed