module CanvasAPI

  class Course
    attr_accessor :conn
    def initialize (user='')
      @user = user
    end



    def get
      api_conn.get '/api/v1/courses'
    end


    def auth_token
      api_conn.post '/api/v1/tokens'
    end


    private
    def api_conn(site = 'http://canvas-api.herokuapp.com' )
      @conn ||= Faraday.new(site)
    end

    def json_parse(response)
      {
        "status" => reponse.status
        "body"   => JSON.parse(response.body)
        "header" => response.header
      }
    end


  end



end