#pra construir a imagem
docker-compose up -d

#listar os servicos em execucao
docker-compose ps

#Testar se o arquivo compose esta ok
# executa comanndo no servico db pra validar se o serico esta ok
docker-compose exec db psql -U postgres -c '\l'

#para escalar um servico basta usar a tag --scale <nome_servico>=<quantidade de instancias>
docker-compose up -d --scale worker=3

#construir uma imagem a partir do dockerfile worker eh um diretorio que contem dockerfile
docker image build -t imagemcapela diretorio/

# excutar container em modo iterativo
docker container run -it  --name meucontainer imagemcapela

# dado que um container esteja executado para acesser o bash interno do container basta executar
docker container run -it --volumes-from=<nome_container> debian
