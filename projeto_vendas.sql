Create database Projeto
-----------------------
use Projeto
-----------------------
create table pessoa
(
	codigo int not null,
	nome char(30) not null,
	email char(30),
	endereco char(30),
	cidade char(15),
	uf char(2),
	telefone char(10),
	primary key(codigo)
)

create table cliente
(
	codcliente int not null,
	datavinculo date,
	primary key(codcliente),
	foreign key(codcliente) references pessoa (codigo)
)

create table fisico 
(
	codfisico int not null,
	cpf char(11) not null,
	primary key(codfisico),
	foreign key(codfisico) references cliente (codcliente),
	unique (cpf)
)

create table juridico
(
	codjuridico int not null,
	cnpj char(14) not null,
	primary key(codjuridico),
	foreign key(codjuridico) references cliente (codcliente),
	unique(cnpj)
)


create table funcionario
(
	codfuncionario int not null,
	cpf char(11) not null,
	salario money,
	primary key(codfuncionario),
	foreign key (codfuncionario) references pessoa (codigo),
	unique(cpf)
)


create table fornecedor
(
	codfornecedor int not null,
	cnpj char(14) not null,
	empresanome char(30)not null,
	email char(40) not null,
	telfornecedor char(10),
	primary key(codfornecedor),
	unique (cnpj)
)

create table produto
(
	codproduto int not null,
	nome varchar(20) not null,
	descricao text,
	qtd_estoquem3 float not null,
	precom3 money not null,
	primary key(codproduto)
)

create table fornece
(
	codproduto int not null,
	codfornecedor int not null,
	datafornecimento date not null,
	foreign key(codproduto) references produto (codproduto),
	foreign key(codfornecedor) references fornecedor (codfornecedor)
)

create table pedido
(
	codpedido int not null,
	codcliente int not null,
	codfuncionario int not null,
	datapedido date not null,
	valortotal money not null,
	primary key(codpedido),
	foreign key (codcliente) references cliente (codcliente),
	foreign key	(codfuncionario) references funcionario (codfuncionario)
)

--relacionamento compor
create table itempedido
(
	codpedido int not null,
	codproduto int not null,
	quantm3 float not null,
	primary key (codpedido,codproduto),
	foreign key (codpedido) references pedido (codpedido),
	foreign key (codproduto) references produto (codproduto)
)

/*------------- INDICES DAS TABELAS------------*/

create index idxcodproduto on fornece(codproduto)
create index idxcodfornecedor on fornece(codfornecedor)
create index idxcodcliente on pedido(codcliente)


/*-----------INSERCAO DE DADOS-------------
1)Inserir 9 Pessoas
2)Inserir 3 Funcionario
3)inserir 3 Cliente Fisico e 3 Juridico
4)Inserir 6 Fornecedores
5)Inserir 7 Produtos
6)Inserir Relaçao de fornecimento
7)Inserir Pedido Fisico e Juridico
8)Inserir itemPedido em cada pedido
*/

-- 1)Insercao de 9 Pessoas
insert into pessoa values(157692,'Antonio','antonio@hotmail.com','Orlando Pavan','Hortolandia','SP','38875263') --Funcionario
insert into pessoa values(155553,'Giovana','gigirardi@gmail.com','Rua Masterchef','Paulinia','SP','38748038')	--Cliente Fisico
insert into pessoa values(123456,'Brandon','bendy@hotmail.com','Rua Unitec','Limeira','SP','98328734') --Cliente Juridico

insert into pessoa values(215487,'Douglas','doug@hotmail.com','Rua Lima','Limeira','SP','98876554') 
insert into pessoa values(235689,'Allan','allan@hotmail.com','Rua Morar','Limeira','SP','97985487') 
insert into pessoa values(251447,'Miguel','mig@hotmail.com','Rua Campineira','Campinas','SP','95844859') 
insert into pessoa values(253625,'Isadora','isa@hotmail.com','Rua Washington','Jefferson','PS','96857485') 
insert into pessoa values(252659,'Vinicius','vini@hotmail.com','Rua Barão','Campinas','SP','91845962') 
insert into pessoa values(253221,'Judite','juju@hotmail.com','Rua das Graças','Campinas','SP','93968574') 

--2)inserir funcionariocliente
insert into funcionario values(157692,'40912921862',1700) --Referente ao Antonio

insert into funcionario values(215487,'40251548789',1500)
insert into funcionario values(253625,'40154875851',2000)

--3)inserir cliente fisico
insert into cliente values(155553,'12/08/2012')--Referente a Giovana
insert into fisico values(155553,'44356787667')

insert into cliente values(235689,'16/11/2013')
insert into fisico values(235689,'46798956874')
insert into cliente values(252659,'19/04/2014')
insert into fisico values(252659,'41526396857')

