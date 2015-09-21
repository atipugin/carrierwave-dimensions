class Uploader < CarrierWave::Uploader::Base
  include CarrierWave::Dimensions

  def store_dir
    File.expand_path('../../support/uploads', __FILE__)
  end

  def cache_dir
    File.join(store_dir, 'tmp')
  end

  def max_dimensions
    [750, 750]
  end

  def min_dimensions
    [250, 250]
  end
end

RSpec.describe CarrierWave::Dimensions do
  let(:file_name) { 'normal.jpg' }
  let(:file) { File.open(fixture_path.join(file_name)) }

  subject { Uploader.new }

  it 'does not raise error' do
    expect { subject.store!(file) }.not_to raise_error
  end

  context 'when file is too large' do
    let(:file_name) { 'large.jpg' }

    it 'raises error' do
      expect { subject.store!(file) }
        .to raise_error(CarrierWave::IntegrityError)
    end
  end

  context 'when file is too small' do
    let(:file_name) { 'small.jpg' }

    it 'raises error' do
      expect { subject.store!(file) }
        .to raise_error(CarrierWave::IntegrityError)
    end
  end
end
