module CanvasAPI

  class Course
    attr_accessor :conn
    attr_reader   :token, :user

    def initialize (user='')
      @user  = user
      @token = user.auth_token
    end

    def get_courses(page, per_page=2)
      parse_request (api_conn.get '/api/v1/courses', {:access_token => @token, :page=> page, :per_page => per_page})
    end

    def get_course(course_id)
      parse_request (api_conn.get "/api/v1/courses/#{course_id}", {:access_token => @token})
    end

    def enroll(course_id)
      api_conn.headers['Authorization'] = "Token #{@token}"
      data = {:type => 'student', :user => {:name => 'Johnny'} }.to_json
      parse_request (api_conn.post "/api/v1/courses/#{course_id}/enrollments", data)
    end

    def api_conn
      @conn ||= CanvasAPI::Connection.establish
    end

    def parse_request(response)
      CanvasAPI::Parsed.request(response)
    end
  end

  class Connection
    def self.establish(site='http://canvas-api.herokuapp.com')
      Faraday.new(site)
    end
  end

  class Request
    def self.auth_token
      request = CanvasAPI::Parsed.request(CanvasAPI::Connection.establish.post '/api/v1/tokens')
      request["body"]["token"]
    end
  end

  class Parsed
    def self.request(response)
      {
          "status"  => response.status,
          "body"    => JSON.parse(response.body),
          "headers" => response.env.try(:response_headers)
      }
    end
  end
end