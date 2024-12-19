-- inserção de dados e queries

use ecommerce_projeto;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname, CPF, Address) 
	   values('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores'),
		     ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores'),
			 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores'),
			 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores'),
			 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores'),
			 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores');

-- idProduct, Pname, classification_kids boolean, category('Eletrônicos','Roupas','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Fname, classification_kids, category, value_product, avaliação, dimensions) values
							  ('FoneOuvido',false,'Eletrônicos','R$30','4',null),
                              ('Barbie',true,'Brinquedos','R$160','3',null),
                              ('Camiseta',true,'Roupas','R$59','5',null),
                              ('Microfone',False,'Eletrônicos','R$50','4',null),
                              ('Sofá',False,'Móveis','R$1000','3','3x57x80'),
                              ('Farinha',False,'Alimentos','R$10','2',null),
                              ('Fire Stick',False,'Eletrônicos','R$200','3',null);

select * from clients;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

-- delete from orders where idOrderClient in  (1,2,3,4); 
insert into productOrder (idOrderClient, orderStatus, orderDescription, freightValue, freightCode) values 
							 (1, default,'compra via aplicativo',null,12345),
                             (2,default,'compra via aplicativo',50,8765),
                             (3,'Enviado',null,null,1543212),
                             (4,default,'compra via web site',150,002345678);

-- idPOproduct, idPOorder, poQuantity, poStatus
select * from productOrder;
insert into productByOrder (idPByProduct, idPByOrder, orderQuantity, ProdOrderStatus) values
						 (1,5,2,null),
                         (2,5,1,null),
                         (3,6,1,null);

-- storageLocation,quantity
insert into productStorage (storageLocation,quantity) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);

-- idLproduct, idLstorage, location
insert into storageLocation (idLocalProduct, idLocalStorage, location) values
						 (1,2,'RJ'),
                         (2,6,'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into suppliers (socialName, cnpj, contact) values 
							('Almeida e filhos', 123456789123456,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Eletrônicos Valma', 934567893934695,'21975474');
                            
select * from suppliers;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idProdSupplier, idProdProduct, prodQuantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into sellers (socialNameSeller, fantasyName, cnpjSeller, sellerLocation, contact) values 
						('Tech eletronics', null, 123456789456321, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,12345678355387,'Rio de Janeiro', 219567895),
						('Kids World',null,456789123654485,'São Paulo', 1198657484);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSellers (idProdSellers, idProductSellers, quantityProdSeller) values 
						 (1,6,80),
                         (2,7,10);

select * from productSeller;