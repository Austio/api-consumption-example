module CanvasAPI

  class Course
    attr_accessor :conn, :token

    def initialize (user='')
      @user  = user
    end



    def get
      parse_request (api_conn.get '/api/v1/courses')
    end


    def get_auth_token
      request = parse_request(api_conn.post '/api/v1/tokens')
      request["body"]["token"]
    end



    private
    def api_conn(site = 'http://canvas-api.herokuapp.com' )
      @conn ||= Faraday.new(site)
    end

    def parse_request(response)
      {
        "status"  => response.status,
        "body"    => JSON.parse(response.body),
        "headers" => response.env.response_headers
      }
    end



  end
end