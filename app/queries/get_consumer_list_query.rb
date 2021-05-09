class GetConsumerListQuery
  def self.call(scope, user)
    if user.admin_role?
      scope
    elsif user.manager_role?
      scope = scope.where('manager_username = ?', user.name)
    elsif user.client_role?
      scope = scope.where('client_username = ?', user.name)
    else
      scope = nil
    end
    scope
  end
end