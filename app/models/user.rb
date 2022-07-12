class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         belongs_to :college, optional: true

         has_many :events ,dependent: :destroy
         has_many :users,  foreign_key: :parent_id ,dependent: :destroy
         belongs_to :parent, class_name: "User", optional: true
          #has_many :users,  foreign_key: :parent_id ,dependent: :destroy
         # after_create :assign_default_role

         # def assign_default_role

         #  self.add_role(:student) if self.roles.blank?
         # end
         accepts_nested_attributes_for :roles
         def role?
          #byebug

          if self.has_role? :superadmin
            return "superadmin"
          elsif self.has_role? :student
            return "student"
          elsif self.has_role? :college
            return "College"
          end
        end

        def self.get_colleges
          User.all.map{|u| u if u.roles.pluck(:name).include?("college") }.compact
        end

end
