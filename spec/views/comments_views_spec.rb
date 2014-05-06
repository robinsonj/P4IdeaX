require 'spec_helper'

describe 'CommentsViews' do

  describe 'comments/edit.html.haml' do
    it 'renders edit template' do
      render template: 'comments/edit'
      expect(view).to render_template('comments/edit')
    end
  end

  describe 'comments/index.html.haml' do
    it 'renders index template' do
      render template: 'comments/index'
      expect(view).to render_template('comments/index')
    end
  end

  describe 'comments/new.html.haml' do
    it 'renders new template' do
      render template: 'comments/new'
      expect(view).to render_template('comments/new')
    end
  end

  describe 'comments/show.html.haml' do
    it 'renders show template' do
      author   = create(:user)
      idea     = create(:idea, owner: author)
      @comment = create(:comment, idea_id: idea.id, author_id: author.id)
      render template: 'comments/show'

      expect(view).to render_template('comments/show')
      expect(rendered).to have_content(@comment.text)
      expect(rendered).to have_content(@comment.author.name)
    end
  end
end
