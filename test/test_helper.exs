Logger.configure(level: :info)
ExUnit.start()

defmodule Neo4j.Sips.TestHelper do

  @doc """
   Read an entire file into a string.
   Return a tuple of success and data.
   """
  def read_whole_file(path) do
    case File.read(path) do
      {:ok, file} -> file
      {:error, reason} -> {:error, "Could not open #{path} #{file_error_description(reason)}" }
    end
  end

  @doc """
  Open a file stream, and join the lines into a string.
  """
  def stream_file_join(filename) do
    stream = File.stream!(filename)
    Enum.join stream
  end

  defp file_error_description(:enoent), do: "because the file does not exist."
  defp file_error_description(reason), do: "due to #{reason}."
end

# todo: To clean up the test db, before running the tests
# MATCH (n)
# OPTIONAL MATCH (n)-[r]-()
# DELETE n,r

Process.flag(:trap_exit, true)
