view: bikeshare_stations {
  sql_table_name: `looker_bike_dataset.bikeshare_stations`
    ;;

  dimension: dockcount {
    type: number
    sql: ${TABLE}.dockcount ;;
  }

  dimension_group: installation {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.installation_date ;;
  }

  dimension: landmark {
    type: string
    sql: ${TABLE}.landmark ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude:${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: station_id {
    type: number
    sql: ${TABLE}.station_id ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
