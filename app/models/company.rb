class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)
    end

    #in rake||| f = Company.first.give_freebie(Dev.first, "Bracelet", 12)
    #adds new freebie

    def self.oldest_company
        self.order(:founding_year).first
        #Company.all.order(:founding_year).first
    end

    #Company.oldest_company
end
