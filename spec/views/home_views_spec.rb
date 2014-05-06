require 'spec_helper'

describe 'HomeViews' do
  describe 'home/about.html.haml' do
    it 'renders home/about' do
      render template: 'home/about'
      expect(view).to render_template('home/about')
    end
  end

  describe 'home/contact.html.haml' do
    it 'renders home/contact' do
      render template: 'home/contact'
      expect(view).to render_template('home/contact')
    end
  end

  describe 'home/index.html.haml' do
    it 'renders home/index' do
      render template: 'home/index'
      expect(view).to render_template('home/index')
    end
  end
end
