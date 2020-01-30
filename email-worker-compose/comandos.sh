#pra construir a imagem
docker-compose up -d
#listar os servicos em execucao
docker-compose ps

#Testar se o arquivo compose esta ok 
# executa comanndo no servico db pra validar se o serico esta ok
docker-compose exec db psql -U postgres -c '\l'
