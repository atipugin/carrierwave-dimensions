module PathHelpers
  def fixture_path
    @fixture_path ||= root.join('fixtures')
  end

  def upload_path
    @upload_path ||= root.join('support', 'uploads')
  end

  private

  def root
    @root ||= Pathname.new(File.expand_path('../../', __FILE__))
  end
end
