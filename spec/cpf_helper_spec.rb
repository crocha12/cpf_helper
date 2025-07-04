# frozen_string_literal: true

RSpec.describe CpfHelper do
  describe ".valid?" do
    it "returns false for nil" do
      expect(CpfHelper.valid?(nil)).to be false
    end

    it "returns false for empty string" do
      expect(CpfHelper.valid?("")).to be false
    end

    it "returns false for invalid CPF format" do
      expect(CpfHelper.valid?("21583422005")).to be true
      expect(CpfHelper.valid?("215.834.220-05")).to be true
      expect(CpfHelper.valid?("1234567890")).to be false
      expect(CpfHelper.valid?("123.456.789-00")).to be false
    end

    it "returns true for valid CPF" do
      expect(CpfHelper.valid?("123.456.789-09")).to be true
    end
  end

  describe ".format" do
    it "returns formatted CPF" do
      expect(CpfHelper.format("12345678909")).to eq("123.456.789-09")
      expect(CpfHelper.format("123.456.789-09")).to eq("123.456.789-09")
    end

    it "returns nil for invalid CPF" do
      expect(CpfHelper.format("1234567890")).to be_nil
      expect(CpfHelper.format("123.456.789-00")).to be_nil
    end
  end

  describe ".clean" do
    it "returns cleaned CPF" do
      expect(CpfHelper.clean("123.456.789-09")).to eq("12345678909")
      expect(CpfHelper.clean("12345678909")).to eq("12345678909")
    end

    it "returns nil for invalid CPF" do
      expect(CpfHelper.clean("123.456.789-00")).to be_nil
      expect(CpfHelper.clean("1234567890")).to be_nil
    end
  end

  describe ".masked" do
    it "returns masked CPF" do
      expect(CpfHelper.masked("12345678909")).to eq("123.***.***-09")
      expect(CpfHelper.masked("123.456.789-09")).to eq("123.***.***-09")
    end

    it "returns nil for invalid CPF" do
      expect(CpfHelper.masked("1234567890")).to be_nil
      expect(CpfHelper.masked("123.456.789-00")).to be_nil
    end
  end
end
