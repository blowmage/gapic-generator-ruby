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

require "grpc"
require "google/showcase/v1alpha3/echo_pb"

module Google
  module Showcase
    module V1alpha3
      module Echo
        # This service is used showcase the four main types of rpcs - unary, server
        # side streaming, client side streaming, and bidirectional streaming. This
        # service also exposes methods that explicitly implement server delay, and
        # paginated calls.
        class Service
          include ::GRPC::GenericService

          self.marshal_class_method = :encode
          self.unmarshal_class_method = :decode
          self.service_name = "google.showcase.v1alpha3.Echo"

          # This method simply echos the request. This method is showcases unary rpcs.
          rpc :Echo,
              Google::Showcase::V1alpha3::EchoRequest,
              Google::Showcase::V1alpha3::EchoResponse

          # This method split the given content into words and will pass each word back
          # through the stream. This method showcases server-side streaming rpcs.
          rpc :Expand,
              Google::Showcase::V1alpha3::ExpandRequest,
              stream(Google::Showcase::V1alpha3::EchoResponse)

          # This method will collect the words given to it. When the stream is closed
          # by the client, this method will return the a concatenation of the strings
          # passed to it. This method showcases client-side streaming rpcs.
          rpc :Collect,
              stream(Google::Showcase::V1alpha3::EchoRequest),
              Google::Showcase::V1alpha3::EchoResponse

          # This method, upon receiving a request on the stream, the same content will
          # be passed  back on the stream. This method showcases bidirectional
          # streaming rpcs.
          rpc :Chat,
              stream(Google::Showcase::V1alpha3::EchoRequest),
              stream(Google::Showcase::V1alpha3::EchoResponse)

          # This is similar to the Expand method but instead of returning a stream of
          # expanded words, this method returns a paged list of expanded words.
          rpc :PagedExpand,
              Google::Showcase::V1alpha3::PagedExpandRequest,
              Google::Showcase::V1alpha3::PagedExpandResponse

          # This method will wait the requested amount of and then return.
          # This method showcases how a client handles a request timing out.
          rpc :Wait,
              Google::Showcase::V1alpha3::WaitRequest,
              Google::Longrunning::Operation
        end

        Stub = Service.rpc_stub_class
      end
    end
  end
end
