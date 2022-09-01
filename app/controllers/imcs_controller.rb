class ImcsController < ApplicationController
  include Authenticable

  before_action :authenticate_with_token

  def calcula
    @peso = Float(params[:weight]) 
    @altura = Float(params[:height]) 
    @imc = (@peso/(@altura * @altura)).round(2)

    if((@imc < 18.5) || (@imc == 18.5)) 
      @resultado = "Magro ou Baixo"
      @obesity = "0"
      @risc = "Normal ou Elevado"
    elsif((@imc > 18.5) && (@imc < 24.9))
      @resultado = "Normal ou Eutrófico"
      @obesity = "0"
      @risc = "Normal"
    elsif((@imc > 25) && (@imc < 29.9))  
      @resultado = "Sobrepeso ou Pré-obeso"
      @obesity = "0"
      @risc = "Pouco Elevado"
    elsif((@imc > 30) && (@imc < 34.9 ))
      @resultado = "Obesidade"
      @obesity = "I"
      @risc = "Elevado"
    elsif((@imc > 35) && (@imc < 39.9 ))
      @resultado = "Obesidade"
      @obesity = "II"
      @risc = "Muito Elevado"
    elsif((@imc == 40) || (@imc > 40))
      @resultado = "Obesidade Grave"
      @obesity = "III"
      @risc = "Muitíssimo Elevado"
    end

    render json: {
        "imc": @imc,
        "classification": @resultado,
        "obesity": @obesity 
      }, status: :ok
      
  end
  
end
