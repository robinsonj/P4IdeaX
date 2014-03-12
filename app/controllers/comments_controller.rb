class CommentsController < ApplicationController

  before_fiter :authenticate_user!, :except => [:index, :show]

end
