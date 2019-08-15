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

module Google
  module Cloud
    module Vision
      module V1
        # TextAnnotation contains a structured representation of OCR extracted text.
        # The hierarchy of an OCR extracted text structure is like this:
        #     TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
        # Each structural component, starting from Page, may further have their own
        # properties. Properties describe detected languages, breaks etc.. Please refer
        # to the
        # [TextAnnotation.TextProperty][google.cloud.vision.v1.TextAnnotation.TextProperty]
        # message definition below for more detail.
        # @!attribute [rw] pages
        #   @return [Google::Cloud::Vision::V1::Page]
        #     List of pages detected by OCR.
        # @!attribute [rw] text
        #   @return [String]
        #     UTF-8 text detected on the pages.
        class TextAnnotation
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods

          # Detected language for a structural component.
          # @!attribute [rw] language_code
          #   @return [String]
          #     The BCP-47 language code, such as "en-US" or "sr-Latn". For more
          #     information, see
          #     http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
          # @!attribute [rw] confidence
          #   @return [Float]
          #     Confidence of detected language. Range [0, 1].
          class DetectedLanguage
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end

          # Detected start or end of a structural component.
          # @!attribute [rw] type
          #   @return [ENUM(BreakType)]
          #     Detected break type.
          # @!attribute [rw] is_prefix
          #   @return [Boolean]
          #     True if break prepends the element.
          class DetectedBreak
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum to denote the type of break found. New line, space etc.
            module BreakType
              # Unknown break label type.
              UNKNOWN = 0

              # Regular space.
              SPACE = 1

              # Sure space (very wide).
              SURE_SPACE = 2

              # Line-wrapping break.
              EOL_SURE_SPACE = 3

              # End-line hyphen that is not present in text; does not co-occur with
              # `SPACE`, `LEADER_SPACE`, or `LINE_BREAK`.
              HYPHEN = 4

              # Line break that ends a paragraph.
              LINE_BREAK = 5
            end
          end

          # Additional information detected on the structural component.
          # @!attribute [rw] detected_languages
          #   @return [Google::Cloud::Vision::V1::TextAnnotation::DetectedLanguage]
          #     A list of detected languages together with confidence.
          # @!attribute [rw] detected_break
          #   @return [Google::Cloud::Vision::V1::TextAnnotation::DetectedBreak]
          #     Detected start or end of a text segment.
          class TextProperty
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # Detected page from OCR.
        # @!attribute [rw] property
        #   @return [Google::Cloud::Vision::V1::TextAnnotation::TextProperty]
        #     Additional information detected on the page.
        # @!attribute [rw] width
        #   @return [Integer]
        #     Page width. For PDFs the unit is points. For images (including
        #     TIFFs) the unit is pixels.
        # @!attribute [rw] height
        #   @return [Integer]
        #     Page height. For PDFs the unit is points. For images (including
        #     TIFFs) the unit is pixels.
        # @!attribute [rw] blocks
        #   @return [Google::Cloud::Vision::V1::Block]
        #     List of blocks of text, images etc on this page.
        # @!attribute [rw] confidence
        #   @return [Float]
        #     Confidence of the OCR results on the page. Range [0, 1].
        class Page
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Logical element on the page.
        # @!attribute [rw] property
        #   @return [Google::Cloud::Vision::V1::TextAnnotation::TextProperty]
        #     Additional information detected for the block.
        # @!attribute [rw] bounding_box
        #   @return [Google::Cloud::Vision::V1::BoundingPoly]
        #     The bounding box for the block.
        #     The vertices are in the order of top-left, top-right, bottom-right,
        #     bottom-left. When a rotation of the bounding box is detected the rotation
        #     is represented as around the top-left corner as defined when the text is
        #     read in the 'natural' orientation.
        #     For example:
        #
        #     * when the text is horizontal it might look like:
        #
        #             0----1
        #             |    |
        #             3----2
        #
        #     * when it's rotated 180 degrees around the top-left corner it becomes:
        #
        #             2----3
        #             |    |
        #             1----0
        #
        #       and the vertex order will still be (0, 1, 2, 3).
        # @!attribute [rw] paragraphs
        #   @return [Google::Cloud::Vision::V1::Paragraph]
        #     List of paragraphs in this block (if this blocks is of type text).
        # @!attribute [rw] block_type
        #   @return [ENUM(BlockType)]
        #     Detected block type (text, image etc) for this block.
        # @!attribute [rw] confidence
        #   @return [Float]
        #     Confidence of the OCR results on the block. Range [0, 1].
        class Block
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods

          # Type of a block (text, image etc) as identified by OCR.
          module BlockType
            # Unknown block type.
            UNKNOWN = 0

            # Regular text block.
            TEXT = 1

            # Table block.
            TABLE = 2

            # Image block.
            PICTURE = 3

            # Horizontal/vertical line box.
            RULER = 4

            # Barcode block.
            BARCODE = 5
          end
        end

        # Structural unit of text representing a number of words in certain order.
        # @!attribute [rw] property
        #   @return [Google::Cloud::Vision::V1::TextAnnotation::TextProperty]
        #     Additional information detected for the paragraph.
        # @!attribute [rw] bounding_box
        #   @return [Google::Cloud::Vision::V1::BoundingPoly]
        #     The bounding box for the paragraph.
        #     The vertices are in the order of top-left, top-right, bottom-right,
        #     bottom-left. When a rotation of the bounding box is detected the rotation
        #     is represented as around the top-left corner as defined when the text is
        #     read in the 'natural' orientation.
        #     For example:
        #       * when the text is horizontal it might look like:
        #          0----1
        #          |    |
        #          3----2
        #       * when it's rotated 180 degrees around the top-left corner it becomes:
        #          2----3
        #          |    |
        #          1----0
        #       and the vertex order will still be (0, 1, 2, 3).
        # @!attribute [rw] words
        #   @return [Google::Cloud::Vision::V1::Word]
        #     List of all words in this paragraph.
        # @!attribute [rw] confidence
        #   @return [Float]
        #     Confidence of the OCR results for the paragraph. Range [0, 1].
        class Paragraph
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # A word representation.
        # @!attribute [rw] property
        #   @return [Google::Cloud::Vision::V1::TextAnnotation::TextProperty]
        #     Additional information detected for the word.
        # @!attribute [rw] bounding_box
        #   @return [Google::Cloud::Vision::V1::BoundingPoly]
        #     The bounding box for the word.
        #     The vertices are in the order of top-left, top-right, bottom-right,
        #     bottom-left. When a rotation of the bounding box is detected the rotation
        #     is represented as around the top-left corner as defined when the text is
        #     read in the 'natural' orientation.
        #     For example:
        #       * when the text is horizontal it might look like:
        #          0----1
        #          |    |
        #          3----2
        #       * when it's rotated 180 degrees around the top-left corner it becomes:
        #          2----3
        #          |    |
        #          1----0
        #       and the vertex order will still be (0, 1, 2, 3).
        # @!attribute [rw] symbols
        #   @return [Google::Cloud::Vision::V1::Symbol]
        #     List of symbols in the word.
        #     The order of the symbols follows the natural reading order.
        # @!attribute [rw] confidence
        #   @return [Float]
        #     Confidence of the OCR results for the word. Range [0, 1].
        class Word
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # A single symbol representation.
        # @!attribute [rw] property
        #   @return [Google::Cloud::Vision::V1::TextAnnotation::TextProperty]
        #     Additional information detected for the symbol.
        # @!attribute [rw] bounding_box
        #   @return [Google::Cloud::Vision::V1::BoundingPoly]
        #     The bounding box for the symbol.
        #     The vertices are in the order of top-left, top-right, bottom-right,
        #     bottom-left. When a rotation of the bounding box is detected the rotation
        #     is represented as around the top-left corner as defined when the text is
        #     read in the 'natural' orientation.
        #     For example:
        #       * when the text is horizontal it might look like:
        #          0----1
        #          |    |
        #          3----2
        #       * when it's rotated 180 degrees around the top-left corner it becomes:
        #          2----3
        #          |    |
        #          1----0
        #       and the vertex order will still be (0, 1, 2, 3).
        # @!attribute [rw] text
        #   @return [String]
        #     The actual UTF-8 representation of the symbol.
        # @!attribute [rw] confidence
        #   @return [Float]
        #     Confidence of the OCR results for the symbol. Range [0, 1].
        class Symbol
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
