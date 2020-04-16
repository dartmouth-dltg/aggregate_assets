require 'securerandom'

Rails.application.config.after_initialize do
  
  plugin_directory = File.expand_path(File.dirname(__FILE__))

  plugin_name = plugin_directory.split("/")[-2]
  AppConfig[:precompile_assets_filename] = plugin_name + "-" + SecureRandom.hex
  old_aggregated_files = Dir.glob(File.join(plugin_directory,"assets","#{plugin_name}-*"))
  
  old_aggregated_files.each do |oaf|
    File.delete(oaf) if File.exist?(oaf)
  end

  css_files_to_be_aggregated = Dir[File.join(plugin_directory,"assets","*.css")]
  js_files_to_be_aggregated= Dir[File.join(plugin_directory,"assets","*.js")]
  
  File.open(File.join(plugin_directory,"assets", "#{AppConfig[:precompile_assets_filename]}.css"), "w") do |output_file|
    output_file.puts '@charset "utf-8";'
    css_files_to_be_aggregated.each do |input_file|
      File.open(input_file) do |file|
        file.each { |line|
          unless line.include?('@charset')
            output_file.puts line
          end
        }
      end
    end
  end
  
  File.open(File.join(plugin_directory,"assets", "#{AppConfig[:precompile_assets_filename]}.js"), "w") do |output_file|
    js_files_to_be_aggregated.each do |input_file|
      File.open(input_file) do |file|
        file.each { |line| output_file.puts line }
      end
    end
  end
  
end
