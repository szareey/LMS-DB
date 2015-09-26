RailsAdmin.config do |config|
  config.excluded_models = %w(Question::TempImage User::Token)

  RailsAdmin.config do |config|
    config.authorize_with do
      redirect_to main_app.root_path unless current_user.is_admin?
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
