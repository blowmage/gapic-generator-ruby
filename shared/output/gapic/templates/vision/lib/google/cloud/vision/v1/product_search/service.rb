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
require "google/cloud/vision/v1/product_search_service_pb"

module Google
  module Cloud
    module Vision
      module V1
        module ProductSearch
          # Manages Products and ProductSets of reference images for use in product
          # search. It uses the following resource model:
          #
          # - The API has a collection of [ProductSet][google.cloud.vision.v1.ProductSet]
          # resources, named `projects/*/locations/*/productSets/*`, which acts as a way
          # to put different products into groups to limit identification.
          #
          # In parallel,
          #
          # - The API has a collection of [Product][google.cloud.vision.v1.Product]
          # resources, named
          #   `projects/*/locations/*/products/*`
          #
          # - Each [Product][google.cloud.vision.v1.Product] has a collection of
          # [ReferenceImage][google.cloud.vision.v1.ReferenceImage] resources, named
          #   `projects/*/locations/*/products/*/referenceImages/*`
          class Service
            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = "google.cloud.vision.v1.ProductSearch"

            # Creates and returns a new ProductSet resource.
            #
            # Possible errors:
            #
            # * Returns INVALID_ARGUMENT if display_name is missing, or is longer than
            #   4096 characters.
            rpc :CreateProductSet,
                Google::Cloud::Vision::V1::CreateProductSetRequest,
                Google::Cloud::Vision::V1::ProductSet

            # Lists ProductSets in an unspecified order.
            #
            # Possible errors:
            #
            # * Returns INVALID_ARGUMENT if page_size is greater than 100, or less
            #   than 1.
            rpc :ListProductSets,
                Google::Cloud::Vision::V1::ListProductSetsRequest,
                Google::Cloud::Vision::V1::ListProductSetsResponse

            # Gets information associated with a ProductSet.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND if the ProductSet does not exist.
            rpc :GetProductSet,
                Google::Cloud::Vision::V1::GetProductSetRequest,
                Google::Cloud::Vision::V1::ProductSet

            # Makes changes to a ProductSet resource.
            # Only display_name can be updated currently.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND if the ProductSet does not exist.
            # * Returns INVALID_ARGUMENT if display_name is present in update_mask but
            #   missing from the request or longer than 4096 characters.
            rpc :UpdateProductSet,
                Google::Cloud::Vision::V1::UpdateProductSetRequest,
                Google::Cloud::Vision::V1::ProductSet

            # Permanently deletes a ProductSet. Products and ReferenceImages in the
            # ProductSet are not deleted.
            #
            # The actual image files are not deleted from Google Cloud Storage.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND if the ProductSet does not exist.
            rpc :DeleteProductSet,
                Google::Cloud::Vision::V1::DeleteProductSetRequest,
                Google::Protobuf::Empty

            # Creates and returns a new product resource.
            #
            # Possible errors:
            #
            # * Returns INVALID_ARGUMENT if display_name is missing or longer than 4096
            #   characters.
            # * Returns INVALID_ARGUMENT if description is longer than 4096 characters.
            # * Returns INVALID_ARGUMENT if product_category is missing or invalid.
            rpc :CreateProduct,
                Google::Cloud::Vision::V1::CreateProductRequest,
                Google::Cloud::Vision::V1::Product

            # Lists products in an unspecified order.
            #
            # Possible errors:
            #
            # * Returns INVALID_ARGUMENT if page_size is greater than 100 or less than 1.
            rpc :ListProducts,
                Google::Cloud::Vision::V1::ListProductsRequest,
                Google::Cloud::Vision::V1::ListProductsResponse

            # Gets information associated with a Product.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND if the Product does not exist.
            rpc :GetProduct,
                Google::Cloud::Vision::V1::GetProductRequest,
                Google::Cloud::Vision::V1::Product

            # Makes changes to a Product resource.
            # Only the `display_name`, `description`, and `labels` fields can be updated
            # right now.
            #
            # If labels are updated, the change will not be reflected in queries until
            # the next index time.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND if the Product does not exist.
            # * Returns INVALID_ARGUMENT if display_name is present in update_mask but is
            #   missing from the request or longer than 4096 characters.
            # * Returns INVALID_ARGUMENT if description is present in update_mask but is
            #   longer than 4096 characters.
            # * Returns INVALID_ARGUMENT if product_category is present in update_mask.
            rpc :UpdateProduct,
                Google::Cloud::Vision::V1::UpdateProductRequest,
                Google::Cloud::Vision::V1::Product

            # Permanently deletes a product and its reference images.
            #
            # Metadata of the product and all its images will be deleted right away, but
            # search queries against ProductSets containing the product may still work
            # until all related caches are refreshed.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND if the product does not exist.
            rpc :DeleteProduct,
                Google::Cloud::Vision::V1::DeleteProductRequest,
                Google::Protobuf::Empty

            # Creates and returns a new ReferenceImage resource.
            #
            # The `bounding_poly` field is optional. If `bounding_poly` is not specified,
            # the system will try to detect regions of interest in the image that are
            # compatible with the product_category on the parent product. If it is
            # specified, detection is ALWAYS skipped. The system converts polygons into
            # non-rotated rectangles.
            #
            # Note that the pipeline will resize the image if the image resolution is too
            # large to process (above 50MP).
            #
            # Possible errors:
            #
            # * Returns INVALID_ARGUMENT if the image_uri is missing or longer than 4096
            #   characters.
            # * Returns INVALID_ARGUMENT if the product does not exist.
            # * Returns INVALID_ARGUMENT if bounding_poly is not provided, and nothing
            #   compatible with the parent product's product_category is detected.
            # * Returns INVALID_ARGUMENT if bounding_poly contains more than 10 polygons.
            rpc :CreateReferenceImage,
                Google::Cloud::Vision::V1::CreateReferenceImageRequest,
                Google::Cloud::Vision::V1::ReferenceImage

            # Permanently deletes a reference image.
            #
            # The image metadata will be deleted right away, but search queries
            # against ProductSets containing the image may still work until all related
            # caches are refreshed.
            #
            # The actual image files are not deleted from Google Cloud Storage.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND if the reference image does not exist.
            rpc :DeleteReferenceImage,
                Google::Cloud::Vision::V1::DeleteReferenceImageRequest,
                Google::Protobuf::Empty

            # Lists reference images.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND if the parent product does not exist.
            # * Returns INVALID_ARGUMENT if the page_size is greater than 100, or less
            #   than 1.
            rpc :ListReferenceImages,
                Google::Cloud::Vision::V1::ListReferenceImagesRequest,
                Google::Cloud::Vision::V1::ListReferenceImagesResponse

            # Gets information associated with a ReferenceImage.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND if the specified image does not exist.
            rpc :GetReferenceImage,
                Google::Cloud::Vision::V1::GetReferenceImageRequest,
                Google::Cloud::Vision::V1::ReferenceImage

            # Adds a Product to the specified ProductSet. If the Product is already
            # present, no change is made.
            #
            # One Product can be added to at most 100 ProductSets.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND if the Product or the ProductSet doesn't exist.
            rpc :AddProductToProductSet,
                Google::Cloud::Vision::V1::AddProductToProductSetRequest,
                Google::Protobuf::Empty

            # Removes a Product from the specified ProductSet.
            #
            # Possible errors:
            #
            # * Returns NOT_FOUND If the Product is not found under the ProductSet.
            rpc :RemoveProductFromProductSet,
                Google::Cloud::Vision::V1::RemoveProductFromProductSetRequest,
                Google::Protobuf::Empty

            # Lists the Products in a ProductSet, in an unspecified order. If the
            # ProductSet does not exist, the products field of the response will be
            # empty.
            #
            # Possible errors:
            #
            # * Returns INVALID_ARGUMENT if page_size is greater than 100 or less than 1.
            rpc :ListProductsInProductSet,
                Google::Cloud::Vision::V1::ListProductsInProductSetRequest,
                Google::Cloud::Vision::V1::ListProductsInProductSetResponse

            # Asynchronous API that imports a list of reference images to specified
            # product sets based on a list of image information.
            #
            # The [google.longrunning.Operation][google.longrunning.Operation] API can be
            # used to keep track of the progress and results of the request.
            # `Operation.metadata` contains `BatchOperationMetadata`. (progress)
            # `Operation.response` contains `ImportProductSetsResponse`. (results)
            #
            # The input source of this method is a csv file on Google Cloud Storage.
            # For the format of the csv file please see
            # [ImportProductSetsGcsSource.csv_file_uri][google.cloud.vision.v1.ImportProductSetsGcsSource.csv_file_uri].
            rpc :ImportProductSets,
                Google::Cloud::Vision::V1::ImportProductSetsRequest,
                Google::Longrunning::Operation
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
