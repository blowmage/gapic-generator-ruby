# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'


##
# Imports
#
require 'google/protobuf/descriptor.pb'

module Google
  module Api
    ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

    ##
    # Message Classes
    #
    class Package < ::Protobuf::Message; end


    ##
    # File Options
    #
    set_option :java_package, "com.google.api"
    set_option :java_outer_classname, "ClientProto"
    set_option :java_multiple_files, true
    set_option :go_package, "google.golang.org/genproto/googleapis/api/annotations;annotations"
    set_option :objc_class_prefix, "GAPI"


    ##
    # Message Fields
    #
    class Package
      optional :string, :title, 1
      repeated :string, :namespace, 2
      optional :string, :version, 3
      optional :string, :product_title, 4
    end


    ##
    # Extended Message Fields
    #
    class ::Google::Protobuf::FileOptions < ::Protobuf::Message
      optional ::Google::Api::Package, :".google.api.client_package", 1048, :extension => true
    end

    class ::Google::Protobuf::ServiceOptions < ::Protobuf::Message
      optional :string, :".google.api.default_host", 1049, :extension => true
      optional :string, :".google.api.oauth_scopes", 1050, :extension => true
    end

    class ::Google::Protobuf::MethodOptions < ::Protobuf::Message
      repeated :string, :".google.api.method_signature", 1051, :extension => true
    end

  end

end

