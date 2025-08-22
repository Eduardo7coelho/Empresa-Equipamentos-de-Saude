-- Usar o Banco de dados 
USE [dbHealthCare];
-- Inserir dados
INSERT INTO [dim_Localizacao] ([Pais], [Estado], [Cidade], [Longitude], [Latitude])
VALUES
('Brasil','São Paulo','São Paulo', -46.6333, -23.5505),
('Brasil','Rio de Janeiro','Rio de Janeiro', -43.1729, -22.9068),
('Brasil','Minas Gerais','Belo Horizonte', -43.9378, -19.9245),
('Brasil','Paraná','Curitiba', -49.2643, -25.4278),
('Estados Unidos','Califórnia','Los Angeles', -118.2437, 34.0522),
('Alemanha','Baviera','Munique', 11.5755, 48.1374);
