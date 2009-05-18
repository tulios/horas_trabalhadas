ActionController::Routing::Routes.draw do |map|
  map.resources :summary_reports, :as => "relatorio",
                :path_names => {:new => "novo", :show => "visualizar"}

  map.resources :sessions, :as => "sessao", :path_names => {:new => "nova"}

  map.resources :users, :as => "usuarios", :path_names => {:new => "novo", :edit => "ver"} do |usr|
    usr.resources :time_logs, :as => "registro_de_horas", :path_names => {:new => "novo", :edit => "ver"}
    usr.resources :project_memberships, :as => "associacao", :path_names => {:new => "nova", :edit => "ver"}
  end
  
  map.resources :projects, :as => "projetos", :path_names => {:new => "novo", :edit => "ver"} do |prj|
    prj.resources :task_types, :as => "tipos_de_tarefa", :path_names => {:new => "novo", :edit => "ver"} do |tt|
      tt.resources :time_logs, :as => "registro_de_horas", :path_names => {:new => "novo", :edit => "ver"}
    end
    prj.resources :project_memberships, :as => "associacao", :path_names => {:new => "nova", :edit => "ver"}
  end

  map.root :controller => "projects"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
