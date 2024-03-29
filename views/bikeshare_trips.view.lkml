view: bikeshare_trips {
  sql_table_name: `looker_bike_dataset.bikeshare_trips`
    ;;

  dimension: bike_number {
    type: number
    sql: ${TABLE}.bike_number ;;
  }

  measure: duration_sec {
    type: sum
    sql: ${TABLE}.duration_sec ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension: end_station_id {
    type: number
    sql: ${TABLE}.end_station_id ;;
  }

  dimension: end_station_name {
    type: string
    sql: ${TABLE}.end_station_name ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: start_station_id {
    type: number
    sql: ${TABLE}.start_station_id ;;
  }

  dimension: start_station_name {
    type: string
    sql: ${TABLE}.start_station_name ;;
  }

  dimension: subscriber_type {
    type: string
    sql: ${TABLE}.subscriber_type ;;
  }

  dimension: trip_id {
    type: number
    sql: ${TABLE}.trip_id ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    type: count
    drill_fields: [start_station_name, end_station_name]
  }
}
