class MainsController < ApplicationController
    
    def index
        @books=Book.all
        @sports=Sport.all
        @events=Event.all
        @customers=Customer.all
        @resumes=Resume.all
    end
end
