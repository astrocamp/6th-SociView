# def ptt_update_boards()
#   data_boards = CSV.read("#{Rails.root}/lib/tasks/Crawler/PTT/ptt_boards_url.csv")
#   data_boards.each do |arr|
#     colums = [:name, :alias, :source_id]
#     values = [[arr[2], arr[3], 2]]
#     Board.import colums, values, validate: false
#   end

#   Board.where.not(id: Board.group(:alias).select("min(id)")).destroy_all
# end

# def ptt_csv_to_psql()
#   data_posts = CSV.read("#{Rails.root}/lib/tasks/Crawler/PTT/ptt_post_content.csv")
#   data_posts.each do |arr|
#     post_colums = [:alias, :url, :author, :title, :created_at, :comment_count, :content, :pid, :clean, :token, :pos, :no_stop, :keyword, :sentiment]
#     post_values = [[arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9], arr[10], arr[11], arr[12], arr[13], arr[14]]]

#     Post.import post_colums, post_values, validate: false
#   end

#   data_comments = CSV.read("#{Rails.root}/lib/tasks/Crawler/PTT/ptt_comment_content.csv")

#   data_comments.each do |arr|
#     comment_colums = [:alias, :url, :author, :created_at, :content, :pid, :clean, :token,
#                       :pos, :no_stop, :keyword, :sentiment]
#     comment_values = [[arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9], arr[10], arr[11], arr[12]]]

#     Comment.import comment_colums, comment_values, validate: false
#   end

#   puts "=====CSV write into PSQL Success====="
# end

def ptt_csv_to_psql()
  data_posts = CSV.read("#{Rails.root}/data/ptt_post_content.csv")
  data_posts.each do |arr|
    post_colums = [:alias, :url, :author, :title, :created_at, :comment_count, :content, :pid, :clean, :token, :pos, :no_stop, :keyword, :sentiment]
    post_values = [[arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9], arr[10], arr[11], arr[12], arr[13], arr[14]]]

    Post.import post_colums, post_values, validate: false
  end

  data_comments = CSV.read("#{Rails.root}/data/ptt_comment_content.csv")

  data_comments.each do |arr|
    comment_colums = [:alias, :url, :author, :created_at, :content, :pid, :clean, :token,
                      :pos, :no_stop, :keyword, :sentiment]
    comment_values = [[arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9], arr[10], arr[11], arr[12]]]

    Comment.import comment_colums, comment_values, validate: false
  end
end

def ptt_boards()
  data_boards = CSV.read("#{Rails.root}/data/ptt_boards_url.csv")
  data_boards.each do |arr|
    colums = [:name, :alias, :source_id]
    values = [[arr[2], arr[3], 2]]
    Board.import colums, values, validate: false
  end
end
