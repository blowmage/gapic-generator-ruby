# frozen_string_literal: true

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
  module Showcase
    module V1alpha3
      module Identity
        module Paths
          ##
          # Create a fully-qualified User resource string.
          #
          # The resource will be in the following format:
          #
          # `users/{user_id}`
          #
          # @param user_id [String]
          #
          # @return [String]
          def user_path user_id:
            raise ArgumentError, "user_id is required" if user_id.nil?

            "users/#{user_id}"
          end
        end
      end
    end
  end
end
