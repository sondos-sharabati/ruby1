class Entry < ApplicationRecord
    def day
        self.created_at.strftime("%B %e %Y")
    end

end
