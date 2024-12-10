def main_menu
  loop do #loop構文は無限ループを記述する為の標準的な方法とされており可読性が高くrubyのスタイルガイド推奨
    display_main_menu
    num = gets.to_i
    case num
    when 1
      handle_evaluation
    when 2
      display_results
    when 3
      puts "終了します"
      break
    else
      puts "1から3で入力してください"
    end
  end
end

def display_main_menu
  puts "実施したい処理を選択してください"
  puts "1:評価ポイントとコメントを入力する"
  puts "2:今までの結果を確認する"
  puts "3:終了する"
end

def handle_evaluation
  point = prompt_for_point
  comment = prompt_for_comment
  save_evaluation(point, comment)
  puts "評価を保存しました"
end

def prompt_for_point
  loop do
    puts "1から5で評価を入力してください"
    point = gets.to_i
    return point if point.between?(1, 5)

    puts "1から5で入力してください"
  end
end

def prompt_for_comment
  puts "コメントを入力してください"
  gets.chomp
end

def save_evaluation(point, comment)
  post = "ポイント：#{point}　コメント：#{comment}"
  File.open("data.txt", "a") { |file| file.puts(post) }
end

def display_results
  puts "これまでの結果"
  if File.exist?("data.txt")
    File.open("data.txt", "r") do |file|
      file.each_line { |line| puts line }
    end
  else
    puts "データがありません"
  end
end

# 実行
main_menu
