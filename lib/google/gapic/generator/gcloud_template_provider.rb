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
    module Generator
      # Provides templates found at a given path.
      class GcloudTemplateProvider
        # Initializes the GcloudTemplateProvider.
        #
        # @param path [string] The path to search for erb files.
        def initialize path
          @path = path
        end

        def package_template
          File.join @path, "package.erb"
        end

        def service_template
          File.join @path, "service.erb"
        end

        # def gemspec_template
        #   File.join @path, "gemspec.erb"
        # end
        #
        # def rakefile_template
        #   File.join @path, "rakefile.erb"
        # end
      end
    end
  end
end
