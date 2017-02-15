--
-- Database: `cheapbooks`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `SSN` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`SSN`, `name`, `address`, `phone`) VALUES
('111', 'Avinash', 'Hight apartment,Dallas', '5487565874'),
('222', 'Anurag', 'MIS street,Arlington', '4125623548'),
('444', 'Swapnil', 'mech avenue,fortworth', '8745621547'),
('555', 'More', 'maverick street,florida', '8523698547'),
('777', 'pushpak', 'arlington', '7415963698'),
('888', 'Prasad', 'Arlington', '6545895458'),
('999', 'Prasoon', 'Arlington', '8796985658');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` varchar(10) NOT NULL,
  `title` varchar(20) NOT NULL,
  `year` varchar(4) NOT NULL,
  `price` varchar(20) NOT NULL,
  `publisher` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `title`, `year`, `price`, `publisher`) VALUES
(' J777', 'Book of Drama', '2014', '560', 'TATA publications'),
('A777', 'Web data mang', '2016', '500', 'texas'),
('B777', 'secure progr', '2016', '600', 'india public'),
('C777', 'IS', '2015', '500', 'KK publi'),
('D777', 'Computer graphics', '2014', '600', 'KK publisher'),
('E777', 'Data signal', '2010', '400', 'Mehta publications'),
('F777', 'Data analysis', '2005', '300', 'KK publications'),
('G777', 'Algorithm', '2001', '560', 'MS publications'),
('H777', 'Distributed system', '2010', '250', 'UTA publications'),
('I777', 'Signal processing', '2011', '500', 'JJ publications'),
('K777', 'Sports facts', '2015', '600', 'Mcgrill publications');

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE `contains` (
  `ISBN` varchar(10) NOT NULL,
  `basketID` int(13) NOT NULL,
  `number` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contains`
--

INSERT INTO `contains` (`ISBN`, `basketID`, `number`) VALUES
('A777', 17, 1),
('A777', 20, 1),
('A777', 20, 1),
('A777', 20, 2),
('A777', 24, 3),
('A777', 25, 3),
('A777', 26, 4),
('A777', 38, 2),
('A777', 41, 2),
('A777', 43, 1),
('A777', 44, 1),
('A777', 45, 1),
('A777', 45, 2),
('A777', 52, 1),
('A777', 54, 1),
('A777', 55, 1),
('B777', 55, 1),
('C777', 24, 1),
('C777', 25, 1),
('C777', 43, 1),
('C777', 44, 1),
('C777', 48, 1),
('C777', 52, 2),
('D777', 25, 1),
('D777', 49, 1),
('D777', 52, 1),
('D777', 53, 1),
('D777', 55, 1),
('E777', 27, 0),
('F777', 25, 2),
('F777', 39, 2),
('F777', 53, 1),
('F777', 55, 1),
('H777', 47, 1),
('H777', 50, 1),
('H777', 53, 1),
('I777', 51, 1),
('I777', 55, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username` varchar(10) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`username`, `password`, `address`, `phone`, `email`) VALUES
('harry', '5f4dcc3b5aa765d61d8327deb882cf99', 'california', '787998', 'hary@gmail.com'),
('kevin', 'password', 'arlington', '8468486', ''),
('p', '83878c91171338902e0fe0fb97a8c47a', 'p', 'p', 'p@p'),
('Sachin', '15285722f9def45c091725aee9c387cb', 'Mumbai', '8957844456', 'sachin@gmail.com'),
('smith', 'password', 'smith@cse.uta.edu', '705-666', 'a029d0df84eb5549c641e04a9ef389e5'),
('TestUser3', 'arlington', '', '565455', 'password'),
('TestUser4', '5f4dcc3b5aa765d61d8327deb882cf99', ' ', '', 'localhost'),
('TestUser5', '5f4dcc3b5aa765d61d8327deb882cf99', 'arlington', '565455', ' test@gmail.com'),
('TestUser6', '5f4dcc3b5aa765d61d8327deb882cf99', 'arlington', '565455', 'test@gmail.com'),
('TestUser7', '5f4dcc3b5aa765d61d8327deb882cf99', 'arlington', '565455', 'test@gmail.com'),
('testuser8', 'e10adc3949ba59abbe56e057f20f883e', 'california', '787888', 'test@gmaoil.com'),
('tony', '319f4d26e3c536b5dd871bb2c52e3178', 'dallas', '785455', 'TONY@GMAIL.COM');

-- --------------------------------------------------------

--
-- Table structure for table `shippingorder`
--

CREATE TABLE `shippingorder` (
  `ISBN` varchar(10) NOT NULL,
  `warehouseCode` varchar(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `number` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shippingorder`
--

INSERT INTO `shippingorder` (`ISBN`, `warehouseCode`, `username`, `number`) VALUES
('A777', '1111', 'harry', 1),
('A777', '1111', 'harry', 2),
('A777', '1111', 'sachin', 3),
('A777', '1111', 'sachin', 4),
('A777', '1111', 'testuser7', 1),
('A777', '1111', 'testuser7', 1),
('A777', '1111', 'testuser7', 1),
('A777', '1111', 'testuser7', 1),
('A777', '1111', 'testuser7', 1),
('A777', '1111', 'testuser7', 1),
('A777', '1111', 'testuser7', 2),
('A777', '1111', 'testuser7', 2),
('A777', '1111', 'testuser7', 2),
('A777', '12345', 'harry', 1),
('A777', '12345', 'harry', 2),
('A777', '12345', 'harry', 3),
('B777', '900', 'testuser7', 1),
('C777', '300', 'sachin', 1),
('C777', '300', 'testuser7', 1),
('C777', '300', 'testuser7', 1),
('C777', '300', 'testuser7', 1),
('C777', '300', 'testuser7', 2),
('C777', '555', 'harry', 1),
('D777', '300', 'sachin', 1),
('D777', '300', 'testuser7', 1),
('D777', '300', 'testuser7', 1),
('D777', '300', 'testuser7', 1),
('D777', '300', 'testuser7', 1),
('E777', '700', 'p', 0),
('F777', '600', 'sachin', 2),
('F777', '600', 'testuser7', 1),
('F777', '600', 'testuser7', 1),
('F777', '600', 'testuser7', 2),
('H777', '500', 'testuser7', 1),
('H777', '500', 'testuser7', 1),
('H777', '500', 'testuser7', 1),
('I777', '800', 'testuser7', 1),
('I777', '800', 'testuser7', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shoppingbasket`
--

CREATE TABLE `shoppingbasket` (
  `basketId` int(13) NOT NULL,
  `username` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shoppingbasket`
--

INSERT INTO `shoppingbasket` (`basketId`, `username`) VALUES
(7, ''),
(6, 'David'),
(1, 'harry'),
(10, 'harry'),
(12, 'harry'),
(13, 'harry'),
(14, 'harry'),
(15, 'harry'),
(16, 'harry'),
(17, 'harry'),
(18, 'harry'),
(19, 'harry'),
(20, 'harry'),
(21, 'harry'),
(22, 'harry'),
(23, 'harry'),
(24, 'harry'),
(2, 'harry2'),
(3, 'harry3'),
(9, 'kevin'),
(27, 'p'),
(25, 'sachin'),
(26, 'sachin'),
(4, 'smith'),
(5, 'TestUser3'),
(28, 'testuser7'),
(38, 'testuser7'),
(39, 'testuser7'),
(41, 'testuser7'),
(43, 'testuser7'),
(44, 'testuser7'),
(45, 'testuser7'),
(46, 'testuser7'),
(47, 'testuser7'),
(48, 'testuser7'),
(49, 'testuser7'),
(50, 'testuser7'),
(51, 'testuser7'),
(52, 'testuser7'),
(53, 'testuser7'),
(54, 'testuser7'),
(55, 'testuser7'),
(29, 'testuser8'),
(30, 'testuser8'),
(8, 'Thomas');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `ISBN` varchar(10) NOT NULL,
  `warehouseCode` varchar(10) NOT NULL,
  `number` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`ISBN`, `warehouseCode`, `number`) VALUES
('A777', '1111', 31),
('A777', '12345', 20),
('B777', '900', 49),
('C777', '300', 24),
('C777', '555', 30),
('D777', '300', 15),
('E777', '700', 20),
('F777', '600', 34),
('F777', '700', 50),
('H777', '500', 57),
('H777', '550', 10),
('I777', '800', 13);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouseCode` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouseCode`, `name`, `address`, `phone`) VALUES
('1111', 'Side warehouse', 'Dallas', '7896321478'),
('12345', 'KK warehouse', 'Arlington', '7874159865'),
('500', 'east warehouse', 'Dallas', '546895689'),
('550', 'Golden warehouse', 'Arlington', '565478956'),
('600', 'Books warehouse', 'Dallas', '876598758'),
('700', 'Meta warehouse', 'Austin', '5689578958'),
('800', 'Deal warehouse', 'Plano', '5898789568'),
('900', 'Cheaper warehouse', 'Houston', '5874741474');

