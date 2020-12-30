view: product_category_name_translation {
  sql_table_name: "DATASETS"."PRODUCT_CATEGORY_NAME_TRANSLATION"
    ;;

  dimension: product_category_name {
    type: string
    sql: ${TABLE}."PRODUCT_CATEGORY_NAME" ;;
  }

  dimension: product_category_name_english {
    type: string
    sql: ${TABLE}."PRODUCT_CATEGORY_NAME_ENGLISH" ;;
  }

  measure: count {
    type: count
    drill_fields: [product_category_name]
  }
}
