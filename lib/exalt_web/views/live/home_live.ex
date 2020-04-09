defmodule ExaltWeb.HomeLive do
  use Phoenix.LiveView

  alias ExaltWeb.HomeView
  alias Exalt.Brain
  alias Exalt.Brain.Note

  def mount(_, %{"all_notes" => all_notes, "title" => title}, socket) do
    {:ok, assign(socket, 
      %{
        all_notes: all_notes,
        notes: all_notes,
        note: Enum.at(all_notes, 0),
        title: title
      }
    )}
  end

  def render(assigns) do
    HomeView.render("show.html", assigns)
  end

  def handle_event("click_note", %{"note_title" => note_title}, socket) do

    note = socket.assigns.notes
            |> Enum.find(fn x -> x.title == note_title end )

    {:noreply,
      assign(socket, 
        note: note,
        title: note.title
      )}

  end


  def handle_event("create", %{ "title" => %{ "title" => title } } , socket) do

    note = socket.assigns.notes
            |> Enum.find(fn x -> x.title == title end )

    if (!note) do
      {:ok, note} = Brain.create_note(%{title: title, content: ""}) 
       all_notes = Brain.list_notes
      {:noreply, assign(socket, title: title, note: note, notes: [note], all_notes: all_notes)}
    else
      {:noreply, assign(socket,  title: title, note: note, notes: [note])}
    end


  end

  def handle_event( "search", %{ "title" => %{ "title" => title } }, socket) do
    notes = socket.assigns.all_notes
            |> Enum.filter(fn x -> String.contains?(x.title, title) end )


    {:noreply, assign(socket, notes: notes, note: Enum.at(notes, 0))}
    
  end
end
