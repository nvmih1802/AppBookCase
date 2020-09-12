Create database ReadingBook
Go
use master
drop database ReadingBook
GO
use ReadingBook
Go

Create table [User](
	id int not null identity primary key,
	[user_name] varchar(50) not null unique,
	[password] varchar(50) not null,
	[state] tinyint not null check([state] in (0,1)) 
)

create table BookCase(
	book_case_id int primary key,
	book_case_name nvarchar(200) not null,
	constraint fk_bookCase_user foreign key(book_case_id) references [user](id)
	on update cascade on delete cascade
)

create table Book(
	book_id int not null identity primary key,
	book_name nvarchar(200) not null,
	book_title nvarchar(200) not null,
	author nvarchar(50) not null,
	brief ntext not null,
	publisher nvarchar(200) not null,
	content ntext not null,
	category nvarchar(200) not null
)

create table Contain(
	book_case_id int not null,
	book_id int not null,
	create_date date default CURRENT_TIMESTAMP,
	constraint pk_Contain primary key(book_case_id, book_id),
	constraint fk_Contain_BookCase foreign key(book_case_id) references BookCase(book_case_id),
	constraint fk_Contain_Book foreign key(book_id) references Book(book_id),
)


insert into [User]([user_name], [password], [state]) 
values
	('nvminh', '12345', 0),
	('ntduong', '12345', 1),
	('hmtuan', '12345', 1),
	('nplan', '12345', 1)
GO

insert into BookCase(book_case_id, book_case_name)
values
	(2, 'Book case of Duong'),
	(3, 'Book case of Tuan'),
	(4, 'Book case of Lan')
GO

insert into Book(book_name, book_title, author, brief, publisher, content, category)
values
	(N'Hoa vàng', N'Học cách làm goodboy', N'NVM', N'Sách giúp các badboy học cách trở thành goodboy', N'No', N'Làm gì có sách nào dạy, bị lừa rồi hahaha', N'Tâm lý'),
	(N'Dế mèn', N'Nếu có một ngày', N'Nguyễn Hương Ly', N'Hay thực sự', 'Piano', N'Nếu có môt ngày đôi nay này mong buông lơi... ', N'Tình cảm'),
	(N'Hoa vàng', N'Nếu có ngày mai', N'NVM', N'Khá hay', N'No', N'Mặc kệ sẽ đúng hay sai anh vẫn chẳng muốn quay lại', N'Hài kịch'),
	(N'Dế mèn', N'Chiếc lá cuối cùng', N'Nguyễn Minh', N'Buồn quá mà', 'Không có gì', N'Nếu có một ngày góc phố này vắng tiếng cười', N'Tình cảm'),
	(N'Dế choắt', N'Nếu có một ngày', N'NVM', N'Copy', N'NOOOOOOO', N'Một khi ta ở bên nhau xin chớ làm nhau phải', N'Hài kịch'),
	(N'Dế mèn', N'Nếu có một', N'NVV', N'Copy', N'NOOOOOOO', N'Một khi ta ở bên nhau xin chớ làm nhau phải buồn', N'tình cảm'),
	(N'Dế mèn', N'Nếu có một ngày', N'NVV', N'Copy', N'NOOOO', N'Một khi ta ở bên nhau xin chớ làm nhau', N'Tình cảm')
GO

insert into Contain(book_case_id, book_id)
values
	(2,1),
	(2,2),
	(2,3),
	(2,4),
	(2,5),
	(3,4),
	(4,2),
	(4,1),
	(4,3),
	(4,4)
GO
