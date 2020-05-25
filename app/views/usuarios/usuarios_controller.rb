class UsuariosController < ApplicationController
  before_action :find_usuario_id, only: [:edit, :delete, :update, :show]
  #@todo testar rest
  def index
    @usuarios = Usuario.paginate(page: params[:page], per_page: 5)
  end

  def new
    @usuario = Usuario.new
    responde_js
  end

  def create
    @usuario = Usuario.new(usuario_params)
    respond_to do |f|
      if @usuario.save
        f.html {redirect_to usuarios_url, notice: 'Usuario foi criado!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @usuario.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    responde_js
  end

  def show
    responde_js
  end

  def update
    respond_to do |f|
      if @usuario.update(usuario_params)
        f.html {redirect_to usuarios_url, notice: 'O usuario foi atualizado com sucesso!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @usuario.errors, status: :unprocessable_entity}
      end
    end
  end

  def delete
    if @usuario.delete
      puts "update foi realizado!"
    else
      puts "erro no update"
    end
  end

  private

  def responde_js
    respond_to do |f|
      f.js
      f.json
    end
  end

  def find_usuario_id
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :sobrenome, :celular, :email, :celular, :perfil, :encrypted_password)
  end

end
