view: products {
  view_label: "Contains product information"
  sql_table_name: "DATASETS"."PRODUCTS"
    ;;
  drill_fields: [product_id]

  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: prod_desc_len {
    type: number
    sql: ${TABLE}."PROD_DESC_LEN" ;;
  }

  dimension: product_category_name {
    type: string
    sql: ${TABLE}."PRODUCT_CATEGORY_NAME" ;;
  }

  dimension: product_description_length {
    type: number
    sql: ${TABLE}."PRODUCT_DESCRIPTION_LENGTH" ;;
  }

  dimension: product_height_cm {
    type: number
    sql: ${TABLE}."PRODUCT_HEIGHT_CM" ;;
  }

  dimension: product_length_cm {
    type: number
    sql: ${TABLE}."PRODUCT_LENGTH_CM" ;;
  }

  dimension: product_name_length {
    type: number
    sql: ${TABLE}."PRODUCT_NAME_LENGTH" ;;
  }

  dimension: product_photos_qty {
    type: number
    sql: ${TABLE}."PRODUCT_PHOTOS_QTY" ;;
  }

  dimension: product_weight_g {
    type: number
    sql: ${TABLE}."PRODUCT_WEIGHT_G" ;;
  }

  dimension: product_width_cm {
    type: number
    sql: ${TABLE}."PRODUCT_WIDTH_CM" ;;
  }

  measure: count {
    type: count
    drill_fields: [product_id, product_category_name, order_items.count]
  }
}
