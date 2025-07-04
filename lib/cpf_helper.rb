# frozen_string_literal: true

require_relative "cpf_helper/version"

module CpfHelper
  def self.valid?(cpf)
    return false if cpf.nil? || cpf.empty?
    cpf = clean_cpf(cpf)
    return false if cpf.length != 11 || !cpf.match?(/^\d+$/)
    return false if !validate_digits(cpf)
    true
  end

  def self.format(cpf)
    return nil unless valid?(cpf)
    cpf = clean_cpf(cpf)
    "#{cpf[0..2]}.#{cpf[3..5]}.#{cpf[6..8]}-#{cpf[9..10]}"
  end

  def self.clean(cpf)
    return nil unless valid?(cpf)
    clean_cpf(cpf)
  end

  def self.masked(cpf)
    return nil unless valid?(cpf)
    cpf = clean_cpf(cpf)
    "#{cpf[0..2]}.***.***-#{cpf[9..10]}"
  end

  private

    def self.clean_cpf(cpf)
      cpf.gsub(/[.-]/, "")
    end

    def self.validate_digits(cpf)
      sum_digits = 0
      cpf.chars[0..8].each_with_index do |digit, index|
        sum_digits += digit.to_i * (10 - index)
      end

      first_check_digit = (sum_digits * 10 % 11) % 10
      return false if first_check_digit != cpf[9].to_i

      sum_digits = 0
      cpf.chars[0..9].each_with_index do |digit, index|
        sum_digits += digit.to_i * (11 - index)
      end

      second_check_digit = (sum_digits * 10 % 11) % 10
      second_check_digit == cpf[10].to_i
    end
end
