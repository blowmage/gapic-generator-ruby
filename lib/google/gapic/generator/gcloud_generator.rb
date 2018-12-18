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

require 'erubis'
require 'google/gapic/generator/util'
require 'google/gapic/schema/package'

module Google
  module Gapic
    module Generator
      # The generator orchestrates the rendering of templates giving the
      # templates context for generation. Explicitly this means that every
      # template will be given two objects: a Google::Gapic::Schema::Api object
      # accessible through @api, and a Google::Gapic::Generator::Util object
      # accessible through @util.
      class GcloudGenerator
        # Initializes the generator.
        #
        # @param api [Google::Gapic::Schema::Api] the API to generate.
        # @param template_provider [Google::Gapic::TemplateProvider] provides
        #   the templates to render.
        def initialize api, template_provider
          @api = api
          @template_provider = template_provider
          @util = Util.new(template_provider)
        end

        def package
          @package ||= Schema::Package.new @api, @util
        end

        # Renders the template files giving them the context of the API.
        #
        # @return [Array<Google::Protobuf::Compiler::CodeGeneratorResponse::File>]
        #   The files that were generated for the API.
        def generate
          files = []

          package_template = Erubis::Eruby.new @template_provider.package_template
          package_contents = package_template.evaluate package: package
          File.write package.services_filename, package_contents
          files << File.new(package.services_filename)

          package.services.each do |service|
            service_template = Erubis::Eruby.new @template_provider.service_template
            service_contents = service_template.evaluate service: service
            File.write service.ruby_filename, service_contents
            files << File.new(service.ruby_filename)
          end

          files
        end
      end
    end
  end
end
