class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == "sys_admin"
      can :manage, User
      can :manage, LocalResource
    elsif user.role == "admin"
      can :create, Event
      can :manage, Event, user: { department_id: user.department_id }
      can :create, Article
      can :manage, Article, user: { department_id: user.department_id }
      can :create, FrequentQuestion
      can :manage, FrequentQuestion, user: { department_id: user.department_id }
      can :manage, Category
      can :manage, Document
      can :manage, Survey
      can :manage, SiteQuestion
      can :manage, Contact
      can :manage, Subject
    elsif user.role == "user"
      can :create, Event
      can :manage, Event, user_id: user.id
      can :create, Article
      can :manage, Article, user_id: user.id
      can :create, FrequentQuestion
      can :manage, FrequentQuestion, user_id: user.id
      can :manage, Document
      can :manage, Survey
      can :manage, SiteQuestion
    else
      can :read, Event
      can :read, Article
      can :read, Document
      can :read, Survey
      can :read, FrequentQuestion
      can :read, Contact
    end
  end
end
