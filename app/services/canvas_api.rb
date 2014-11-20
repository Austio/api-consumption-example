module CanvasAPI

  class Course
    attr_accessor :conn
    attr_reader   :token, :user

    def initialize (user='')
      @user  = user
      @token = get_auth_token
    end

    def get_courses(page, per_page=2)
      parse_request (api_conn.get '/api/v1/courses', {:access_token => @token, :page=> page, :per_page => per_page})
    end

    def get_course(course_id)
      parse_request (api_conn.get "/api/v1/courses/#{course_id}", {:access_token => @token})
    end
    #
    # def enroll(course_id)
    #   data = {:access_token => @token, :type => 'student', :user => {:name => 'Johnny'} }
    #   parse_request (api_conn.post "/api/v1/courses/#{course_id}/enrollments", data)
    # end

    def get_auth_token
      request = parse_request(api_conn.post '/api/v1/tokens')
      request["body"]["token"]
    end



    def api_conn(site = 'http://canvas-api.herokuapp.com' )
      @conn ||= Faraday.new(site)
    end


    def parse_request(response)
      CanvasAPI::Parsed.request(response)
    end


  end

  class Request
    def self.auth_token

    end
  end

  class Parsed
    def self.request(response)
      {
          "status"  => response.status,
          "body"    => JSON.parse(response.body),
          "headers" => response.env.response_headers
      }
    end
  end
end