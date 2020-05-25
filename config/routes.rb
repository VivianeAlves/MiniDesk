Rails.application.routes.draw do
  get 'graficos/index'
  get 'graficos/por_status'
  get 'graficos/por_requisitante'
  root "application#index"
  resources :tecnicos
  get "/chamados/abertos" => "chamados#abertos"
  get "/chamados/atribuidos" => "chamados#atribuidos"
  get "/chamados/solicitacoes" => "chamados#solicitacoes"
  resources :chamados
  resources :acoes
  resources :tipos
  resources :setores
  resources :ativos
  resources :status
  devise_for :usuarios, path: 'accounts'
  resources :usuarios
end
