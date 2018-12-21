with source as (
    
    select * from {{ ref('order_item_upload') }}
    
),

renamed as (
    
    select
        --ids
        id as order_item_id,
        order_id,
        nullif(product_id,'') as product_id,
        
        --dimensions
        
        price,
        quantity,
        nullif(size,'') as size,
        nullif(color,'') as color
        
    from source
    
)

select * from renamed