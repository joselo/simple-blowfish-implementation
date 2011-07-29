require 'rubygems'
require 'crypt/blowfish' # gem install crypt (http://crypt.rubyforge.org)

class Blowfish
  def self.decrypt_file(enc_filename, key)
    filename = enc_filename.sub(/\.enc$/, '.dec')    
    blowfish = Crypt::Blowfish.new(key)
    blowfish.decrypt_file(enc_filename, filename)
  end
      
  def self.encrypt_file(filename, key)
    enc_filename = "#{filename}.enc"
    blowfish = Crypt::Blowfish.new(key)
    blowfish.encrypt_file(filename, enc_filename)
  end  
end

key = "hellow"
#filepath = "files/test.txt"
filepath = "files/penguin.jpg"

#Delte previews
File.delete("#{filepath}.enc") if File.exist?("#{filepath}.enc")
File.delete("#{filepath}.dec") if File.exist?("#{filepath}.dec")

Blowfish.encrypt_file(filepath, key)
Blowfish.decrypt_file("#{filepath}.enc", key)