--3)inserir cliente juridico
insert into cliente values(123456,'13/08/2012') --Referente ao Brandon
insert into juridico values(123456,'75388737832')

insert into cliente values(251447,'04/01/2010')
insert into juridico values(251447,'78988956988')
insert into cliente values(253221,'06/08/2011')
insert into juridico values(253221,'74858495651')

--4)inserir fornecedor
insert into fornecedor values(031234,12345632789011,'Madeira Fresca','frescamadeira@hotmail.com','39882223')--Fornecedor
insert into fornecedor values(342536,31233464565434,'Madeira Limeira','madeiralima@gmail.com','43253454')--Fornecedor 

insert into fornecedor values(326598,31659865295241,'Madeira Molhada','mmadeira@gmail.com','47589658')
insert into fornecedor values(325184,30629585457585,'Madeira Grossa','madgrossa@gmail.com','42589658')
insert into fornecedor values(326252,30124585751252,'Madeira Fina','finamadeira@gmail.com','41545187')
insert into fornecedor values(316497,36865857485512,'Madeira Madeira','mama@gmail.com','45496986')

--5)inserir produto
insert into produto values(777777,'Jatoba','Jatobá:Esse tipo de espécie não tolera baixas temperaturas',1500.00,20.00)
insert into produto values(777778,'Jatoba1','Jatobá:Esse tipo de espécie não tolera baixas temperaturas',100.00,20.00)
insert into produto values(777772,'Jatoba2','Jatobá:Esse tipo de espécie não tolera baixas temperaturas',200.00,40.00)

insert into produto values(777748,'Jatoba3','Jatobá:Esse tipo de espécie não tolera baixas temperaturas',300.00,50.00)
insert into produto values(777715,'Jatoba4','Jatobá:Esse tipo de espécie não tolera baixas temperaturas',400.00,60.00)
insert into produto values(777726,'Jatoba5','Jatobá:Esse tipo de espécie não tolera baixas temperaturas',500.00,70.00)
insert into produto values(777749,'Jatoba6','Jatobá:Esse tipo de espécie não tolera baixas temperaturas',600.00,80.00)

--6)inserir relaçao de fornecimento
insert into fornece values(777777,031234,'01/07/2012')

insert into fornece values(777748,326598,'02/01/2012')
insert into fornece values(777748,325184,'03/02/2012')
insert into fornece values(777726,031234,'04/03/2014')
insert into fornece values(777749,326252,'05/04/2015')

--7)Inserir pedido para cliente Fisico
insert into pedido values(01,155553,157692,'07/07/2012',0.00)

insert into pedido values(03,155553,253625,'07/07/2012',0.00)
insert into pedido values(04,235689,157692,'07/07/2012',0.00)
insert into pedido values(05,235689,215487,'07/07/2012',0.00)
insert into pedido values(06,252659,157692,'07/07/2012',0.00)

--7)Inserir pedido para cliente Juridico
insert into pedido values(02,123456,157692,'07/07/2012',0.00)

insert into pedido values(07,251447,157692,'07/07/2012',0.00)
insert into pedido values(08,253221,157692,'07/07/2012',0.00)
insert into pedido values(09,253221,215487,'07/07/2012',0.00)
insert into pedido values(10,251447,157692,'07/07/2012',0.00)

--8)inserir itempedido
insert into itempedido values (01,777777,102.49)
insert into itempedido values (01,777778,10.00)
insert into itempedido values (01,777772,50.00)

insert into itempedido values (02,777748,20.00)
insert into itempedido values (05,777715,40.00)
insert into itempedido values (03,777726,60.00)
insert into itempedido values (04,777749,80.00)

--9)alterar itempedido
update itempedido
	set quantm3 = 10
	where codproduto = 777772 and codpedido = 01
update produto
	set precom3 = 50
	where codproduto = 777772

		 
/*-----------CONSULTAS USAR VIEW-------------
1)consultar todas as pessoas do banco
*/

create view todaspessoas
as
	select * from pessoa
	
select * from todaspessoas

-- 2)consultar cliente fisico

create view clienteFisico
as 
	select * from todaspessoas p inner join cliente c
		on p.codigo = c.codcliente

select * from clienteFisico

-- 3) consultar cliente juridico

create view clienteJuridico
as
	select * from todaspessoas p inner join juridico j
		on p.codigo = j.codjuridico

select * from clienteJuridico

-- 4) consultar cliente fisico e juridico

create view todosClientes
as 
	select * from todaspessoas p where p.codigo in (select codjuridico from clienteJuridico)
		or p.codigo in (select codcliente from clienteFisico)
			
select * from TodosClientes

-- 5) consultar todos os fornecedores

create view todosFornecedores
as
	select * from fornecedor

