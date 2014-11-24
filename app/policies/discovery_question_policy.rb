class Discovery::QuestionPolicy < ApplicationPolicy
	def index?
    true
  end

  def create?
    user.present? && user.admin?
  end

  def new?
    create?
  end

  def destroy?
  	create?
  end
end