class GraficosController < ApplicationController
  layout "graficos"

  def index
    #conta o número de chamados por tecnico
    @hash = Chamado.group(:tecnico_id).count
    hash_new_keys = {}
    @hash.each_key do |x|
      valor = Usuario.joins(:tecnico).where("tecnicos.id = #{x}").pluck(:nome).first
      hash_new_keys[x] = valor
    end
    #substitui as chaves do hash
    puts @hash.transform_keys!(&hash_new_keys.method(:[]))
  end

  def por_status
    #gera nomes aleatorios
    @ramdom_file_name = (0...8).map {(65 + rand(26)).chr}.join
    @chamados_por_status = Chamado.group(:status_id).count
    hash_new_keys = {}
    @chamados_por_status.each_key do |x|
      valor = Status.where("id = #{x}").pluck(:descricao_status).first
      hash_new_keys[x] = valor
    end
    puts @chamados_por_status.transform_keys!(&hash_new_keys.method(:[]))
  end

  def por_requisitante
    @chamados_por_requisitante = Chamado.group(:usuario_id).limit(10).count
    puts "teste: #{@chamados_por_requisitante}"
      hash_new_keys = {}
      @chamados_por_requisitante.each_key do |x|
        valor = Usuario.where("id = #{x}").pluck(:nome).first
        hash_new_keys[x] = valor
      end
      puts @chamados_por_requisitante.transform_keys!(&hash_new_keys.method(:[]))
  end

end
