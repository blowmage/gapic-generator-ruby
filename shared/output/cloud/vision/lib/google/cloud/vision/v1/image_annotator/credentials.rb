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

require "googleauth"

module Google
  module Cloud
    module Vision
      module V1
        module ImageAnnotator
          class Credentials < Google::Auth::Credentials
            SCOPE = ["https://www.googleapis.com/auth/cloud-platform", "https://www.googleapis.com/auth/cloud-vision"].freeze
            PATH_ENV_VARS = %w[VISION_CREDENTIALS
                               VISION_KEYFILE
                               GOOGLE_CLOUD_CREDENTIALS
                               GOOGLE_CLOUD_KEYFILE
                               GCLOUD_KEYFILE].freeze
            JSON_ENV_VARS = %w[VISION_CREDENTIALS_JSON
                               VISION_KEYFILE_JSON
                               GOOGLE_CLOUD_CREDENTIALS_JSON
                               GOOGLE_CLOUD_KEYFILE_JSON
                               GCLOUD_KEYFILE_JSON].freeze
            DEFAULT_PATHS = ["~/.config/google_cloud/application_default_credentials.json"].freeze
          end
        end
      end
    end
  end
end