select * from todosFornecedores

-- 6) consultar todos os produtos

create view todosProdutos
as
	select * from produto

select * from todosProdutos

-- 7) consultar todos os produtos que os fornecedores oferecem

create view todosProdForn
as
	select nome, empresanome from todosProdutos tp inner join fornece f
		on tp.codproduto = f.codproduto inner join todosFornecedores tf
			on f.codfornecedor = tf.codfornecedor

select * from todosProdforn

-- 8) consultar todos os pedidos

create view todosPedidos
as
	select * from pedido

select * from todosPedidos


-- 9)consultar pedidos realizados pelos cliente Juridico

create view pedJur
as
	select * from todosPedidos where codcliente in (select codcliente from todosClientes)

select * from perJur

-- 10) consultar pedidos realizados pelos cliente Fisico

create view pedFis
as
	select * from todosPedidos where codcliente in (select codcliente from todosCliente)

select * from pedFis


-- 13)consultar pedidos que tiveram valortotal > 15000

create view total
as
	select * from pedido where valortotal > 15000

select * from total

/*
11)consultar o cliente que realizou mais pedido para um determinado produto
12)consultar o funcionario que realizou um pedido como cliente
*/



/*------------PROCEDURE-------------
a)Cadastro de cliente fisico
b)Cadastro de cliente juridico
c)Cadastro de funcionario
d)(NÃO NECESSARIO)Cadastro de uma pedido, atualizando o estoque(produto) de cada item vendido.
*/

--a)Cadastro de cliente fisico
create procedure cadastroclientefisico
	--pessoa
	@codigo int,
	@nome char(30),
	@email char(30),
	@endereco char(30),
	@cidade char(15),
	@uf char(2),
	@telefone char(10),
	--cliente
	@datavinculo date,
	--fisico
	@cpf char(11)
as
begin transaction --pessoa
	insert into pessoa
	values (@codigo,@nome,@email,@endereco,@cidade,@uf,@telefone)
	if @@rowcount > 0 /* insercao de uma pessoa bem sucedida */
		begin
			insert into cliente --cliente
			values (@codigo,@datavinculo)
			if @@rowcount > 0 /* insercao de um cliente bem sucedida */
			begin
				insert into fisico
				values(@codigo,@cpf)
				if @@rowcount >0 /* insercao de um cliente fisico bem sucedida*/
					begin
						commit transaction
						return 0
					end
			end
			else
			begin
				rollback transaction
				return 1
			end
		end
	else
	begin
		rollback transaction
			return 1
	end

declare @var int
exec @var = cadastroclientefisico 155553,'Giovana','gigirardi@gmail.com','Rua Masterchef','Paulinia','SP','38748038','12/08/2012','44356787667'
print @var
	

--b)Cadastro de cliente juridico
create procedure cadastroclientejuridico
	--pessoa
	@codigo int,
	@nome char(30),
	@email char(30),
	@endereco char(30),
	@cidade char(15),
	@uf char(2),
	@telefone char(10),
	--cliente
	@datavinculo date,
	--juridico
	@cnpj char(14)
as
begin transaction --pessoa
	insert into pessoa
	values (@codigo,@nome,@email,@endereco,@cidade,@uf,@telefone)
	if @@rowcount > 0 /* insercao de uma pessoa bem sucedida */
		begin
			insert into cliente --cliente
			values (@codigo,@datavinculo)
			if @@rowcount > 0 /* insercao de um cliente bem sucedida */
			begin
				insert into juridico
				values(@codigo,@cnpj)
				if @@rowcount >0 /* insercao de um cliente juridico bem sucedida*/
					begin
						commit transaction
						return 0
					end
			end
			else
			begin
				rollback transaction
				return 1
			end
		end
	else
	begin
		rollback transaction
			return 1
	end

declare @var1 int
exec @var1 = cadastroclientejuridico 123456,'Brandon','bendy@hotmail.com','Rua Unitec','Limeira','SP','98328734','13/08/2012','75388737832'
print @var1

--c)Cadastro de funcionario
create procedure cadastrofuncionario
	--pessoa
	@codigo int,
	@nome char(30),
	@email char(30),
	@endereco char(30),
	@cidade char(15),
	@uf char(2),
	@telefone char(10),
	--funcionario
	@cpf char(11),
	@salario money
as
begin transaction --pessoa
	insert into pessoa
	values (@codigo,@nome,@email,@endereco,@cidade,@uf,@telefone)
	if @@rowcount > 0 /* insercao de uma pessoa bem sucedida */
		begin
			insert into funcionario --funcionario
			values (@codigo,@cpf,@salario)
			if @@rowcount > 0 /* insercao de um funcionario bem sucedida */
			begin
				commit transaction
				return 0
			end
			else
			begin
				rollback transaction
				return 1
				end
		end
	else
	begin
		rollback transaction
			return 1
