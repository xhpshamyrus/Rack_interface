require_relative 'time_format'

class App
  def call(env)
    @request = Rack::Request.new(env)
    if @request.path_info == '/time'
      time_response
    else
      answer(404, "Incorrect request, somthing wrong!")
    end
  end

  def time_response
    time_response = TimeFormat.new(@request.params)

    if time_response.valid?
      answer(200, Time.now.strftime(time_response.time_format))
    else
      answer(400, "Unknown time format #{time_response.unknown_format}")
    end
  end

  private

  def answer(status, body)
    [status, {'Content-Type' => 'text/plain' }, [body]]
  end
end
