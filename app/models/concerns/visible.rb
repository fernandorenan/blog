module Visible
    extend ActiveSupport::Concern

    VALID_STATUSES = ['public', 'private', 'archived']

    included do
      validates :status, inclusion: { in: VALID_STATUSES}
    end

    class_methods do
        def public_count

            countStatus =  where(status: 'public').count

            if  countStatus > 1
                "#{where(status: 'public').count} #{'articles'}" 
            elsif
                countStatus == 1
                "#{where(status: 'public').count} #{'article'}" 
            else    
                'no article.'    
            end     
        end 

        def public_count_comment

            countStatus =  where(status: 'public').count

            if  countStatus > 1
                "#{where(status: 'public').count} #{'commentarys'}" 
            elsif
                countStatus == 1
                "#{where(status: 'public').count} #{'commentary'}" 
            else    
                'no commentary.'    
            end     
        end 
          
    end


    def archived?
        status == 'archived'
    end
end    