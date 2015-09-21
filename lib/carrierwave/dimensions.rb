require 'bundler/setup'
require 'active_support/concern'
require 'fastimage'
require 'carrierwave'
require 'i18n'

require 'carrierwave/dimensions/version'

I18n.load_path += Dir[File.expand_path('../../locales/*.yml', __FILE__)]

module CarrierWave
  module Dimensions
    extend ActiveSupport::Concern

    included do
      before :cache, :check_dimensions!
    end

    def max_dimensions
      [4096, 4096]
    end

    def min_dimensions
      [0, 0]
    end

    private

    def check_dimensions!(new_file)
      dimensions = FastImage.size(new_file.path)
      return unless dimensions

      check_max_dimensions!(dimensions)
      check_min_dimensions!(dimensions)
    end

    def check_max_dimensions!(dimensions)
      return if dimensions[0] <= max_dimensions[0] &&
                dimensions[1] <= max_dimensions[1]

      fail CarrierWave::IntegrityError,
           I18n.translate('errors.messages.max_dimensions_error')
    end

    def check_min_dimensions!(dimensions)
      return if dimensions[0] >= min_dimensions[0] &&
                dimensions[1] >= min_dimensions[1]

      fail CarrierWave::IntegrityError,
           I18n.translate('errors.messages.min_dimensions_error')
    end
  end
end
