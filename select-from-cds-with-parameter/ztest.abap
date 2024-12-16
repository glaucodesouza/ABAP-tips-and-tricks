  SELECT DISTINCT
         a~field1,
         a~field2,
         b~field3,
         b~field4,
         b~field5
      FROM zcds_test( p_date = @v_date ) AS a
      LEFT OUTER JOIN zfitable AS b
                                  ON  b~field1                  = a~field1
    WHERE ( b~field1 IS NOT NULL       AND b~field1      = @p_param1 AND
            b~field2 IS NOT NULL  AND b~field2 = @p_param2 )
     INTO TABLE @DATA(t_query).
