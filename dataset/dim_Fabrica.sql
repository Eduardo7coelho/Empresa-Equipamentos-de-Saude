-- Usar o Banco de dados 
USE [dbHealthCare];
-- Inserir dados
INSERT INTO [dim_Fabrica] ([Nome_Fabrica], [ID_Localizacao], [Capacidade_Producao_Mensal], [Status])
VALUES
('F�brica S�o Paulo', 1, 5000, 'Ativa'),
('F�brica Munique', 6, 3000, 'Ativa');