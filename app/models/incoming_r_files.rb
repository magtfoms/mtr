class Incoming_r_files
   def self.all
       r_files = Incoming_doc.get_files_from_dir(Configuration.incoming_dir + '/r_files')
       ss_files = Incoming_doc.get_files_from_dir(Configuration.incoming_dir + '/ss_files')
       sr_files = Incoming_doc.get_files_from_dir(Configuration.incoming_dir + '/sr_files')
       r_files.map do |r_file|
           normal_r_file_name = normal_r_file_name r_file
           ss_file = ss_files.select { |ss_file| normalize_name(ss_file) == normal_r_file_name }
           sr_file = ss_files.select { |sr_file| normalize_name(sr_file) == normal_r_file_name }
           new(r_file, ss_file.first, sr_file.first)
       end
   end
    
   def initialize r_file, ss_file, sr_file
       @r_file = r_file
       @ss_file = ss_file
       @sr_file = sr_file
   end
   def valid?
       @r_file and @ss_file and @sr_file and
       valid_names? and
       Cryptography.validate_document @ss_file and 
       Cryptography.validate_document @sr_file
   end
   def errors
   end
   def info
   end
   
   def valid_names?
       normalize_r_file_name == normalize_name @ss_file and
       normalize_r_file_name == normalize_name @sr_file
   end
   
   def normalize_name file_name
       match = file_name.match /\w\w(\d{6})\d{4}(\d{4})\./
       match.captures.join
   end
   def normalize_r_file_name file_name
       match = @r_file.match /(\d+).OMS/i
       match.captures.join
   end
   
end