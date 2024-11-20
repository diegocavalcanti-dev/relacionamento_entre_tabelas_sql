
-- adicionando relacionando between tables
ALTER TABLE inventory 
ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE;

-- verifiacando o relacionamento criado
\d inventory

-- testando o relacionamento
SELECT 
    p.product_name,
    p.price,
    i.quantity,
    i.update_at
FROM 
    product p
JOIN 
    inventory i ON p.id = i.product_id;

-- testando a exclusão de produtos
DELETE FROM product WHERE id = 1;

-- verificando os itens da tabela inventory e product
SELECT * FROM inventory;
SELECT * FROM product;

------------- extração do script
----------pg_dump -U postgres -d ebac_2 -s -f script_schema.sql