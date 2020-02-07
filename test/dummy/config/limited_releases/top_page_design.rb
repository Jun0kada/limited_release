# frozen_string_literal: true

class TopPageDesign
  include LimitedRelease::Feature

  active_if do
    params[:new_design].present?
  end

  routes do
    get '/', to: 'top_page_designs#show', as: 'top_page_design'
  end

  helpers do
    def title
      'Welcome to New Design!'
    end
  end
end
