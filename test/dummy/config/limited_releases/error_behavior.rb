class ErrorBehavior
  include LimitedRelease::Feature

  active_if { params[:active_limited_release] == 'error_behavior' }

  routes do
    get '/', to: 'error_behavior#show', as: 'error_behavior'
  end
end
