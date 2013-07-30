#!/usr/bin/env ruby

begin
	File.readlines(ARGV.first).      # le o arquivo passado como parametro, e retorna um array de cada linha
		join.                        # junto todas as linhas p/ formar uma 'stringona'
		gsub(/[^a-zA-Z\s]/, "").     # tudo que nao for caracter ou quebra de linha (\t, \n, \r\n, etc) retiro da stringona
		split(/\s+/).                # transformo a stringona em um array de palavras, usando a quebra de linha para splitar
		group_by(&:downcase).        # agrupo as palavras pela versao toda minuscula delas, aqui o resultado sera um array da sequinte forma [{"a" => ["a", "a", "a"]}, {"b" => ["b", "b"]}]
		map{|k,v| [k, v.length]}.    # transformo o array retornado acima em: [["a", 3], ["b", 2]], ou seja, a palavra e numero de repeticoes
		sort{|x,y| y[1] <=> x[1]}.   # ordeno o array pelo maior numero de repeticoes
		each_with_index{|v, i| puts "#{i+1} - #{v[0]} (#{v[1]}x)"} # printo na tela o resultado
rescue
	puts "\nErros acontecem!"
end