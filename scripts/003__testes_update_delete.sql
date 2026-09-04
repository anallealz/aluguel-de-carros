-- Teste de UPDATE:
-- altera o endereço de uma pessoa cadastrada.

UPDATE pessoa
SET endereco = 'Rua Nova, 999'
WHERE cpf = '11111111111';


-- Teste de DELETE:
-- remove um contrato específico do banco.

DELETE FROM contrato
WHERE numero_contrato = 'CTR010';
