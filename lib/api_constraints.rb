class ApiConstraints
	def initialize(options)
		@version = options[:version]
		@default = options[:default]
	end

	def matches?(req)
		@default || req.header['Accept'].include?("application/vnd.Crudstart.v#{@version}") #error may arise coz of Crudstart name u can replace that
	end
end