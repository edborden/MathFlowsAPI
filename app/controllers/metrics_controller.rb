class MetricsController < ApplicationController

  def index

    metrics = {
      users_count: Plan.not_guest.count,
      questions_count: Block.question.count,
      tests_count: Test.count,
      groups_count: Group.with_multiple_users.count
    }

    render json: metrics

  end

end
