class Role < Refinery::Core::BaseModel
  attr_accessible :title

  # TODO: This works around a bug in rails habtm with namespaces.
  has_many :roles_users, :class_name => "RolesUsers"
  has_many :users, :through => :roles_users

  before_validation :camelize_title
  validates :title, :uniqueness => true

  def camelize_title(role_title = self.title)
    self.title = role_title.to_s.camelize
  end

  def self.[](title)
    find_or_create_by_title(title.to_s.camelize)
  end
end