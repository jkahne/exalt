defmodule Exalt.Brain.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :title, :string
    field :content, :string
    field :sort_order, :integer

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:title, :content, :sort_order])
    |> validate_required([:title])
  end
end
