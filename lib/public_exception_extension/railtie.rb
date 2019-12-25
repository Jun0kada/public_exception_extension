# frozen_string_literal: true

module PublicExceptionExtension
  class Railtie < ::Rails::Railtie
    initializer 'public_exception_extension' do
      ActiveSupport.on_load :action_controller do
        ActionDispatch::PublicExceptions.prepend(PublicExceptionExtension)
      end
    end
  end
end
