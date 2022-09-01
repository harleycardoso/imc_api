module Authenticable
    private

    #Armazena token na variavel
    def authenticate_with_token
        @token == request.headers['Authorization']

        #Response 401
        def valid_token?
            render  json:{ errors: "Esperado envio de token pelo header Autorization"},
                    status: :unauthorized
        end
    end

    #verifica campos de cabeçalho token de autenticação personalizados no header_fields Authorization
    def valid_token?
        @token.present? && @token == Rails.application.credentials.token
    end
end