class AddPath
  include LimitedRelease::Feature

  active_if { params[:active_limited_release] == 'add_path' }

  routes do
    get '/', to: 'add_path/hello#show', as: 'add_path/hello'
    get '/good_morning', to: 'add_path/good_morning#show', as: 'add_path/good_morning'
  end
end
