with source as (
    
    select * from {{ ref('customer_upload') }}
    
),

renamed as (
    
    select
        --ids
        id as customer_id,
        nullif(email,'') as email,
        
        --dimensions
        
        nullif(first_name,'') as first_name,
        nullif(last_name,'') as last_name,
        nullif(gender,'') as gender,
        
        accepts_marketing,
        
        --dates
        created_at
        
    from source
    
)

select * from renamed