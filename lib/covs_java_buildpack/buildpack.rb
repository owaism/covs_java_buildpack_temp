
$stdout.sync = true
$stderr.sync = true
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

module CovsJavaBuildpack
	class Buildpack

		# Buildpack Name
		@@name = "Covisint Java Buildpack"

		public

		# Buildpack Name Accessor
		def Buildpack.name
			@@name
		end

		# Detects if this build pack can be used on the applicaiton that has been pushed.
		def detect (build_dir)
			classes_folder = File.join ARGV[0], "classes"

			if File.exists? (classes_folder)
				puts "Covisint_Java_Application"
				exit 0
			else
				exit 1
			end
		end


		def compile (build_dir, cache_dir)
			#exec "echo 'unta22rring....'"
			puts "World..."
			puts "#{build_dir}/../../buildpacks/covs_java_buildpack/vendor/apache2.tar -C #{cache_dir} "

			puts "File Existance: "
			puts File.exists? "#{build_dir}/../../buildpacks/covs_java_buildpack/vendor/apache2.tar"
			puts "Apache Directory: #{build_dir}/../../buildpacks/covs_java_buildpack/vendor/"

			puts "ENV Variables: "

			ENV.each{|name, value|
				puts "#{name}: #{value}"
			}
			#exec "mkdir #{cache_dir}"
			value = %x(tar -xf #{build_dir}/../../buildpacks/covs_java_buildpack/vendor/apache2.tar -C #{build_dir}/../../buildpacks/covs_java_buildpack/ )
			value = %x(cp #{build_dir}/../../buildpacks/covs_java_buildpack/bin/boot.* ./)

			puts "Copied Boot Files..."
		end

	end

end