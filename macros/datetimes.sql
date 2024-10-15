{% macro get_date_parts(date_column)%}

   (Select struct (
         {{date_column}} as originalDate,
         Extract(Year from {{date_column}}) as year,
         Extract(MONTH from {{date_column}}) as month,
         Extract( DAY from {{date_column}}) as day,
         Extract(DAYOFWEEK from {{date_column}}) as day_of_week,
         Extract(DAYOFYEAR from {{date_column}}) as day_of_year,
         Extract(WEEK from {{date_column}}) as week,
         Extract(QUARTER from {{date_column}}) as Quarter,
   ))

   {%endmacro%}