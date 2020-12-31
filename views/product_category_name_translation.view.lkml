view: product_category_name_translation {
  view_label: "Contains the English translations of product categories"
  sql_table_name: "DATASETS"."PRODUCT_CATEGORY_NAME_TRANSLATION"
    ;;

  dimension: product_category_name {
    label: "Root category of product, in Portuguese."
    type: string
    sql: ${TABLE}."PRODUCT_CATEGORY_NAME" ;;
  }

  dimension: product_category_name_english {
    label: "Root category of product, in English."
    type: string
    sql: ${TABLE}."PRODUCT_CATEGORY_NAME_ENGLISH" ;;
  }

  measure: count {
    label: "Count"
    type: count
    drill_fields: [product_category_name]
  }
}
