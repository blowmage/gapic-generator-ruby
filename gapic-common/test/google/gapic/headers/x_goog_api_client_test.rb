# Copyright 2019 Google LLC
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

require "test_helper"
require "grpc"

describe Google::Gapic::Headers, :x_goog_api_client do
  it "with no arguments" do
    header = Google::Gapic::Headers.x_goog_api_client
    _(header).must_equal "gl-ruby/#{RUBY_VERSION} gax/#{Google::Gapic::Common::VERSION} grpc/#{GRPC::VERSION}"
  end

  it "prints lib when provided" do
    header = Google::Gapic::Headers.x_goog_api_client lib_name: "foo", lib_version: "bar"
    _(header).must_equal "gl-ruby/#{RUBY_VERSION} foo/bar gax/#{Google::Gapic::Common::VERSION} grpc/#{GRPC::VERSION}"
  end

  it "prints gax version when provided" do
    header = Google::Gapic::Headers.x_goog_api_client gax_version: "foobar"
    _(header).must_equal "gl-ruby/#{RUBY_VERSION} gax/foobar grpc/#{GRPC::VERSION}"
  end

  it "prints all arguments provided" do
    header = Google::Gapic::Headers.x_goog_api_client ruby_version: "1.2.3", lib_name: "foo", lib_version: "bar",
                                                      gax_version: "4.5.6", gapic_version: "7.8.9", grpc_version: "10.11.12"
    _(header).must_equal "gl-ruby/1.2.3 foo/bar gax/4.5.6 gapic/7.8.9 grpc/10.11.12"
  end
end
