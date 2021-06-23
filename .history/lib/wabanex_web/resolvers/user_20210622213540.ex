defmodule WabanexWeb.Resolvers.User do
  def get(%{id: user_id}, _context), do: Wabanex.Users.Get.call(user_id)
  def create(%{input: params}, _context), do Wabanex.Users.Create.call(params)
end
