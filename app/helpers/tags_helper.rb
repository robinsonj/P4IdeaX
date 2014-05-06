module TagsHelper
  def tags_objects(limit = 100)
    unless @tags
      @tags = Tag.all
      return if @tags.empty?
    end

    @tags
  end
end
