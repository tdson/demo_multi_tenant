class User < ApplicationRecord
  after_create :create_tenant
  after_destroy :destroy_tenant

  private
  def create_tenant
    Apartment::Tenant.create(self.subdomain)
  end

  def destroy_tenant
    Apartment::Tenant.drop(self.subdomain)
  end
end
