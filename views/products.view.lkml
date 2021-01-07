view: products {
  view_label: "Contains product information"
  sql_table_name: "DATASETS"."PRODUCTS"
    ;;
  drill_fields: [product_id]

  dimension: product_id {
    description: "Unique product identifier"
    primary_key: yes
    type: string
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: product_category_name {
    description: "Root category of product, in Portuguese."
    type: string
    sql: ${TABLE}."PRODUCT_CATEGORY_NAME" ;;
  }

  dimension: product_description_length {
    description: "Number of characters extracted from the product name."
    type: number
    sql: ${TABLE}."PRODUCT_DESCRIPTION_LENGTH" ;;
  }

  dimension: product_height_cm {
    description: "Product height measured in centimeters."
    type: number
    sql: ${TABLE}."PRODUCT_HEIGHT_CM" ;;
  }

  dimension: product_length_cm {
    description: "Product length measured in centimeters."
    type: number
    sql: ${TABLE}."PRODUCT_LENGTH_CM" ;;
  }

  dimension: product_name_length {
    description: "Number of characters extracted from the product name."
    type: number
    sql: ${TABLE}."PRODUCT_NAME_LENGTH" ;;
  }

  dimension: product_photos_qty {
    description: "Number of product published photos"
    type: number
    sql: ${TABLE}."PRODUCT_PHOTOS_QTY" ;;
  }

  dimension: product_weight_g {
    description: "Product weight measured in grams."
    type: number
    sql: ${TABLE}."PRODUCT_WEIGHT_G" ;;
  }

  dimension: product_width_cm {
    description: "Product width measured in centimeters."
    type: number
    sql: ${TABLE}."PRODUCT_WIDTH_CM" ;;
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [product_id, product_category_name, order_items.count]
  }

  measure: avg_product_weight {
    label: "Average Product Weight (g)"
    description: "Average Product Weight (g)"
    type: average
    sql: ${TABLE}.product_weight_g ;;
    value_format: "0.0"
  }

  measure: avg_product_length {
    label: "Average Product Length (cm)"
    description: "Average Product Length (cm)"
    type: average
    sql: ${TABLE}.product_name_length ;;
    value_format: "0.0"
  }

  measure: avg_product_height {
    label: "Average Product Height (cm)"
    description: "Average Product Height (cm)"
    type: average
    sql: ${TABLE}.product_height_cm ;;
    value_format: "0.0"
  }
}
