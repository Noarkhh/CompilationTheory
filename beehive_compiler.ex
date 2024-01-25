defmodule BeehiveCompiler do
  def compile(filename) do
    if not String.ends_with?(filename, ".bhv") do raise "Bad file extension" end

    lex_result =
      filename
      |> File.read!()
      |> String.to_charlist()
      |> :beehive_lexer.string()

    tokens =
      case lex_result do
        {:ok, tokens, _} -> tokens
        {:error, {line, _module, {reason, description}}, _} -> throw "[Lex Error] line: #{line}   #{reason}: #{description}"
      end

    parse_result = :beehive_parser.parse(tokens)

    result_string =
      case parse_result do
        {:ok, res} -> res
        {:error, {line, _module, errors}} -> throw "[Parse Error] line: #{line}, errors: #{errors}"
      end

    lines =
      result_string
      |> List.to_string()
      |> String.split("\n")

    {result_string, _acc} = Enum.map_reduce(lines, 0, fn line, spaces ->
      {spaces, next_spaces} =
        case line do
          "end" -> {spaces - 2, spaces - 2}
          "defmodule " <> _module -> {spaces, spaces + 2}
          "def " <> _module -> {spaces, spaces + 2}
          "case " <> _module -> {spaces, spaces + 2}
          "if " <> _module -> {spaces, spaces + 2}
          "else" <> _module -> {spaces - 2, spaces}
          _else -> {spaces, spaces}
        end
      {String.duplicate(" ", spaces) <> line, next_spaces}
    end)

    result_string = Enum.join(result_string, "\n")

    filename
    |> String.replace_suffix(".bhv", ".ex")
    |> File.write(result_string)
  end
end
