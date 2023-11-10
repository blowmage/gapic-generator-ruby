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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "google/showcase/v1beta1/compliance_pb"

module Google
  module Showcase
    module V1beta1
      module Compliance
        module Rest
          ##
          # REST service stub for the Compliance service.
          # Service stub contains baseline method implementations
          # including transcoding, making the REST call, and deserialing the response.
          #
          class ServiceStub
            def initialize endpoint:, credentials:
              # These require statements are intentionally placed here to initialize
              # the REST modules only when it's required.
              require "gapic/rest"

              @client_stub = ::Gapic::Rest::ClientStub.new endpoint: endpoint, credentials: credentials,
                                                           numeric_enums: false,
                                                           raise_faraday_errors: false
            end

            ##
            # Baseline implementation for the repeat_data_body REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @param options [::Gapic::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #
            # @yield [result, operation] Access the result along with the TransportOperation object
            # @yieldparam result [::Google::Showcase::V1beta1::RepeatResponse]
            # @yieldparam operation [::Gapic::Rest::TransportOperation]
            #
            # @return [::Google::Showcase::V1beta1::RepeatResponse]
            #   A result object deserialized from the server's reply
            def repeat_data_body request_pb, options = nil
              raise ::ArgumentError, "request must be provided" if request_pb.nil?

              verb, uri, query_string_params, body = ServiceStub.transcode_repeat_data_body_request request_pb
              query_string_params = if query_string_params.any?
                                      query_string_params.to_h { |p| p.split "=", 2 }
                                    else
                                      {}
                                    end

              response = @client_stub.make_http_request(
                verb,
                uri:     uri,
                body:    body || "",
                params:  query_string_params,
                options: options
              )
              operation = ::Gapic::Rest::TransportOperation.new response
              result = ::Google::Showcase::V1beta1::RepeatResponse.decode_json response.body,
                                                                               ignore_unknown_fields: true

              yield result, operation if block_given?
              result
            end

            ##
            # Baseline implementation for the repeat_data_body_info REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @param options [::Gapic::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #
            # @yield [result, operation] Access the result along with the TransportOperation object
            # @yieldparam result [::Google::Showcase::V1beta1::RepeatResponse]
            # @yieldparam operation [::Gapic::Rest::TransportOperation]
            #
            # @return [::Google::Showcase::V1beta1::RepeatResponse]
            #   A result object deserialized from the server's reply
            def repeat_data_body_info request_pb, options = nil
              raise ::ArgumentError, "request must be provided" if request_pb.nil?

              verb, uri, query_string_params, body = ServiceStub.transcode_repeat_data_body_info_request request_pb
              query_string_params = if query_string_params.any?
                                      query_string_params.to_h { |p| p.split "=", 2 }
                                    else
                                      {}
                                    end

              response = @client_stub.make_http_request(
                verb,
                uri:     uri,
                body:    body || "",
                params:  query_string_params,
                options: options
              )
              operation = ::Gapic::Rest::TransportOperation.new response
              result = ::Google::Showcase::V1beta1::RepeatResponse.decode_json response.body,
                                                                               ignore_unknown_fields: true

              yield result, operation if block_given?
              result
            end

            ##
            # Baseline implementation for the repeat_data_query REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @param options [::Gapic::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #
            # @yield [result, operation] Access the result along with the TransportOperation object
            # @yieldparam result [::Google::Showcase::V1beta1::RepeatResponse]
            # @yieldparam operation [::Gapic::Rest::TransportOperation]
            #
            # @return [::Google::Showcase::V1beta1::RepeatResponse]
            #   A result object deserialized from the server's reply
            def repeat_data_query request_pb, options = nil
              raise ::ArgumentError, "request must be provided" if request_pb.nil?

              verb, uri, query_string_params, body = ServiceStub.transcode_repeat_data_query_request request_pb
              query_string_params = if query_string_params.any?
                                      query_string_params.to_h { |p| p.split "=", 2 }
                                    else
                                      {}
                                    end

              response = @client_stub.make_http_request(
                verb,
                uri:     uri,
                body:    body || "",
                params:  query_string_params,
                options: options
              )
              operation = ::Gapic::Rest::TransportOperation.new response
              result = ::Google::Showcase::V1beta1::RepeatResponse.decode_json response.body,
                                                                               ignore_unknown_fields: true

              yield result, operation if block_given?
              result
            end

            ##
            # Baseline implementation for the repeat_data_simple_path REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @param options [::Gapic::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #
            # @yield [result, operation] Access the result along with the TransportOperation object
            # @yieldparam result [::Google::Showcase::V1beta1::RepeatResponse]
            # @yieldparam operation [::Gapic::Rest::TransportOperation]
            #
            # @return [::Google::Showcase::V1beta1::RepeatResponse]
            #   A result object deserialized from the server's reply
            def repeat_data_simple_path request_pb, options = nil
              raise ::ArgumentError, "request must be provided" if request_pb.nil?

              verb, uri, query_string_params, body = ServiceStub.transcode_repeat_data_simple_path_request request_pb
              query_string_params = if query_string_params.any?
                                      query_string_params.to_h { |p| p.split "=", 2 }
                                    else
                                      {}
                                    end

              response = @client_stub.make_http_request(
                verb,
                uri:     uri,
                body:    body || "",
                params:  query_string_params,
                options: options
              )
              operation = ::Gapic::Rest::TransportOperation.new response
              result = ::Google::Showcase::V1beta1::RepeatResponse.decode_json response.body,
                                                                               ignore_unknown_fields: true

              yield result, operation if block_given?
              result
            end

            ##
            # Baseline implementation for the repeat_data_path_resource REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @param options [::Gapic::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #
            # @yield [result, operation] Access the result along with the TransportOperation object
            # @yieldparam result [::Google::Showcase::V1beta1::RepeatResponse]
            # @yieldparam operation [::Gapic::Rest::TransportOperation]
            #
            # @return [::Google::Showcase::V1beta1::RepeatResponse]
            #   A result object deserialized from the server's reply
            def repeat_data_path_resource request_pb, options = nil
              raise ::ArgumentError, "request must be provided" if request_pb.nil?

              verb, uri, query_string_params, body = ServiceStub.transcode_repeat_data_path_resource_request request_pb
              query_string_params = if query_string_params.any?
                                      query_string_params.to_h { |p| p.split "=", 2 }
                                    else
                                      {}
                                    end

              response = @client_stub.make_http_request(
                verb,
                uri:     uri,
                body:    body || "",
                params:  query_string_params,
                options: options
              )
              operation = ::Gapic::Rest::TransportOperation.new response
              result = ::Google::Showcase::V1beta1::RepeatResponse.decode_json response.body,
                                                                               ignore_unknown_fields: true

              yield result, operation if block_given?
              result
            end

            ##
            # Baseline implementation for the repeat_data_path_trailing_resource REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @param options [::Gapic::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #
            # @yield [result, operation] Access the result along with the TransportOperation object
            # @yieldparam result [::Google::Showcase::V1beta1::RepeatResponse]
            # @yieldparam operation [::Gapic::Rest::TransportOperation]
            #
            # @return [::Google::Showcase::V1beta1::RepeatResponse]
            #   A result object deserialized from the server's reply
            def repeat_data_path_trailing_resource request_pb, options = nil
              raise ::ArgumentError, "request must be provided" if request_pb.nil?

              verb, uri, query_string_params, body = ServiceStub.transcode_repeat_data_path_trailing_resource_request request_pb
              query_string_params = if query_string_params.any?
                                      query_string_params.to_h { |p| p.split "=", 2 }
                                    else
                                      {}
                                    end

              response = @client_stub.make_http_request(
                verb,
                uri:     uri,
                body:    body || "",
                params:  query_string_params,
                options: options
              )
              operation = ::Gapic::Rest::TransportOperation.new response
              result = ::Google::Showcase::V1beta1::RepeatResponse.decode_json response.body,
                                                                               ignore_unknown_fields: true

              yield result, operation if block_given?
              result
            end

            ##
            # Baseline implementation for the repeat_data_body_put REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @param options [::Gapic::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #
            # @yield [result, operation] Access the result along with the TransportOperation object
            # @yieldparam result [::Google::Showcase::V1beta1::RepeatResponse]
            # @yieldparam operation [::Gapic::Rest::TransportOperation]
            #
            # @return [::Google::Showcase::V1beta1::RepeatResponse]
            #   A result object deserialized from the server's reply
            def repeat_data_body_put request_pb, options = nil
              raise ::ArgumentError, "request must be provided" if request_pb.nil?

              verb, uri, query_string_params, body = ServiceStub.transcode_repeat_data_body_put_request request_pb
              query_string_params = if query_string_params.any?
                                      query_string_params.to_h { |p| p.split "=", 2 }
                                    else
                                      {}
                                    end

              response = @client_stub.make_http_request(
                verb,
                uri:     uri,
                body:    body || "",
                params:  query_string_params,
                options: options
              )
              operation = ::Gapic::Rest::TransportOperation.new response
              result = ::Google::Showcase::V1beta1::RepeatResponse.decode_json response.body,
                                                                               ignore_unknown_fields: true

              yield result, operation if block_given?
              result
            end

            ##
            # Baseline implementation for the repeat_data_body_patch REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @param options [::Gapic::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #
            # @yield [result, operation] Access the result along with the TransportOperation object
            # @yieldparam result [::Google::Showcase::V1beta1::RepeatResponse]
            # @yieldparam operation [::Gapic::Rest::TransportOperation]
            #
            # @return [::Google::Showcase::V1beta1::RepeatResponse]
            #   A result object deserialized from the server's reply
            def repeat_data_body_patch request_pb, options = nil
              raise ::ArgumentError, "request must be provided" if request_pb.nil?

              verb, uri, query_string_params, body = ServiceStub.transcode_repeat_data_body_patch_request request_pb
              query_string_params = if query_string_params.any?
                                      query_string_params.to_h { |p| p.split "=", 2 }
                                    else
                                      {}
                                    end

              response = @client_stub.make_http_request(
                verb,
                uri:     uri,
                body:    body || "",
                params:  query_string_params,
                options: options
              )
              operation = ::Gapic::Rest::TransportOperation.new response
              result = ::Google::Showcase::V1beta1::RepeatResponse.decode_json response.body,
                                                                               ignore_unknown_fields: true

              yield result, operation if block_given?
              result
            end

            ##
            # Baseline implementation for the get_enum REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::EnumRequest]
            #   A request object representing the call parameters. Required.
            # @param options [::Gapic::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #
            # @yield [result, operation] Access the result along with the TransportOperation object
            # @yieldparam result [::Google::Showcase::V1beta1::EnumResponse]
            # @yieldparam operation [::Gapic::Rest::TransportOperation]
            #
            # @return [::Google::Showcase::V1beta1::EnumResponse]
            #   A result object deserialized from the server's reply
            def get_enum request_pb, options = nil
              raise ::ArgumentError, "request must be provided" if request_pb.nil?

              verb, uri, query_string_params, body = ServiceStub.transcode_get_enum_request request_pb
              query_string_params = if query_string_params.any?
                                      query_string_params.to_h { |p| p.split "=", 2 }
                                    else
                                      {}
                                    end

              response = @client_stub.make_http_request(
                verb,
                uri:     uri,
                body:    body || "",
                params:  query_string_params,
                options: options
              )
              operation = ::Gapic::Rest::TransportOperation.new response
              result = ::Google::Showcase::V1beta1::EnumResponse.decode_json response.body, ignore_unknown_fields: true

              yield result, operation if block_given?
              result
            end

            ##
            # Baseline implementation for the verify_enum REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::EnumResponse]
            #   A request object representing the call parameters. Required.
            # @param options [::Gapic::CallOptions]
            #   Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #
            # @yield [result, operation] Access the result along with the TransportOperation object
            # @yieldparam result [::Google::Showcase::V1beta1::EnumResponse]
            # @yieldparam operation [::Gapic::Rest::TransportOperation]
            #
            # @return [::Google::Showcase::V1beta1::EnumResponse]
            #   A result object deserialized from the server's reply
            def verify_enum request_pb, options = nil
              raise ::ArgumentError, "request must be provided" if request_pb.nil?

              verb, uri, query_string_params, body = ServiceStub.transcode_verify_enum_request request_pb
              query_string_params = if query_string_params.any?
                                      query_string_params.to_h { |p| p.split "=", 2 }
                                    else
                                      {}
                                    end

              response = @client_stub.make_http_request(
                verb,
                uri:     uri,
                body:    body || "",
                params:  query_string_params,
                options: options
              )
              operation = ::Gapic::Rest::TransportOperation.new response
              result = ::Google::Showcase::V1beta1::EnumResponse.decode_json response.body, ignore_unknown_fields: true

              yield result, operation if block_given?
              result
            end

            ##
            # @private
            #
            # GRPC transcoding helper method for the repeat_data_body REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @return [Array(String, [String, nil], Hash{String => String})]
            #   Uri, Body, Query string parameters
            def self.transcode_repeat_data_body_request request_pb
              transcoder = Gapic::Rest::GrpcTranscoder.new
                                                      .with_bindings(
                                                        uri_method: :post,
                                                        uri_template: "/v1beta1/repeat:body",
                                                        body: "*",
                                                        matches: []
                                                      )
              transcoder.transcode request_pb
            end

            ##
            # @private
            #
            # GRPC transcoding helper method for the repeat_data_body_info REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @return [Array(String, [String, nil], Hash{String => String})]
            #   Uri, Body, Query string parameters
            def self.transcode_repeat_data_body_info_request request_pb
              transcoder = Gapic::Rest::GrpcTranscoder.new
                                                      .with_bindings(
                                                        uri_method: :post,
                                                        uri_template: "/v1beta1/repeat:bodyinfo",
                                                        body: "info",
                                                        matches: []
                                                      )
              transcoder.transcode request_pb
            end

            ##
            # @private
            #
            # GRPC transcoding helper method for the repeat_data_query REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @return [Array(String, [String, nil], Hash{String => String})]
            #   Uri, Body, Query string parameters
            def self.transcode_repeat_data_query_request request_pb
              transcoder = Gapic::Rest::GrpcTranscoder.new
                                                      .with_bindings(
                                                        uri_method: :get,
                                                        uri_template: "/v1beta1/repeat:query",
                                                        matches: []
                                                      )
              transcoder.transcode request_pb
            end

            ##
            # @private
            #
            # GRPC transcoding helper method for the repeat_data_simple_path REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @return [Array(String, [String, nil], Hash{String => String})]
            #   Uri, Body, Query string parameters
            def self.transcode_repeat_data_simple_path_request request_pb
              transcoder = Gapic::Rest::GrpcTranscoder.new
                                                      .with_bindings(
                                                        uri_method: :get,
                                                        uri_template: "/v1beta1/repeat/{info.f_string}/{info.f_int32}/{info.f_double}/{info.f_bool}/{info.f_kingdom}:simplepath",
                                                        matches: [
                                                          ["info.f_string", %r{^[^/]+/?$}, false],
                                                          ["info.f_int32", %r{^[^/]+/?$}, false],
                                                          ["info.f_double", %r{^[^/]+/?$}, false],
                                                          ["info.f_bool", %r{^[^/]+/?$}, false],
                                                          ["info.f_kingdom", %r{^[^/]+/?$}, false]
                                                        ]
                                                      )
              transcoder.transcode request_pb
            end

            ##
            # @private
            #
            # GRPC transcoding helper method for the repeat_data_path_resource REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @return [Array(String, [String, nil], Hash{String => String})]
            #   Uri, Body, Query string parameters
            def self.transcode_repeat_data_path_resource_request request_pb
              transcoder = Gapic::Rest::GrpcTranscoder.new
                                                      .with_bindings(
                                                        uri_method: :get,
                                                        uri_template: "/v1beta1/repeat/{info.f_string}/{info.f_child.f_string}/bool/{info.f_bool}:pathresource",
                                                        matches: [
                                                          ["info.f_string", %r{^first/[^/]+/?$}, false],
                                                          ["info.f_child.f_string", %r{^second/[^/]+/?$}, false],
                                                          ["info.f_bool", %r{^[^/]+/?$}, false]
                                                        ]
                                                      )
                                                      .with_bindings(
                                                        uri_method: :get,
                                                        uri_template: "/v1beta1/repeat/{info.f_child.f_string}/{info.f_string}/bool/{info.f_bool}:childfirstpathresource",
                                                        matches: [
                                                          ["info.f_child.f_string", %r{^first/[^/]+/?$}, false],
                                                          ["info.f_string", %r{^second/[^/]+/?$}, false],
                                                          ["info.f_bool", %r{^[^/]+/?$}, false]
                                                        ]
                                                      )
              transcoder.transcode request_pb
            end

            ##
            # @private
            #
            # GRPC transcoding helper method for the repeat_data_path_trailing_resource REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @return [Array(String, [String, nil], Hash{String => String})]
            #   Uri, Body, Query string parameters
            def self.transcode_repeat_data_path_trailing_resource_request request_pb
              transcoder = Gapic::Rest::GrpcTranscoder.new
                                                      .with_bindings(
                                                        uri_method: :get,
                                                        uri_template: "/v1beta1/repeat/{info.f_string}/{info.f_child.f_string}:pathtrailingresource",
                                                        matches: [
                                                          ["info.f_string", %r{^first/[^/]+/?$}, false],
                                                          ["info.f_child.f_string", %r{^second(?:/.*)?$}, true]
                                                        ]
                                                      )
              transcoder.transcode request_pb
            end

            ##
            # @private
            #
            # GRPC transcoding helper method for the repeat_data_body_put REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @return [Array(String, [String, nil], Hash{String => String})]
            #   Uri, Body, Query string parameters
            def self.transcode_repeat_data_body_put_request request_pb
              transcoder = Gapic::Rest::GrpcTranscoder.new
                                                      .with_bindings(
                                                        uri_method: :put,
                                                        uri_template: "/v1beta1/repeat:bodyput",
                                                        body: "*",
                                                        matches: []
                                                      )
              transcoder.transcode request_pb
            end

            ##
            # @private
            #
            # GRPC transcoding helper method for the repeat_data_body_patch REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::RepeatRequest]
            #   A request object representing the call parameters. Required.
            # @return [Array(String, [String, nil], Hash{String => String})]
            #   Uri, Body, Query string parameters
            def self.transcode_repeat_data_body_patch_request request_pb
              transcoder = Gapic::Rest::GrpcTranscoder.new
                                                      .with_bindings(
                                                        uri_method: :patch,
                                                        uri_template: "/v1beta1/repeat:bodypatch",
                                                        body: "*",
                                                        matches: []
                                                      )
              transcoder.transcode request_pb
            end

            ##
            # @private
            #
            # GRPC transcoding helper method for the get_enum REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::EnumRequest]
            #   A request object representing the call parameters. Required.
            # @return [Array(String, [String, nil], Hash{String => String})]
            #   Uri, Body, Query string parameters
            def self.transcode_get_enum_request request_pb
              transcoder = Gapic::Rest::GrpcTranscoder.new
                                                      .with_bindings(
                                                        uri_method: :get,
                                                        uri_template: "/v1beta1/compliance/enum",
                                                        matches: []
                                                      )
              transcoder.transcode request_pb
            end

            ##
            # @private
            #
            # GRPC transcoding helper method for the verify_enum REST call
            #
            # @param request_pb [::Google::Showcase::V1beta1::EnumResponse]
            #   A request object representing the call parameters. Required.
            # @return [Array(String, [String, nil], Hash{String => String})]
            #   Uri, Body, Query string parameters
            def self.transcode_verify_enum_request request_pb
              transcoder = Gapic::Rest::GrpcTranscoder.new
                                                      .with_bindings(
                                                        uri_method: :post,
                                                        uri_template: "/v1beta1/compliance/enum",
                                                        matches: []
                                                      )
              transcoder.transcode request_pb
            end
          end
        end
      end
    end
  end
end
