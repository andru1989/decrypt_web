class CodingsController < ApplicationController

  def index
  end

  def decrypt
    decrypted = Coding.decrypt(params[:message], params[:key])

    respond_to do |format|
      format.json {render json: decrypted}
    end
  end

  def encrypt
    encrypted = Coding.encrypt(params[:message])

    respond_to do |format|
      format.json {render json: encrypted}
    end
  end


end