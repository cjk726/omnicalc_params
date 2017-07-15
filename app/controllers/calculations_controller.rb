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



    def square_root_form
        render("calculations/flexible_square_root_form_template.html.erb")
    end

    def process_square_root
        @user_number = params["the_user_number"].to_f
        @square_root_number = @user_number**0.5
        
        render("calculations/square_root_results_template.html.erb")
    end



    def payment_form
        render("calculations/flexible_payment_form_template.html.erb")
    end

    def process_payment
        
        # The incoming parameters for this action look like {"a_number"=>"5"}
        # They are   annual_int_rate   years   principal 
        # Rails stores that hash in a variable called params
        
        @annual_int_rate = params["annual_int_rate"].to_f
        @years = params["years"].to_f
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
        
        render("calculations/flexible_payment_results_template.html.erb")
    end



    def random_form
        render("calculations/flexible_random_form_template.html.erb")
    end

    def process_random
        # The incoming parameters for this action look like {"a_number"=>"5"}
        # They are   min_number   max_number 
        # Rails stores that hash in a variable called params
    
        @min_number = params["min_number"].to_f
        @max_number = params["max_number"].to_f
        @random_number=rand(@min_number..@max_number)
    
        render("calculations/flexible_random_results_template.html.erb")
    end



    def word_count_form
        render("calculations/word_count_form_template.html.erb")
    end

    def process_word_count

        @text = params[:text]
        @lowercase_text = @text.downcase
        @special_word = params[:special_word]
        @lowercase_word = @special_word.downcase
    
   #     @word_count = @text.split.count    Set the other beloe back to @text if the didn't work
        @word_count = @lowercase_text.split.count
        @character_count_with_spaces = @lowercase_text.length

        @character_count_without_spaces = @lowercase_text.gsub(/\s+/, "").length      
    #    @character_count_without_spaces = @text.gsub(/[^a-z0-9\s]/i, " ")     Tried this gsbu to fix last 2 test case fails but it broke more!

        phrase_split = @lowercase_text.split                                              # Create an array of words
        @occurrences=phrase_split.count(@lowercase_word)                          # Count the occurrences of the special word within the array

        render("calculations/word_count_results_template.html.erb")
    end
    
    
    
    
    
    def stats_form
        render("calculations/stats_form_template.html.erb")
    end

    def process_stats
    
        @numbers = params[:list_of_numbers]
        
        @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # The numbers the user input are in the array @numbers.


    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max - @numbers.min

    if 
      @count.odd?
      @median = @sorted_numbers[(@count-1)/2]
    else
      @median = (@sorted_numbers[(@count-1)/2] + @sorted_numbers[(@count)/2])/2
    end

    @sum = @numbers.sum

    @mean = @numbers.sum.to_f / @numbers.count.to_f

    numbers_minus_mean = []
    @numbers.each do |num|
      delta = (num - @mean)**2
      numbers_minus_mean.push(delta)
    @variance = numbers_minus_mean.sum / @count
    end
    
    @standard_deviation = @variance**0.5

    # From Stackoverflow
    @mode = @numbers.uniq.max_by{ |i| @numbers.count( i ) }
        
        render("calculations/stats_results_template.html.erb")
    end
    
    

# Keep on adding these def blocks for the other features

end