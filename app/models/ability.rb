class Ability
  include CanCan::Ability

#TODO Find out if this is correct?
  def initialize(user)
    if user.present?
    if user.admin?
      can :manage, :all
      can :access, :rails_admin
      can :read, :dashboard
    else if user.manager?
        can :manage, Consumable
        cannot :destroy, Consumable
        can :manage, AssetTag
        cannot :destroy, AssetTag
        can :manage, Order
        cannot :destroy, Order
        can :manage, FixedAsset
        cannot :destroy, FixedAsset
        can :manage, LineItem
        can :manage, ItemTag
        can :manage, Location
        cannot :destroy, Location
        can :manage, Part
        cannot :destroy, Part
       else
          can :read, Consumable
          can :read, AssetTag
          can :read, FixedAsset
          can :read, Order
          can :read, LineItem
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
    end
  end
end
end
