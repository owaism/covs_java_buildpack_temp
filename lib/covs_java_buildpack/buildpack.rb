
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
			puts "Untaring apache 2.."
			puts "#{build_dir}/../../buildpacks/covs_java_buildpack/vendor/apache2.tar -C #{cache_dir} "
			#exec "mkdir #{cache_dir}"
			exec "tar -xvf #{build_dir}/../../buildpacks/covs_java_buildpack/vendor/apache2.tar -C #{build_dir} "
			puts "Untared.. "
			apache2Dir = File.join cache_dir, "apache2"
			if File.exists? (apache2Dir)
				puts "Apache2 Untarred..."
			else
				puts "APACHE2 UNTARRING ERRORR"
			end
		end

	end

end