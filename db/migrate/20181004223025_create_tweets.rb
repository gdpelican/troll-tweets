class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :external_author_id
      t.string :author
      t.string :content
      t.string :region
      t.string :language
      t.datetime :publish_date
      t.datetime :harvested_date
      t.integer :following
      t.integer :followers
      t.integer :updates
      t.string :post_type
      t.string :account_type
      t.boolean :retweet
      t.string :account_category
      t.string :new_june_2018
      t.string :alt_external_id
      t.bigint :tweet_id
      t.string :article_url
      t.string :tco1_step1
      t.string :tco2_step1
      t.string :tco3_step1
      t.integer :tweet_hour
    end
  end
end
