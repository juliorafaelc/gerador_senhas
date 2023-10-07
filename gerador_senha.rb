require "pry"
require "yaml"

class GeradorAleatorioSenha
  def carrega_massa
    #carrega o arquivo massas_senhas.yml no sistema
    if Dir.pwd.end_with?('rspec')
      YAML.load_file('../massas_senhas.yml')
    else
      YAML.load_file('massas_senhas.yml')  
    end
  end

    #transforma as massas de array para um hash
  def gerar_senha(params = {})

    #gera uma senha de 4 numeros aleatorios caso nenhum parametro seja selecionado
    return rand(1000..9999) if params.empty?    
    
    #carrega as massas para dentro da função
    massas = carrega_massa

    #separa os valores do hash de massas
    tamanho = params.fetch(:tamanho, 4)
    letras_minusculas = params.fetch(:letras_minusculas, false)
    letras_maiusculas = params.fetch(:letras_maiusculas, false)
    numeros = params.fetch(:numeros, false)
    caracteres_especiais = params.fetch(:caracteres_especiais, false)
    
    #cria a variavel senha contendo nada
    senha = ''
    
    #cria uma senha de numeros igual ao tamanho fornecido caso todos os outros parametros estejam falsos
    if (params.length == 1 && params.keys.first.eql?(:tamanho)) || (params.length == 5 && !letras_minusculas && !letras_maiusculas && !numeros && !caracteres_especiais)
      tamanho.times do
        senha += massas['numeros'].sample
        break if senha.length == tamanho
      end
    end

    #deve criar uma senha onde senha.length == tamanho
    while senha.length < tamanho
      if letras_minusculas
        senha += massas['letras_minusculas'].sample
        break if senha.length == tamanho
      end
      
      if letras_maiusculas
        senha += massas['letras_maiusculas'].sample
        break if senha.length == tamanho
      end

      if numeros
        senha += massas['numeros'].sample
        break if senha.length == tamanho
      end

      if caracteres_especiais
        senha += massas['caracteres_especiais'].sample
        break if senha.length == tamanho
      end
    end

    senha
  end
end

#senha = GeradorAleatorioSenha.new.gerar_senha(tamanho: 5, letras_minusculas: false, letras_maiusculas: false, numeros: false, caracteres_especiais: false)

#puts senha
