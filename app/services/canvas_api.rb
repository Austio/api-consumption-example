module CanvasAPI

  class Course
    attr_accessor :conn
    def initialize user=''
      @user = user
    end

    URL = 'http://canvas-api.herokuapp.com'


    def get
      api_conn.get '/api/v1/courses'
    end



    private
    def api_conn(site = URL)
      @conn ||= Faraday.new(site)
    end


  end



end