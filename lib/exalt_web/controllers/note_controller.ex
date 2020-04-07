defmodule ExaltWeb.NoteController do
  use ExaltWeb, :controller

  alias Exalt.Brain
  alias Exalt.Brain.Note

  def index(conn, _params) do
    notes = Brain.list_notes()
    render(conn, "index.html", notes: notes)
  end

  def new(conn, _params) do
    changeset = Brain.change_note(%Note{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"note" => note_params}) do
    case Brain.create_note(note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note created successfully.")
        |> redirect(to: Routes.note_path(conn, :show, note))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    note = Brain.get_note!(id)
    render(conn, "show.html", note: note)
  end

  def edit(conn, %{"id" => id}) do
    note = Brain.get_note!(id)
    changeset = Brain.change_note(note)
    render(conn, "edit.html", note: note, changeset: changeset)
  end

  def update(conn, %{"id" => id, "note" => note_params}) do
    note = Brain.get_note!(id)

    case Brain.update_note(note, note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note updated successfully.")
        |> redirect(to: Routes.note_path(conn, :show, note))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", note: note, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    note = Brain.get_note!(id)
    {:ok, _note} = Brain.delete_note(note)

    conn
    |> put_flash(:info, "Note deleted successfully.")
    |> redirect(to: Routes.note_path(conn, :index))
  end
end
