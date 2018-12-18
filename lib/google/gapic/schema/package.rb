# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module Google
  module Gapic
    module Schema
      class Package
        attr_accessor :api

        def initialize api
          @api = api
        end
      end
    end
  end
end

# package
#   -> api (Google::Gapic::Schema::Api)
#   -> version
#   -> gem_name
#   -> gem_version (???)
#   -> services
#     -> service
#       -> source_file
#       -> require_file (ruby_file? client_file?)
#       -> service_filepath # ruby filepath to be required for the services file
#       -> source_dependencies
#       -> package
#       -> name
#       -> description
#       -> api_address
#       -> api_port
#       -> all_scopes
#       -> proto_namespace
#       -> ruby_namespace
#       -> rpcs
#         -> rpc
#           -> name
#           -> arguments
#             -> name
#             -> type
#             -> ruby_type
#           -> request
#           -> response
#           -> comments
#           -> stream_request?
#           -> stream_response?
#       -> json_config_filename
#       -> lro? long_running_operations?)
