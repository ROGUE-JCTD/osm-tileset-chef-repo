actions :create, :remove, :modify, :manage, :lock, :unlock

attribute :username,      :kind_of => String, :name_attribute => true
attribute :comment,       :kind_of => String
attribute :uid,           :kind_of => [String,Integer]
attribute :gid,           :kind_of => [String,Integer]
attribute :home,          :kind_of => String
attribute :shell,         :kind_of => String
attribute :password,      :kind_of => String
attribute :system_user,   :default => false
attribute :manage_home,   :default => nil
attribute :non_unique,    :default => nil
attribute :create_group,  :default => nil
attribute :ssh_keys,      :kind_of => [Array,String], :default => []
attribute :ssh_keygen,    :default => nil

def initialize(*args)
  super
  @action = :create
end
