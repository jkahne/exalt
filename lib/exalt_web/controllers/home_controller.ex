defmodule ExaltWeb.HomeController do
  use ExaltWeb, :controller

  alias Exalt.Brain
  alias Exalt.Brain.Note

  def create(conn, %{"note" => note_params}) do
    # case Brain.create_note(note_params) do
    #   {:ok, note} ->
    #     conn
    #     |> put_flash(:info, "Note created successfully.")
    #     |> redirect(to: Routes.note_path(conn, :show, note))
    #
    #   {:error, %Ecto.Changeset{} = changeset} ->
    #     render(conn, "new.html", changeset: changeset)
    # end
  end

  def show(conn, _params) do
    notes = Brain.list_notes()
    render(conn, "show.html", notes: notes)
  end

  def update(conn, %{"id" => id, "note" => note_params}) do
    # note = Brain.get_note!(id)
    #
    # case Brain.update_note(note, note_params) do
    #   {:ok, note} ->
    #     conn
    #     |> put_flash(:info, "Note updated successfully.")
    #     |> redirect(to: Routes.note_path(conn, :show, note))
    #
    #   {:error, %Ecto.Changeset{} = changeset} ->
    #     render(conn, "edit.html", note: note, changeset: changeset)
    # end
  end

  def delete(conn, %{"id" => id}) do
    # note = Brain.get_note!(id)
    # {:ok, _note} = Brain.delete_note(note)
    #
    # conn
    # |> put_flash(:info, "Note deleted successfully.")
    # |> redirect(to: Routes.note_path(conn, :index))
  end
end
