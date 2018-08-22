class SentencesController < ApplicationController
  before_action :set_sentence, only: [:show, :edit, :update, :destroy]

  # GET /sentences
  # GET /sentences.json
  def index
    @sentences = Sentence.all
    #リンク付きtagリストを表示 → リンク先にてコンセプトで絞り込みをした一覧を表示
    @tags = Concept.all
    if params[:concept_id]
      @selected_concept = Concept.find(params[:concept_id])
      @sentences = Sentence.from_concept(params[:concept_id]).page(params[:page])
    else
      @sentences = Sentence.all.page(params[:page])
    end
  end

  # GET /sentences/1
  # GET /sentences/1.json
  def show
  end

  # GET /sentences/new
  def new
    @sentence = Sentence.new
    # 単語一覧を入力欄に表示
    # コンセプトタグリストを用意
    @concept_list = params[:concept_list]
  end

  # GET /sentences/1/edit
  def edit
    @sentence = Sentence.find(params[:id])
    @concept_list = @sentence.concepts.pluck(:name).join(",")
  end

  # POST /sentences
  # POST /sentences.json
  def create
    sentence = Sentence.find_by_or_initialize(term_id: term_id) do |sentence|
      if  # 入力した例文がDBになければ
          sentence.new_record?
          # 入力した作者名(名前とカナの組み合わせ)がDBになければ新規作成、あれば名前とカナを取得（複合インデックス(名前,カナ)？）
          sentence.source.author = Author.find_by_or_initialize(name: name, kana: kana)
          # 入力した作者名から作品名一覧を表示(ここで作者と作品名の組み合わせが同じレコードが作られないようにする) （複合(作者の名前,カナ+作品名の名前,カナ,カテゴリ)）

          # 入力した作品名(名前とカテゴリの組み合わせ)がDBになければ新規作成、あれば名前とカナを取得（複合(名前,カナ)？）
          @sentence
          # author_idをsourceテーブルに入れる
          # コンセプトタグの入力値を分割して保存
          @concept_list = params[:concept_list].split(",")
          sentence.save
          redirect_to @sentence, notice: '例文を投稿しました'
      else # 入力した例文がDBにある場合は
          render :new
      end
    end
  end

  def find_or_initialize_by!(attributes, &block)
    find_by(attributes) || new(attributes, &block)
  end

  # PATCH/PUT /sentences/1
  # PATCH/PUT /sentences/1.json
  def update
    @sentence = Sentence.find(params[:id])
    tag_list = params[:concept_list].split(",")

    respond_to do |format|
      #update_attributes:複数の項目を一度に変更・保存
      if @sentence.update_attributes(sentence_params)
        @sentence.save_concepts(concept_list)
        format.html { redirect_to @sentence,
                      notice: '例文を更新しました' }
        format.json { render :show, status: :ok, location: @sentence }
      else
        format.html { render :edit }
        format.json { render json: @sentence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sentences/1
  # DELETE /sentences/1.json
  def destroy
    @sentence.destroy
    respond_to do |format|
      format.html { redirect_to sentences_url, notice: 'Sentence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sentence
      @sentence = Sentence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sentence_params
      params.require(:sentence).permit(:term_id, :url, :body, :concept_list,
                                        source_attributes: [:sentence_id, :id, :title, :category,
                                                            author_attributes: [:id, :name, :kana]])
    end
end