end


declare @var2 int
exec @var2 = cadastrofuncionario 157692,'Antonio','antonio@hotmail.com','Orlando Pavan','Hortolandia','SP','38875263','40912921862',1700
print @var2

/*
--d)Cadastro de um pedido, atualizando o estoque(produto) de cada item vendido.
create procedure venda_atestoque
	--produto
	@codproduto int,
	@nome varchar(20),
	@descricao text,
	@qtd_estoque float,
	@precom3 money,
	--pedido
	@codpedido int,
	@datapedido date,
	@quantm3 float
as
begin transaction
	insert into produto
	values (@codproduto,@nome,@descricao,@qtd_estoque,@precom3)
if @@rowcount > 0 /* cadastro de pedido bem sucedida */
	begin
		insert into itempedido --itempedido
		values (@codpedido,@codproduto,@datapedido,@quantm3)
		if @@rowcount > 0 /* insercao de um item bem sucedida */
				begin
				update produto
				set qtd_estoque = qtd_estoque-@quantm3
				where produto.codproduto = @codproduto
				if @@ROWCOUNT > 0
				begin
					commit transaction
					return 0
				end
		else
		begin
			rollback transaction
			return 1
			end
	end	
	
declare @var3 int
exec @var3 = venda_atestoque 777777,'Jatoba','Jatobá:Esse tipo de espécie não tolera baixas temperaturas',1500.00,20.00,01,'07/07/2012',102.49
print @var3

*/

/*------------GATILHOS--------------
a)Toda vez que um produto de um pedido (composição) for incluido ,seja atualizada a quantidade em estoque e o valor total;
b) Toda vez que um produto de um pedido(composição) for excluído, seja atualizada a quantidade em estoque do produto e o valor total do pedido;
c) Toda vez que for alterada a quantidade de um produto de um pedido(composição), seja atualizada a quantidade em estoque do produto e o valor total da venda;
*/

--a)Toda vez que um produto de um pedido (composição) for incluido ,seja atualizada a quantidade em estoque e o valor total;
create trigger inclusaoitempedido
on itempedido for insert
as
	update produto
	set qtd_estoquem3=(select i.qtd_estoquem3 - j.quantm3
					from produto i,inserted j
					where i.codproduto = j.codproduto)
				where codproduto = (select codproduto from inserted)
	if @@rowcount > 0
	begin
		update pedido
		set valortotal = valortotal + (select k.quantm3 * i.precom3
							from produto i,inserted k --k eh a tabela inserida no caso itempedido
							where i.codproduto=k.codproduto)
				where codpedido = (select codpedido from inserted)
		if @@rowcount >0
		begin
			commit transaction
			end
		else
		begin
			rollback transaction
		end
		end
	else
	rollback transaction 

--b) Toda vez que um produto de um pedido(composição) for excluído, seja atualizada a quantidade em estoque do produto e o valor total do pedido;
create trigger excluir
on itempedido for delete
as
	update produto
	set qtd_estoquem3 = (select p.qtd_estoquem3 + d.quantm3
						from deleted d, produto p
						where d.codproduto = p.codproduto)
	where codproduto = (select codproduto from deleted)
	if @@rowcount > 0
	begin
		update pedido
		set valortotal = valortotal -(select pr.precom3 * (select d.quantm3
														from deleted d, pedido p
														where d.codpedido = p.codpedido)
										from deleted d, produto pr
										where d.codproduto = pr.codproduto)
		where codpedido = (select codpedido from deleted)	
		end	
	else	
	rollback transaction

--c) Toda vez que for alterada a quantidade de um item de um pedido, seja atualizada a quantidade em estoque do produto e o valor total da venda;
create trigger alteracaoitempedido
on itempedido for update
as
	if update (quantm3)
	begin
		update produto
		set qtd_estoquem3 = (select i.qtd_estoquem3 - (j.quantm3 - d.quantm3)
				from produto i inner join inserted j 
				on i.codproduto = j.codproduto
				inner join deleted d
				on j.codproduto = d.codproduto and j.codpedido = d.codpedido)
		where codproduto = (select codproduto from inserted)
		
	if @@rowcount > 0
	begin
		update pedido
		set valortotal = valortotal  + (select i.precom3 * (j.quantm3 - d.quantm3)
				from produto i inner join inserted j
				on i.codproduto = j.codproduto 
				inner join deleted d
				on j.codproduto = d.codproduto and j.codpedido = d.codpedido)
		where codpedido = (select codpedido from inserted)
		if @@rowcount >0
		begin
			commit transaction
		end
		else
		begin
			rollback transaction
		end
	end
	else
	rollback transaction
	end