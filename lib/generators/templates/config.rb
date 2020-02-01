# frozen_string_literal: true

class <%= class_name %>
  include LimitedRelease::Feature

  active_if do
    # current_user.admin?
  end

  routes do
    # get '/', to: '<%= file_name.pluralize %>#show', as: '<%= file_name %>'
  end

  helpers do
    # def my_helper_method
    # end
  end
end
