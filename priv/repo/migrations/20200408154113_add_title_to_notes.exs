defmodule Exalt.Repo.Migrations.AddTitleToNotes do
  use Ecto.Migration

  def change do
    alter table(:notes) do
      add :title, :string
    end
    rename table(:notes), :note, to: :content
  end
end
