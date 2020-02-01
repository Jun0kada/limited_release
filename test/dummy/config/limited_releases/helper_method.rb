class HelperMethod
  include LimitedRelease::Feature

  active_if { params[:active_limited_release] == 'helper_method' }

  routes do
    get '/', to: 'helper_method#show', as: 'helper_method'
  end

  helpers do
    def message_helper
      'Good morning'
    end

    def new_helper_method
      'New helper method'
    end
  end
end
