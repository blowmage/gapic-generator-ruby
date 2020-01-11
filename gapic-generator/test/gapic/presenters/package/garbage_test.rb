# frozen_string_literal: true

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

class GarbagePackagePresenterTest < PresenterTest
  def presenter
    @presenter ||= PackagePresenter.new api(:garbage), "endless.trash.forever"
  end

  def test_endless_trash_forever
    assert_equal ["endless", "trash", "forever"], presenter.address
    assert_equal "endless.trash.forever", presenter.name
    assert_equal "So::Much::Trash", presenter.namespace
    assert_equal "so/much/trash", presenter.package_require
    assert_equal "so/much/trash.rb", presenter.package_file_path

    assert_kind_of GemPresenter, presenter.gem

    assert_equal ["GarbageService"], presenter.services.map(&:name)
    presenter.services.each { |sp| assert_kind_of ServicePresenter, sp }
  end

  def test_references
    refute_empty presenter.references
    presenter.references.each { |ref| assert_kind_of ResourcePresenter, ref }
    assert_equal ["SimpleGarbage"], presenter.references.map(&:name)
    assert_equal ["projects/{project}/simple_garbage/{garbage}"], presenter.references.map(&:path_template)
  end

  def test_paths?
    assert presenter.paths?
  end

  def test_paths_name
    assert_equal "Paths", presenter.paths_name
  end

  def test_paths_name_full
    assert_equal "So::Much::Trash::Paths", presenter.paths_name_full
  end

  def test_paths_file_path
    assert_equal "so/much/trash/paths.rb", presenter.paths_file_path
  end

  def test_paths_file_name
    assert_equal "paths.rb", presenter.paths_file_name
  end

  def test_paths_require
    assert_equal "so/much/trash/paths", presenter.paths_require
  end
end
