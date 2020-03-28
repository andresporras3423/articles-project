module ArticlesHelper
    def most_voted_article
        sql = "select a.id 
               from articles as a 
               inner join votes as v 
               group by v.article_id 
               order by count(v.article_id)"
        hash_id=ActiveRecord::Base.connection.execute(sql)
        Article.all.find(hash_id[0]['id'])
    end
end
