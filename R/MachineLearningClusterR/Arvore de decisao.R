
#importando dados 
dados <- read.csv("https://gist.githubusercontent.com/guilhermesilveira/4d1d4a16ccbf6ea4e0a64a38a24ec884/raw/afd05cb0c796d18f3f5a6537053ded308ba94bf7/car-prices.csv")

#usando a biblioteca dplyr
library(dplyr)

#transformando os dados em dataframe
dados <- data.frame(dados)

#visualizando os 5 primeiros registros 
head(dados)

#renomeando as colunas
dados <- rename(dados,
                milhas_por_ano = mileage_per_year,
                ano_do_modelo =  model_year,
                preco = price,
                vendido = sold)

#criando uma categorização de dados sobre vendidos
dados$vendido <- factor(dados$vendido, 
                        labels = c(0,1),
                        levels = c("yes","no"))

#criando uma variavel idade_do_modelo 
dados$idade_do_modelo =2018- dados$ano_do_modelo

#criando uma variavel km_por_ano 

dados$km_por_ano = dados$milhas_por_ano * 1.60934

#deletando colunas  X , milhas_por_ano e  ano_do_modelo
dados$X <- NULL
dados$milhas_por_ano <- NULL
dados$ano_do_modelo <- NULL

head(dados)