-- --------------------------------------------------------

--
-- Table structure for table `writtenby`
--

CREATE TABLE `writtenby` (
  `SSN` varchar(10) NOT NULL,
  `ISBN` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `writtenby`
--

INSERT INTO `writtenby` (`SSN`, `ISBN`) VALUES
('111', 'D777'),
('111', 'E777'),
('222', 'F777'),
('222', 'G777'),
('555', ' J777'),
('555', 'H777'),
('555', 'I777'),
('555', 'K777'),
('777', 'A777'),
('777', 'B777'),
('777', 'C777'),
('888', 'AA888');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`SSN`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `contains`
--
ALTER TABLE `contains`
  ADD KEY `ISBN` (`ISBN`,`basketID`,`number`),
  ADD KEY `basketID` (`basketID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`),
  ADD KEY `username` (`username`,`password`,`address`,`phone`,`email`);

--
-- Indexes for table `shippingorder`
--
ALTER TABLE `shippingorder`
  ADD KEY `ISBN` (`ISBN`,`warehouseCode`,`username`,`number`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `shoppingbasket`
--
ALTER TABLE `shoppingbasket`
  ADD PRIMARY KEY (`basketId`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD UNIQUE KEY `ISBN_2` (`ISBN`,`warehouseCode`,`number`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `ISBN_3` (`ISBN`),
  ADD KEY `ISBN_4` (`ISBN`,`warehouseCode`,`number`),
  ADD KEY `warehouseCode` (`warehouseCode`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouseCode`);

--
-- Indexes for table `writtenby`
--
ALTER TABLE `writtenby`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `SSN` (`SSN`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `shoppingbasket`
--
ALTER TABLE `shoppingbasket`
  MODIFY `basketId` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `writtenby` (`ISBN`) ON DELETE CASCADE;

--
-- Constraints for table `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`basketID`) REFERENCES `shoppingbasket` (`basketId`) ON DELETE CASCADE,
  ADD CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE;

--
-- Constraints for table `shippingorder`
--
ALTER TABLE `shippingorder`
  ADD CONSTRAINT `shippingorder_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`username`),
  ADD CONSTRAINT `shippingorder_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE;

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE CASCADE;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`warehouseCode`) REFERENCES `stocks` (`warehouseCode`) ON DELETE CASCADE;

--
-- Constraints for table `writtenby`
--
ALTER TABLE `writtenby`
  ADD CONSTRAINT `writtenby_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `author` (`SSN`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
