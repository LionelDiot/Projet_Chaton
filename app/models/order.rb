class Order < ApplicationRecord
    belongs_to :user
    has_many :selections
    has_many :photos, through: :selections

    after_update :confirmation_user, :confirmation_admin

    def confirmation_user

        @user = User.find(self.user_id)
        UserMailer.confirmation_email(@user,self).deliver_now

    end

    def confirmation_admin
        AdminMailer.confirmation_email(self).deliver_now
    end

    def add_data_to_order(photo)
        self.urls << photo.image_url
        self.titles << photo.title
        self.total = self.total + photo.price 
        self.total = (self.total).round(2)
    end

    def fill_order(cart)    
        @cart = cart    
        @cart.photos.each do |photo|
            add_data_to_order(photo)
        end
        self.total = (self.total).round(2)
        self.save
    end

end
