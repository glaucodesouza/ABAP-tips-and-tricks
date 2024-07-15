              CLEAR: z.
              PERFORM get_info IN PROGRAM sapxpto IF FOUND
              USING    x
                       y
              CHANGING z.
