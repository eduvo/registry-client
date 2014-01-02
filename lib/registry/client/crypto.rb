require 'openssl'
require 'base64'

module Registry
  module Client
    module Crypto
      extend self

      def encrypt(key, data)
        aes = OpenSSL::Cipher.new("AES-256-CFB")
        aes.encrypt
        aes.key = key
        iv = aes.random_iv
        aes.iv = iv
        to_hex_string(iv + aes.update(data) + aes.final)
      end

      def decrypt(key, encrypted_data)
        aes = OpenSSL::Cipher.new("AES-256-CFB")
        aes.decrypt
        aes.key = key
        aes.iv = encrypted_data[0...16]
        (aes.update(to_byte_string(encrypted_data)) + aes.final)[16..-1]
      end

      def to_byte_string(txt)
        [txt].pack('H*')
      end

      def to_hex_string(txt)
        txt.unpack('H*').first
      end

    end
  end
end
