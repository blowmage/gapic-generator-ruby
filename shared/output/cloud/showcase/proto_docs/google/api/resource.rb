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
  module Api
    # A simple descriptor of a resource type.
    #
    # ResourceDescriptor annotates a resource message (either by means of a
    # protobuf annotation or use in the service config), and associates the
    # resource's schema, the resource type, and the pattern of the resource name.
    #
    # Example:
    #
    #   message Topic {
    #     // Indicates this message defines a resource schema.
    #     // Declares the resource type in the format of {service}/{kind}.
    #     // For Kubernetes resources, the format is {api group}/{kind}.
    #     option (google.api.resource) = {
    #       type: "pubsub.googleapis.com/Topic"
    #       pattern: "projects/{project}/topics/{topic}"
    #     };
    #   }
    #
    # Sometimes, resources have multiple patterns, typically because they can
    # live under multiple parents.
    #
    # Example:
    #
    #   message LogEntry {
    #     option (google.api.resource) = {
    #       type: "logging.googleapis.com/LogEntry"
    #       pattern: "projects/{project}/logs/{log}"
    #       pattern: "organizations/{organization}/logs/{log}"
    #       pattern: "folders/{folder}/logs/{log}"
    #       pattern: "billingAccounts/{billing_account}/logs/{log}"
    #     };
    #   }
    # @!attribute [rw] type
    #   @return [String]
    #     The full name of the resource type. It must be in the format of
    #     {service_name}/{resource_type_kind}. The resource type names are
    #     singular and do not contain version numbers.
    #
    #     For example: `storage.googleapis.com/Bucket`
    #
    #     The value of the resource_type_kind must follow the regular expression
    #     /[A-Z][a-zA-Z0-9]+/. It must start with upper case character and
    #     recommended to use PascalCase (UpperCamelCase). The maximum number of
    #     characters allowed for the resource_type_kind is 100.
    # @!attribute [rw] pattern
    #   @return [String]
    #     Required. The valid pattern or patterns for this resource's names.
    #
    #     Examples:
    #       - "projects/{project}/topics/{topic}"
    #       - "projects/{project}/knowledgeBases/{knowledge_base}"
    #
    #     The components in braces correspond to the IDs for each resource in the
    #     hierarchy. It is expected that, if multiple patterns are provided,
    #     the same component name (e.g. "project") refers to IDs of the same
    #     type of resource.
    # @!attribute [rw] name_field
    #   @return [String]
    #     Optional. The field on the resource that designates the resource name
    #     field. If omitted, this is assumed to be "name".
    # @!attribute [rw] history
    #   @return [ENUM(History)]
    #     Optional. The historical or future-looking state of the resource pattern.
    #
    #     Example:
    #       // The InspectTemplate message originally only supported resource
    #       // names with organization, and project was added later.
    #       message InspectTemplate {
    #         option (google.api.resource) = {
    #           type: "dlp.googleapis.com/InspectTemplate"
    #           pattern: "organizations/{organization}/inspectTemplates/{inspect_template}"
    #           pattern: "projects/{project}/inspectTemplates/{inspect_template}"
    #           history: ORIGINALLY_SINGLE_PATTERN
    #         };
    #       }
    class ResourceDescriptor
      include Google::Protobuf::MessageExts
      extend Google::Protobuf::MessageExts::ClassMethods

      # A description of the historical or future-looking state of the
      # resource pattern.
      module History
        # The "unset" value.
        HISTORY_UNSPECIFIED = 0

        # The resource originally had one pattern and launched as such, and
        # additional patterns were added later.
        ORIGINALLY_SINGLE_PATTERN = 1

        # The resource has one pattern, but the API owner expects to add more
        # later. (This is the inverse of ORIGINALLY_SINGLE_PATTERN, and prevents
        # that from being necessary once there are multiple patterns.)
        FUTURE_MULTI_PATTERN = 2
      end
    end

    # An annotation designating that this field is a reference to a resource
    # defined by another message.
    # @!attribute [rw] type
    #   @return [String]
    #     The unified resource type name of the type that this field references.
    #     Marks this as a field referring to a resource in another message.
    #
    #     Example:
    #
    #       message Subscription {
    #         string topic = 2 [(google.api.resource_reference) = {
    #           type = "pubsub.googleapis.com/Topic"
    #         }];
    #       }
    # @!attribute [rw] child_type
    #   @return [String]
    #     The fully-qualified message name of a child of the type that this field
    #     references.
    #
    #     This is useful for `parent` fields where a resource has more than one
    #     possible type of parent.
    #
    #     Example:
    #
    #       message ListLogEntriesRequest {
    #         string parent = 1 [(google.api.resource_reference) = {
    #           child_type: "logging.googleapis.com/LogEntry"
    #         };
    #       }
    #
    #     If the referenced message is in the same proto package, the service name
    #     may be omitted:
    #
    #       message ListLogEntriesRequest {
    #         string parent = 1
    #           [(google.api.resource_reference).child_type = "LogEntry"];
    #       }
    class ResourceReference
      include Google::Protobuf::MessageExts
      extend Google::Protobuf::MessageExts::ClassMethods
    end
  end
end
