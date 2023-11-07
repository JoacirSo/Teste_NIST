% Uso do site gerador quantico de bits aleatórios 
% https://qrng.anu.edu.au/random-binary/

clc,clear,home
% Para gerar blocos de 8 bits aleatórios use 
% url = 'https://qrng.anu.edu.au/wp-content/plugins/colours-plugin/get_one_binary.php'; 

% Para gerar blocos de 1024 bits aleatórios use
url = 'https://qrng.anu.edu.au/wp-content/plugins/colours-plugin/get_block_binary.php';
randomNumbers = ''; tamAle=1000000;
tic
while numel(randomNumbers) < tamAle
    weboptions('Timeout',2146); 
    binary = webread(url); % Fazer o download do binário aleatório da página
    % Verificar se o valor lido é diferente do valor anterior
    if isempty(randomNumbers) || ~strcmp(binary, randomNumbers(end))
        randomNumbers = [randomNumbers binary];
    end
end
toc
% Salvar os números aleatórios em um arquivo .dat
filename = 'random_numbers.dat';fid = fopen(filename, 'w'); 
fprintf(fid, '%s\n', randomNumbers(1:tamAle)); fclose(fid);
disp('Os números aleatórios foram salvos no arquivo random_numbers.dat.');
