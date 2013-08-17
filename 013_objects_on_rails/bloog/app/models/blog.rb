class Blog
  attr_writer :post_source

  def initialize
    @entries = []
  end

  def title
    "Watching Paint Dry"
  end

  def subtitle
    "The trusted source for drying paint news & opinions"
  end

  def new_post(*args)
    post_source.call(*args).tap do |p|
      p.blog = self
    end
  end

  def add_entry(entry)
    @entries << entry
  end

  def entries
    @entries.sort_by(&:pubdate).reverse.take 10
  end

  private
  def post_source
    @post_source ||= Post.public_method(:new)
  end
end