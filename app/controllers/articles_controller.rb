class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order(:rating).reverse_order.limit 10
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comments = Comment.where(article_id: @article)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.js { render action: 'create' }
      else
        format.html { render :new }
        format.js { render action: 'create' }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render :show, status: :ok, location: @article }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def serch_by_relevant
  end

  def find_articles
    set_filter_vars(search_params[:rating_from], search_params[:rating_to], search_params[:date])
    @articles = Article.where(rating: @rating_from..@rating_to, created_at: @article_date.beginning_of_day..@article_date.end_of_day)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :rating, :category_id, :author_id)
    end

    def search_params
      params.require(:find_articles).permit(:rating_from, :rating_to, :date)
    end

    def set_filter_vars rating_from, rating_to, date
      @rating_from = rating_from.to_f
      @rating_to = rating_to.to_f
      @article_date = date.to_date
    end
end
