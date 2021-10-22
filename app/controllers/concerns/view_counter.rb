# frozen_string_literal: true

module ViewCounter
  private

  def set_counter
    session[:counter] ||= 0 
    session[:counter] += 1
    @counter = session[:counter]
  end
end
