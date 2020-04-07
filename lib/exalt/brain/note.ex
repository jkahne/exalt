defmodule Exalt.Brain.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :note, :string
    field :sort_order, :integer

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:note, :sort_order])
    |> validate_required([:note, :sort_order])
  end
end
