class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = Book.new
  end

    # 新規投稿するための
  def create
    # １. データを新規登録するためのインスタンス作成
    list = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ３. トップ画面へリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = Book.all
  end

  def show
    @list = Book.find(params[:id])
  end

  def edit
    @list = Book.find(params[:id])
  end

  def update
    list = Book.find(params[:id])
    list.update(book_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = Book.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
