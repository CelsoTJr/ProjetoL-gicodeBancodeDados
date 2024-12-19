-- criação do BD p/ cenário E-Commerce
-- drop database ecommerce_projeto;
create database ecommerce_projeto;
use ecommerce_projeto;

-- criar tabelas do modelo relacional
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10) not null,
    Minit char(3),
    Lname varchar(30) not null,
    CPF char(11) not null,
    Address varchar(90) not null,
    Bdate date,
    constraint unique_cpf_client unique (CPF)
);
alter table clients auto_increment=1;
create table product(
	idProduct int auto_increment primary key,
    Fname varchar(10) not null,
    classification_kids bool,
    category enum('Eletrônicos','Roupas','Brinquedos','Alimentos','Movéis','Livros','Jogos') not null,
    description_product varchar(45),
    value_product varchar(45) not null,
    avaliação float default 0,
    dimensions varchar(10)
);
alter table product auto_increment=1;

create table payments(
	idClient int,
    idPayment int,
    paymentType enum('PIX','Crédito','Débito','Boleto'),
    limitAvailable float,
    primary key(idClient, idPayment),
    constraint fk_payment_orders foreign key (idClient) references clients(idClient)
);

create table productOrder(
	idOrder int auto_increment primary key,
    idOrderClient int, 
    orderStatus enum('Em Andamento','Processando','Enviado','Entregue','Cancelado') default 'Processando',
    orderDescription varchar(255),
    freightValue float default 0,
    freightCode int,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);
alter table productOrder auto_increment=1;

create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);
alter table productStorage auto_increment=1;

create table suppliers(
	idSuppliers int auto_increment primary key,
    socialName varchar(255) not null,
    cnpj char(15) not null,
    contact char(11) not null,
    constraint unique_supplier_cnpj unique (cnpj)
);
alter table suppliers auto_increment=1;

create table sellers(
	idSellers int auto_increment primary key,
    socialNameSeller varchar(255) not null,
    sellerLocation varchar(255) not null,
    cnpjSeller char(15) not null,
    contact char(11) not null,
    fantasyName varchar(255),
    constraint unique_sellers_cnpj unique (cnpjSeller)
);
alter table sellers auto_increment=1;

create table productSellers(
	idProdSellers int,
    idProductSellers int, 
    quantityProdSeller int default 1,
    primary key (idProdSellers, idProductSellers),
    constraint fk_prod_seller foreign key (idProdSellers) references sellers(idSellers),
    constraint fk_product_seller foreign key (idProductSellers) references product(idProduct)
);
alter table productSellers auto_increment=1;

create table productByOrder(
	idPByProduct int,
    idPByOrder int,
    orderQuantity int default 1,
	ProdOrderStatus enum('Disponível','Indisponível') default 'Disponível',
    primary key (idPByProduct, idPByOrder),
    constraint fk_product_by_product foreign key (idPByProduct) references product(idProduct),
    constraint fk_product_by_order foreign key (idPByOrder) references productOrder(idOrder)
);
alter table productByOrder auto_increment=1;

create table storageLocation(
	idLocalProduct int,
    idLocalStorage int,
    location varchar(255) not null,
    primary key (idLocalProduct, idLocalStorage),
    constraint fk_local_product foreign key (idLocalProduct) references product(idProduct),
    constraint fk_local_storage foreign key (idLocalStorage) references productStorage(idProdStorage)
);
alter table storageLocation auto_increment=1;

create table productSupplier(
	idProdSupplier int,
    idProdProduct int,
    prodQuantity int not null,
    primary key (idProdSupplier, idProdProduct),
    constraint fk_prod_supplier foreign key (idProdSupplier) references suppliers(idSuppliers),
    constraint fk_product_supplier foreign key (idProdProduct) references product(idProduct)
);
alter table productSupplier auto_increment=1;

-- desc productSupplier;

-- show tables;
-- show databases;

use information_schema;

-- desc referential_constraints;

-- select * from referential_constraints;

-- select * from referential_constraints 
--	where constraint_schema = 'ecommerce_projeto';