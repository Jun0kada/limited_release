class ViewOverride
  include LimitedRelease::Feature

  active_if { params[:active_limited_release] == 'view_override' }

  routes do
    get '/', to: 'view_override#show', as: 'view_override'
  end
end
