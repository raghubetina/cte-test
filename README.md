# Testing ActiveRecord::Cte

 1. `bundle`
 2. `rails db:seed` to create 4 posts, 3 of which have `comments_count` OR `tags_count` of more than 0.
 3. In `rails console`,

    ```ruby
    Post.where.not(comments_count: ..0).
      or(Post.where.not(tags_count: ..0)).
      count
    ```

    correctly returns `3`.
 4. The example from [the documentation](https://github.com/vlado/activerecord-cte#activerecordcte),

    ```ruby
    Post.with(
      posts_with_comments: Post.where("comments_count > ?", 0),
      posts_with_tags: Post.where("tags_count > ?", 0)
    ).
    count
    ```

    incorrectly returns `4`.
