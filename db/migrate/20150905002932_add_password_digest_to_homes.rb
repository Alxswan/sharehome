class AddPasswordDigestToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :password_digest, :text
  end
end
