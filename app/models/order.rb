class Order < ApplicationRecord
    belongs_to :user
    has_many :selections, dependent: :destroy
    has_many :photos, through: :selections

    after_create :confirmation_user, :confirmation_admin

    def confirmation_user

        @user = current_user
        UserMailer.confirmation_email(@user,self).deliver_now

    end

    def confirmation_admin
        AdminMailer.confirmation_email(self).deliver_now
    end

end
