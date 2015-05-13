# (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License v2.0 which accompany this distribution.
#
# The Apache License is available at
# http://www.apache.org/licenses/LICENSE-2.0
#
####################################################
# Deletes a file or folder.
#
# Inputs:
#   - source - path of source file or folder to be deleted
# Outputs:
#   - message - error message in case of error
# Results:
#   - SUCCESS - file or folder was successfully deleted
#   - FAILURE - file or folder was not deleted due to error
####################################################
namespace: io.cloudslang.base.files

operation:
  name: delete
  
  inputs:
    - source

  action:
    python_script: |
        import shutil, sys, os
        try:
          if os.path.isfile(source):
            os.remove(source)
            message = source + " was removed"
            result = True
          elif os.path.isdir(source):
            shutil.rmtree(source)
            message = source + " was removed"
            result = True
          else:
            message = "No such file or folder"
            result = False
        except Exception as e:
          message = e
          result = False

  outputs:
    - message

  results:
    - SUCCESS: result
    - FAILURE