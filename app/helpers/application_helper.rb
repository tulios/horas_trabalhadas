# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
   def show_info()
     if flash[:notice]
       %Q{
          <p class="successMessage">#{flash[:notice]}</p>
        }
     end
   end

   def show_error()
     if flash[:error]
       %Q{
          <p class="errorMessage">#{flash[:error]}</p>
        }
     end
   end

   def marcar_aba(nome_controlador)
     if (nome_controlador == controller_name)
       return "active"
     end     
   end
end
