class QuestionsController < ApplicationController
  before_action :set_lesson
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  def index
    @questions = @lesson.questions.all
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = @lesson.questions.build
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = @lesson.questions.build(question_params)

    if @question.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to [@lesson, @question], notice: 'Question was successfully created.' }
      end
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to [@lesson, @question], notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    redirect_to lesson_questions_url(@lesson), notice: 'Question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:lesson_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = @lesson.questions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:content)
    end
end
