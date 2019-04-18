# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

raise "This file is for documentation purposes only."

module Google
  module Api
    # An indicator of the behavior of a given field (for example, that a field
    # is required in requests, or given as output but ignored as input).
    # This **does not** change the behavior in protocol buffers itself; it only
    # denotes the behavior and may affect how API tooling handles the field.
    #
    # Note: This enum **may** receive new values in the future.
    module FieldBehavior
      # Conventional default for enums. Do not use this.
      FIELD_BEHAVIOR_UNSPECIFIED = 0

      # Specifically denotes a field as optional.
      # While all fields in protocol buffers are optional, this may be specified
      # for emphasis if appropriate.
      OPTIONAL = 1

      # Denotes a field as required.
      # This indicates that the field **must** be provided as part of the request,
      # and failure to do so will cause an error (usually `INVALID_ARGUMENT`).
      REQUIRED = 2

      # Denotes a field as output only.
      # This indicates that the field is provided in responses, but including the
      # field in a request does nothing (the server *must* ignore it and
      # *must not* throw an error as a result of the field's presence).
      OUTPUT_ONLY = 3

      # Denotes a field as input only.
      # This indicates that the field is provided in requests, and the
      # corresponding field is not included in output.
      INPUT_ONLY = 4

      # Denotes a field as immutable.
      # This indicates that the field may be set once in a request to create a
      # resource, but may not be changed thereafter.
      IMMUTABLE = 5
    end
  end
end
