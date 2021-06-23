defmodule WabanexWeb.Schema do
  use Absinthe.Schema

  import_types WabanexWeb.Schema.Types.Root

  query do
    import_fields :root
  end
end
