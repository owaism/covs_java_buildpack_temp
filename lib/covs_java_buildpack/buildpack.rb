
module CovsJavaBuildpack
	module Buildpack

		# Buildpack Name
		@@name = "Covisint Java Buildpack"

		public

		# Buildpack Name Accessor
		def Buildpack.name
			@@name
		end

		# Detects if this build pack can be used on the applicaiton that has been pushed.
		def Buildpack.detect (build_dir)
			classes_folder = File.join ARGV[0], "classes"

			if File.exists? (classes_folder)
				puts "Covisint_Java_Application"
				exit 0
			else
				exit 1
			end
		end


		def Buildpack.compile (build_dir, cache_dir)
			puts "Updating apt-get"
			exec 'sudo apt-get update'
			puts "installing apache2"
			exec 'sudo apt-get install apache2'
		end

	end

end