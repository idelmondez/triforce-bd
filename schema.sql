CREATE TABLE produtos (
  id_produto   SERIAL      PRIMARY KEY,
  nome         VARCHAR(100) NOT NULL,
  preco        DECIMAL(10,2) NOT NULL,
  estoque      INT          NOT NULL
);

CREATE TABLE pedidos (
  id_pedido    SERIAL      PRIMARY KEY,
  data_pedido  DATE        NOT NULL,
  id_produto   INT         NOT NULL REFERENCES produtos(id_produto),
  quantidade   INT         NOT NULL
);

INSERT INTO produtos (nome, preco, estoque) VALUES
  ('Tênis de Corrida Pro',    399.90, 50),
  ('Bicicleta Speed Carbono', 2799.00, 15),
  ('Maiô de Competição X',    199.90, 30);

INSERT INTO pedidos (data_pedido, id_produto, quantidade) VALUES
  ('2025-05-01', 1, 2),
  ('2025-05-02', 2, 1),
  ('2025-05-03', 3, 4);

SELECT * FROM produtos;

SELECT p.id_pedido, p.data_pedido, pr.nome AS produto, p.quantidade
  FROM pedidos p
  JOIN produtos pr ON pr.id_produto = p.id_produto;