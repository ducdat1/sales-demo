class ProductQuery
  # POPULAR_TRESHOLD = 5
  SORT_OPTIONS = %w(by_date by_title by_category).freeze
  # def initialize(products = Product.all)
  def initialize(params={}, products = Product.includes(:category))
    @products = products.extending(Scopes)
    @params = params
  end

  def all
    # @products.where(query)
    @products.public_send(sort_by, type)
  end

  private

  def sort_by
    @params[:sort].presence_in(SORT_OPTIONS) || :by_date
  end

  def type
    @params[:type] == "asc" ? :asc : :desc
  end

  def query
    # <<-SQL
    #     articles.comments_count >= #{POPULAR_TRESHOLD}
    #     AND articles.content IS NOT NULL
    #     AND articles.status = #{Article::STATUSES[:published]}
    #     ORDER BY articles.comments_count DESC
    # SQL
  end

  # Extended by scopes
  module Scopes
    def by_title(type)
      order(title: type)
    end

    def by_date(type)
      order(created_at: type)
    end

    def by_category
      order("categories.cat_id #{type}")
    end
  end
end
