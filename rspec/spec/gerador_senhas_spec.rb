require_relative '../../gerador_senha.rb'
require 'pry'

RSpec.describe GeradorAleatorioSenha do
  describe "deve carregar os metodos corretamente" do
    it "deve carregar o metodo carrega_massa" do
      massas = GeradorAleatorioSenha.new.carrega_massa
      expect(massas).not_to be_nil
    end
  end

  describe "deve me dar uma senha aleatoria corretamente" do
    it "deve retornar uma senha de 4 digitos numeros quando não ha parametros" do
      senha = GeradorAleatorioSenha.new.gerar_senha
      expect(senha.size).to eql(4)
    end

    it "deve gerar uma senha de 6 digitos numericos" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 6)
      expect(senha.size).to eql(6)
      expect(senha.match?(/^[0-9]+$/)).to be_truthy
    end

    it "deve gerar uma senha de 6 digitos somente com letras minusculas" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 6, letras_minusculas: true, letras_maiusculas: false, numeros: false, caracteres_especiais: false)
      expect(senha.match?(/^[a-z]+$/)).to be_truthy
    end

    it "deve gerar uma senha de 6 digitos somente com letras maiusculas" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 6, letras_minusculas: false, letras_maiusculas: true, numeros: false, caracteres_especiais: false)
      expect(senha.match?(/^[A-Z]+$/)).to be_truthy
    end

    it "deve gerar uma senha de 6 digitos somente com caracteres especiais" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 6, letras_minusculas: false, letras_maiusculas: false, numeros: false, caracteres_especiais: true)
      expect(senha.match?(/^[^a-zA-Z0-9]+$/)).to be_truthy
    end

    it "deve gerar uma senha com 6 digitos com todos os parametros" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 6, letras_minusculas: true, letras_maiusculas: true, numeros: true, caracteres_especiais: true)
      senha = senha.split("")
      expect(senha.first.match?(/^[a-z]+$/)).to be_truthy
      expect(senha[1].match?(/^[A-Z]+$/)).to be_truthy
      expect(senha[2].match?(/^[0-9]+$/)).to be_truthy
      expect(senha[3].match?(/^[^a-zA-Z0-9]+$/)).to be_truthy
    end
  end

  describe "deve gerar cenarios absurdos" do
    it "deve gerar uma senha de 100 numeros" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 100)
      expect(senha.size).to eql(100)
      expect(senha.match?(/^[0-9]+$/)).to be_truthy
    end
    
    it "deve gerar uma senha de 100 letras minusculas e maiusculas" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 100, letras_minusculas: true, letras_maiusculas: true, numeros: false, caracteres_especiais: false)
      senha = senha.split("")
      expect(senha.length).to eql(100)
      expect(senha[0].match?(/^[a-z]+$/)).to be_truthy
      expect(senha[1].match?(/^[A-Z]+$/)).to be_truthy
    end

    it "deve gerar uma senha de 100 numeros e caracteres especiais" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 100, letras_minusculas: false, letras_maiusculas: false, numeros: true, caracteres_especiais: true)
      senha = senha.split("")
      expect(senha.length).to eql(100)
      expect(senha[0].match?(/^[0-9]+$/)).to be_truthy
      expect(senha[1].match?(/^[^a-zA-Z0-9]+$/)).to be_truthy
    end

    it "deve gerar uma senha de 100 letras maiusculas caracteres especiais" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 100, letras_minusculas: false, letras_maiusculas: true, numeros: false, caracteres_especiais: true)
      senha = senha.split("")
      expect(senha.length).to eql(100)
      expect(senha[0].match?(/^[A-Z]+$/)).to be_truthy
      expect(senha[1].match?(/^[^a-zA-Z0-9]+$/)).to be_truthy
    end

    it "deve gerar uma senha de 100 letras minusculas e numeros" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 100, letras_minusculas: true, letras_maiusculas: false, numeros: true, caracteres_especiais: false)
      senha = senha.split("")
      expect(senha.length).to eql(100)
      expect(senha[0].match?(/^[a-z]+$/)).to be_truthy
      expect(senha[1].match?(/^[0-9]+$/)).to be_truthy
    end

    it "deve retornar uma senha de 1000 numeros" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 1000, letras_minusculas: false, letras_maiusculas: false, numeros: true, caracteres_especiais: false)
      expect(senha.size).to eql(1000)
      expect(senha.match?(/^[0-9]+$/)).to be_truthy
    end
  end

  describe "deve retornar uma senha mesmo com os parametros incompletos" do

    it "deve retornar uma senha somente com tamanho e letras minusculas preenchido" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 10, letras_minusculas: true)
      expect(senha.size).to eql(10)
      expect(senha.match?(/^[a-z]+$/)).to be_truthy
    end

    it "deve retornar uma senha somente com tamanho e caracter especial" do
      senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 10, caracteres_especiais: true)
      expect(senha.size).to eql(10)
      expect(senha.match?(/^[^a-zA-Z0-9]+$/)).to be_truthy
    end

    it "deve retornar uma senha de 4 letras minusculas caso não haja tamanho" do
      senha = GeradorAleatorioSenha.new.gerar_senha(letras_minusculas: true)
      expect(senha.size).to eql(4)
      expect(senha.match?(/^[a-z]+$/)).to be_truthy
    end
  end
end
