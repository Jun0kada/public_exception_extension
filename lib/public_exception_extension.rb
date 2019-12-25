# frozen_string_literal: true

require 'public_exception_extension/railtie'

module PublicExceptionExtension
  def call(env)
    request = ActionDispatch::Request.new(env)
    status  = request.path_info[1..-1].to_i

    begin
      content_type = request.formats.first
    rescue Mime::Type::InvalidMimeType
      content_type = Mime[:text]
    end

    body = { status: status, error: Rack::Utils::HTTP_STATUS_CODES.fetch(status, Rack::Utils::HTTP_STATUS_CODES[500]) }

    render(request, status, content_type, body)
  end

  private

  def render(request, status, content_type, body)
    format = "to_#{content_type.to_sym}" if content_type

    if format && body.respond_to?(format)
      render_format(status, content_type, body.public_send(format))
    else
      render_html(request, status)
    end
  end

  def render_format(status, content_type, body)
    [
      status,
      {
        "Content-Type" => "#{content_type}; charset=#{ActionDispatch::Response.default_charset}",
        "Content-Length" => body.bytesize.to_s,
      },
      [body],
    ]
  end

  def render_html(request, status)
    if Rails.application.config.respond_to?(:public_exception_template)
      file_path = Rails.application.config.public_exception_template.call(request, status)
      path = File.join(public_path, file_path) if file_path
    end

    path ||= ''

    path = "#{public_path}/#{status}.#{I18n.locale}.html" unless (found = File.exist?(path))
    path = "#{public_path}/#{status}.html" unless (found = File.exist?(path))

    if found || File.exist?(path)
      render_format(status, "text/html", File.read(path))
    else
      [404, { "X-Cascade" => "pass" }, []]
    end
  end
end
