class TweetsController < ApplicationController
  before_action :set_tweet, only: [:destroy, :edit, :update]

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end

  def confirm
    @tweet = Tweet.new(tweets_params)
    render 'new' if @tweet.invalid?
  end

  def edit
  end

  def update
    @tweet.update(tweets_params)
    if @tweet.invalid?
      render 'edit'
    else
      flash[:success] = "ツイートを更新しました！"
      redirect_to root_path
    end
  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end

  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      flash[:success] = "ツイートしました！"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @tweet.destroy
    flash[:success] = "ツイートを削除しました！"
    redirect_to root_path
  end

  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
