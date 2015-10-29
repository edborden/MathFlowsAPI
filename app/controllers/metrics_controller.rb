class MetricsController < ApplicationController

  def index

    metrics = {
      users_count: Plan.not_guest.count,
      questions_count: Block.question.count,
      tests_count: Test.count,
      groups_count: Group.with_multiple_users.count,
      users_made_content_count: User.made_content.count,
      users_made_more_content_count: User.made_more_content.count
    }

    render json: metrics

  end

  def ten

    users = User.find params[:ids]
    render json: users, serializer: ColleageSerializer, root: "users"

  end

end
