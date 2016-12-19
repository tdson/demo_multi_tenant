class SubdomainConstraint
  class << self
    def matches? request
      ignore_list = %w{www admin}
      request.subdomain.present? && !ignore_list.include?(request.subdomain)
    end
  end
end

Rails.application.routes.draw do
  constraints SubdomainConstraint do
    resources :projects
  end
  resources :users
end
