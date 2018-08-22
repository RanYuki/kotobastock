class ApplicationController < ActionController::Base
	#コントローラ+アクション名で分岐するための下準備
	before_action :request_path
	def request_path
    	@path = controller_path + '#' + action_name
    	def @path.is(*str)
        	str.map{|s| self.include?(s)}.include?(true)
    	end
	end
end
