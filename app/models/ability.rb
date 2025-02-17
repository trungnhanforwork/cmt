
class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.blank?

    case user.user_type
    when 'superadmin'
      grant_superadmin_abilities
    when 'admin'
      grant_admin_abilities(user)
    when 'sales_manager'
      grant_sales_manager_abilities(user)
    else
      grant_sales_user_abilities(user)
    end
  end

  private

  def grant_superadmin_abilities
    can :manage, :all
  end

  def grant_admin_abilities(user)
    grant_resource_management_abilities
    grant_self_management_abilities(user)
  end

  def grant_sales_manager_abilities(user)
    grant_self_management_abilities(user)
    grant_customer_management_abilities
    grant_sales_assignment_abilities
    grant_read_only_abilities
    grant_price_management_abilities
    grant_inventory_read_abilities
  end

  def grant_sales_user_abilities(user)
    grant_self_management_abilities(user)
    grant_read_only_abilities
    grant_price_read_abilities
    grant_inventory_read_abilities
  end

  def grant_resource_management_abilities
    [ Brand, User].each do |klass|
      can :manage, klass
    end
  end

  def grant_self_management_abilities(user)
    can :manage, User, id: user.id
  end

  def grant_customer_management_abilities
    can :manage, Customer
    can :read, Branch
  end

  def grant_sales_assignment_abilities
    can :manage, CustomerAssignment
  end

  def grant_read_only_abilities
    can :read, Brand
  end

  def grant_price_management_abilities
    can :manage, Price
  end

  def grant_price_read_abilities
    can :read, Price
  end

  def grant_inventory_read_abilities
    can :read, Inventory
  end
end
