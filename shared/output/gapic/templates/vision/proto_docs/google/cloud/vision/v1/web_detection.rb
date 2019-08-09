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

module Google
  module Cloud
    module Vision
      module V1
        # Relevant information for the image from the Internet.
        # @!attribute [rw] web_entities
        #   @return [Google::Cloud::Vision::V1::WebDetection::WebEntity]
        #     Deduced entities from similar images on the Internet.
        # @!attribute [rw] full_matching_images
        #   @return [Google::Cloud::Vision::V1::WebDetection::WebImage]
        #     Fully matching images from the Internet.
        #     Can include resized copies of the query image.
        # @!attribute [rw] partial_matching_images
        #   @return [Google::Cloud::Vision::V1::WebDetection::WebImage]
        #     Partial matching images from the Internet.
        #     Those images are similar enough to share some key-point features. For
        #     example an original image will likely have partial matching for its crops.
        # @!attribute [rw] pages_with_matching_images
        #   @return [Google::Cloud::Vision::V1::WebDetection::WebPage]
        #     Web pages containing the matching images from the Internet.
        # @!attribute [rw] visually_similar_images
        #   @return [Google::Cloud::Vision::V1::WebDetection::WebImage]
        #     The visually similar image results.
        # @!attribute [rw] best_guess_labels
        #   @return [Google::Cloud::Vision::V1::WebDetection::WebLabel]
        #     The service's best guess as to the topic of the request image.
        #     Inferred from similar images on the open web.
        class WebDetection
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods

          # Entity deduced from similar images on the Internet.
          # @!attribute [rw] entity_id
          #   @return [String]
          #     Opaque entity ID.
          # @!attribute [rw] score
          #   @return [Float]
          #     Overall relevancy score for the entity.
          #     Not normalized and not comparable across different image queries.
          # @!attribute [rw] description
          #   @return [String]
          #     Canonical description of the entity, in English.
          class WebEntity
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Metadata for online images.
          # @!attribute [rw] url
          #   @return [String]
          #     The result image URL.
          # @!attribute [rw] score
          #   @return [Float]
          #     (Deprecated) Overall relevancy score for the image.
          class WebImage
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Metadata for web pages.
          # @!attribute [rw] url
          #   @return [String]
          #     The result web page URL.
          # @!attribute [rw] score
          #   @return [Float]
          #     (Deprecated) Overall relevancy score for the web page.
          # @!attribute [rw] page_title
          #   @return [String]
          #     Title for the web page, may contain HTML markups.
          # @!attribute [rw] full_matching_images
          #   @return [Google::Cloud::Vision::V1::WebDetection::WebImage]
          #     Fully matching images on the page.
          #     Can include resized copies of the query image.
          # @!attribute [rw] partial_matching_images
          #   @return [Google::Cloud::Vision::V1::WebDetection::WebImage]
          #     Partial matching images on the page.
          #     Those images are similar enough to share some key-point features. For
          #     example an original image will likely have partial matching for its
          #     crops.
          class WebPage
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Label to provide extra metadata for the web detection.
          # @!attribute [rw] label
          #   @return [String]
          #     Label for extra metadata.
          # @!attribute [rw] language_code
          #   @return [String]
          #     The BCP-47 language code for `label`, such as "en-US" or "sr-Latn".
          #     For more information, see
          #     http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
          class WebLabel
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
