class CalculationsController < ApplicationController
   
   
   
    def flex_square
        # The incoming parameters for this action look like {"a_number"=>"5"}
        # Rails stores that hash in a variable called params
        
        @user_number = params["a_number"].to_i
        @squared_number = @user_number**2
        
        render("calculations/flexible_square_template.html.erb")
    end



    def flex_square_root
        # The incoming parameters for this action look like {"a_number"=>"5"}
        # Rails stores that hash in a variable called params
        
        @user_number = params["a_number"].to_i
        @square_root_number = @user_number**0.5
        
        render("calculations/flexible_square_root_template.html.erb")
    end



    def flex_payment
        # The incoming parameters for this action look like {"a_number"=>"5"}
        # They are   annual_int_rate   years   principal 
        # Rails stores that hash in a variable called params
        
        @annual_int_rate = params["annual_int_rate"].to_f / 100
        @years = params["years"].to_i
        @principal = params["principal"].to_f
        
        # Loan Payment = Amount / Discount Factor
        # P = A / D

        # Number of Periodic Payments (n) = Payments per year times number of years
        number_payments = @years.to_f * 12
        # Periodic Interest Rate (i) = Annual rate divided by number of payments per
        periodic_interest_rate = (@annual_int_rate.to_f / 100) / 12 

        # Discount Factor (D) = {[(1 + i) ^n] - 1} / [i(1 + i)^n]
        discount_factor = (((1+periodic_interest_rate)**number_payments)-1) / ((periodic_interest_rate)*(1+periodic_interest_rate)**number_payments)
    
        # P = A / D
        discount_factor=discount_factor.to_f
        @monthly_pmt = @principal / discount_factor
        
        render("calculations/flexible_payment_template.html.erb")
    end



    def flex_random
        # The incoming parameters for this action look like {"a_number"=>"5"}
        # They are   min_number   max_number 
        # Rails stores that hash in a variable called params
    
        @min_number = params["min_number"].to_i
        @max_number = params["max_number"].to_i
        @random_number=rand(@min_number..@max_number)
    
    render("calculations/flexible_random_template.html.erb")
    end
    
    

    def square_form
    render("calculations/flexible_square_form_template.html.erb")
    end



    def process_square
        @user_number = params["the_user_number"].to_f
        @squared_number = @user_number**2
        
        
    render("calculations/square_results_template.html.erb")
    end



# Keep on adding these def blocks for the other features

end