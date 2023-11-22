class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.order(created_at: :desc)
  end

  def new
    @category = Category.find(params[:category_id])
    @expense = Expense.new
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = current_user.expenses.build(expense_params)

    if @expense.save
      CategoryExpense.create(category: @category, expense: @expense)
      redirect_to category_expenses_path(@category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
