class Course < Struct.new(:id, :name, :code, :description, :start, :end, :created )

  #returns the page number it should be apart of by twos
  def paginated_number
    (id.to_f/2).ceil
  end
end