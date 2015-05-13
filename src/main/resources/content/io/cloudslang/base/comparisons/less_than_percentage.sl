#   (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
#   All rights reserved. This program and the accompanying materials
#   are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
#   The Apache License is available at
#   http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
# Checks if one percentage is less than another.
#
# Inputs:
#   - first_percentage - string which represents a percentage - Example: 50%
#   - second_percentage - string which represents a percentage - Example: 50%
# Outputs:
#   - error_message - error message if error occurred
# Results:
#   - LESS - first_percentage < second_percentage
#   - MORE - first_percentage >= second_percentage
#   - FAILURE - input was not in correct format
####################################################

namespace: io.cloudslang.base.comparisons

operation:
  name: less_than_percentage
  inputs:
    - first_percentage
    - second_percentage
  action:
    python_script: |
      error_message = ""
      result = ""
      first_percentage_nr = first_percentage.replace("%", "")
      second_percentage_nr = second_percentage.replace("%", "")
      try:
          int_value1 = int(first_percentage_nr)
          int_value2 = int(second_percentage_nr)
          result = int_value1 < int_value2
      except ValueError:
          error_message = "Both inputs have to be integers"
  outputs:
    - error_message
  results:
    - LESS: error_message == "" and result
    - MORE: error_message == "" and not result
    - FAILURE