defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message(%{status: :started} = info) do
    IO.puts("\n ===== Ola #{Game.player().name} O Jogo iniciou! =====\n")
    IO.inspect(info)
    IO.puts("------------------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n ===== Eh a vez de #{player} jogar! =====\n")
    IO.inspect(info)
    IO.puts("------------------------------------------")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n ===== Fim de Jogo ! =====\n")
    IO.inspect(info)
    IO.puts("------------------------------------------")
  end

  @spec print_wrong_move_message(any) :: :ok
  def print_wrong_move_message(move) do
    IO.puts("\n ===== Movimento Inválido: #{move}. =====\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts(
      "\n ===== #{Game.player().name} atacou #{Game.computer().name} tirando #{damage}% de vida. =====\n"
    )
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts(
      "\n ===== #{Game.computer().name} atacou #{Game.player().name} tirando #{damage}% de vida. =====\n"
    )
  end

  def print_move_message(:player, :heal, life) do
    IO.puts("\n ===== #{Game.player().name} se curou e está com #{life}% de vida. =====\n")
  end

  def print_move_message(:computer, :heal, life) do
    IO.puts("\n ===== #{Game.computer().name} se curou e está com #{life}% de vida. =====\n")
  end
end
