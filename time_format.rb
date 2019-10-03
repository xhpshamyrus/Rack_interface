class TimeFormat
  attr_reader :time_format, :unknown_format

  FORMATS = { "year" => "%Y-",
              "month" => "%m-",
              "day" => "%d",
              "hour" => "%H ",
              "minute" => "%M ",
              "second" => "%S" }.freeze

  def initialize(params)
    @time_format = ''
    @unknown_format = []
    response(params['format'].split(','))
  end

  def valid?
    @unknown_format.empty?
  end

  private

  def response(params)
    params.each do |format|
      if FORMATS[format]
        @time_format += FORMATS[format]
      else
        @unknown_format << format
      end
    end
  end
end
