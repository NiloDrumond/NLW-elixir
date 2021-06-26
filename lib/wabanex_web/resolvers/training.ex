defmodule WabanexWeb.Resolvers.Training do
  def get(%{id: training_id}, _context), do: Wabanex.Trainings.Get.call(training_id)
  def create(%{input: params}, _context), do: Wabanex.Trainings.Create.call(params)
  def update(%{input: params}, _context), do: Wabanex.Trainings.Update.call(params)
end
