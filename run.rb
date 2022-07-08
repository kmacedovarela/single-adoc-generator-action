require 'asciidoctor'

file_to_process = ARGV[0]
output_directory = ARGV[1]
local_execution = ARGV[2]

if !file_to_process || !file_to_process.end_with?(".adoc")
  warn 'You must provide an .adoc source file to be processed'
  exit 1
end

# local_execution ? full_file_path = file_to_process : full_file_path = File.join("/github/workspace/", file_to_process)
full_file_path = File.join("/github/workspace/", file_to_process)

file_base_name = File.basename(file_to_process)
output_file = File.join(output_directory,"single-page.adoc")

puts "====="
# puts %x|ls -l 3 /github/workspace/|
puts "Input file: "+ full_file_path
puts "Output file: "+ output_file
puts "====="



source = File.read full_file_path
doc = Asciidoctor.load_file ARGV[0], :safe => :safe, :parse_header_only => true
reader = Asciidoctor::PreprocessorReader.new doc, source
preprocessed_source = reader.read.gsub(/^include::/, '\\include::')
File.open(output_file, 'w') {|f| f.write preprocessed_source }
