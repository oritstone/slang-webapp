# (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
# The Apache License is available at
# http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
# Moves a file or folder.
#
# Inputs:
#   - source - path of source file or folder to be moved
#   - destination - path to move file or folder to
# Outputs:
#   - message - error message in case of error
# Results:
#   - SUCCESS - file or folder was successfully moved
#   - FAILURE - file or folder was not moved due to an error
####################################################
namespace: io.cloudslang.base.files

operation:
  name: move
  
  inputs:
    - source
    - destination

  action:
    python_script: |
        import shutil, sys
        try:
          shutil.move(source,destination)
          message = ("moving done successfully")
          result = True
        except Exception as e:
          message = e
          result = False

  outputs:
    - message

  results:
    - SUCCESS: result
    - FAILURE
