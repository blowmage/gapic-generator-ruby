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

raise "This file is for documentation purposes only."

module Google
  module Cloud
    module Vision
      module V1
        # A vertex represents a 2D point in the image.
        # NOTE: the vertex coordinates are in the same scale as the original image.
        # @!attribute [rw] x
        #   @return [Integer]
        #     X coordinate.
        # @!attribute [rw] y
        #   @return [Integer]
        #     Y coordinate.
        class Vertex
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # A vertex represents a 2D point in the image.
        # NOTE: the normalized vertex coordinates are relative to the original image
        # and range from 0 to 1.
        # @!attribute [rw] x
        #   @return [Float]
        #     X coordinate.
        # @!attribute [rw] y
        #   @return [Float]
        #     Y coordinate.
        class NormalizedVertex
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # A bounding polygon for the detected image annotation.
        # @!attribute [rw] vertices
        #   @return [Google::Cloud::Vision::V1::Vertex]
        #     The bounding polygon vertices.
        # @!attribute [rw] normalized_vertices
        #   @return [Google::Cloud::Vision::V1::NormalizedVertex]
        #     The bounding polygon normalized vertices.
        class BoundingPoly
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # A 3D position in the image, used primarily for Face detection landmarks.
        # A valid Position must have both x and y coordinates.
        # The position coordinates are in the same scale as the original image.
        # @!attribute [rw] x
        #   @return [Float]
        #     X coordinate.
        # @!attribute [rw] y
        #   @return [Float]
        #     Y coordinate.
        # @!attribute [rw] z
        #   @return [Float]
        #     Z coordinate (or depth).
        class Position
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
