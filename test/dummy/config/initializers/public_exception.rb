Rails.application.config.public_exception_template = -> (request, status) do
  if request.original_fullpath.start_with?('/admin')
    '/admin/500.html'
  end
end
