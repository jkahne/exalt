defmodule Exalt.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :note, :text
      add :sort_order, :integer

      timestamps()
    end

  end
end
