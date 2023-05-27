-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3360
-- Время создания: Май 27 2023 г., 09:52
-- Версия сервера: 8.0.30
-- Версия PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vetclinic`
--

-- --------------------------------------------------------

--
-- Структура таблицы `appointments`
--

CREATE TABLE `appointments` (
  `idappointments` int NOT NULL,
  `date` datetime NOT NULL,
  `office` varchar(10) DEFAULT NULL,
  `services_idservices` int NOT NULL,
  `medcard_idmedcard` int NOT NULL,
  `doctors_iddoctors` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Приемы';

-- --------------------------------------------------------

--
-- Структура таблицы `doctors`
--

CREATE TABLE `doctors` (
  `iddoctors` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Birthday` date NOT NULL,
  `TelNum` bigint NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Specialization` varchar(45) NOT NULL,
  `Degree` varchar(100) NOT NULL,
  `DateOfHire` date NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ветеринарные врачи';

--
-- Дамп данных таблицы `doctors`
--

INSERT INTO `doctors` (`iddoctors`, `Name`, `Birthday`, `TelNum`, `Email`, `Address`, `Specialization`, `Degree`, `DateOfHire`, `Password`, `isAdmin`) VALUES
(0, 'admin', '2000-01-01', 1234, 'admin@admin.com', 'testtest', '-', '-', '2000-01-01', '1', 1),
(1, 'Дмитрий Петрович Кузнецов', '1972-11-18', 89153535610, 'Doctor13@mail.ru', 'ул. Павла Корчагина, д. 11', 'Ветеринарный врач УЗИ', 'Высшее образование', '2020-06-12', '12345', 0),
(2, 'Сергей Александрович Кувшинов', '1970-09-05', 89197595624, 'Doctor12@mail.ru', 'ул. Верхняя Красносельская, д. 14, стр. 1', 'Ветеринарный врач хирург', 'Высшее образование', '2016-11-01', '1234', 0),
(3, 'Светлана Николаевна Яценко', '1985-06-30', 89047514224, 'Doctor11@mail.ru', 'Серебрянический переулок, д. 4 стр. 1', 'Главный ветеринарный врач', 'Высшее образование', '2019-05-22', '123', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `medcard`
--

CREATE TABLE `medcard` (
  `idmedcard` int NOT NULL,
  `petname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `breed` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Commentary` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `owners_idOwner` int NOT NULL,
  `treatment_idtreatment` int NOT NULL DEFAULT '1',
  `birthday` date DEFAULT '2000-01-01',
  `diagnosis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `symptoms` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='мед. карта животного';

--
-- Дамп данных таблицы `medcard`
--

INSERT INTO `medcard` (`idmedcard`, `petname`, `gender`, `breed`, `Commentary`, `owners_idOwner`, `treatment_idtreatment`, `birthday`, `diagnosis`, `symptoms`) VALUES
(1, 'Тина', 'жен', 'русская голубая', 'милашка', 1, 1, '2012-10-02', 'нет', 'нет'),
(2, 'Лизка', 'жен', 'неизвестно', NULL, 2, 1, '2000-01-01', 'нет', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `medicines`
--

CREATE TABLE `medicines` (
  `idmedicines` int NOT NULL,
  `Code` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Лекарственные средства';

--
-- Дамп данных таблицы `medicines`
--

INSERT INTO `medicines` (`idmedicines`, `Code`, `Name`) VALUES
(1, 'Q1264', 'Boli Amoksiklav'),
(2, 'Q2267', 'Pulvis Amoksiklav'),
(3, 'Q4112', 'Amoximag'),
(4, 'Q1111', 'Pulvis Amoxicillini 10 %'),
(5, 'Q8541', 'Amoxicillin 15 %'),
(6, 'Q2456', 'Bimoxyl LA'),
(7, 'Q4672', 'Synuxol'),
(8, 'Q1999', 'Diofurum'),
(9, 'Q2256', 'Cloxamast'),
(10, 'Q2298', 'Mastomicin');

-- --------------------------------------------------------

--
-- Структура таблицы `owners`
--

CREATE TABLE `owners` (
  `idOwner` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Birthday` date DEFAULT NULL,
  `TelNum` bigint DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Adress` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Хозяин питомца';

--
-- Дамп данных таблицы `owners`
--

INSERT INTO `owners` (`idOwner`, `Name`, `Birthday`, `TelNum`, `Email`, `Adress`) VALUES
(1, 'Баглаева Алтана', '2014-05-14', 123, 'baglaeva@gmail.com', 'no'),
(2, 'Зацепина Александра', '2003-06-30', 1, 'mail@mail.ru', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `idservices` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Cost` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Предоставляемые вет клиникой услуги';

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`idservices`, `Name`, `Description`, `Cost`) VALUES
(1, 'Консультация', 'Консультация с ветеринарным врачом по состоянию питомца.', '1000р'),
(2, 'Прививка от бешенства', '', '1000р'),
(3, 'Травматология', 'Остеосинтез, лечение переломов, растяжений, вывихов.', 'от 2900р'),
(4, 'Кастрация и стерилизация', 'Кастрация и стерилизация кошек, собак, грызунов.', 'от 1900р'),
(5, 'Стоматология', 'Санация ротовой полости, чистка зубов, удаление зубного камня ультразвуком.', 'от 1900р'),
(6, 'Акушерство', 'Помощь в принятии родов, кесарево сечение.', ' от 2500р'),
(7, 'Неврология', 'Помощь животному при параличе, эпилепсии, судорогах.', 'от 2900р'),
(8, 'Дерматология', 'Выявление и лечение дерматологических заболеваний.', 'от1500р');

-- --------------------------------------------------------

--
-- Структура таблицы `treatment`
--

CREATE TABLE `treatment` (
  `idtreatment` int NOT NULL,
  `medicines_idmedicines` int NOT NULL,
  `recomendations` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='назначенное лечение для животного';

--
-- Дамп данных таблицы `treatment`
--

INSERT INTO `treatment` (`idtreatment`, `medicines_idmedicines`, `recomendations`) VALUES
(1, 4, 'dd');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`idappointments`,`services_idservices`,`medcard_idmedcard`,`doctors_iddoctors`),
  ADD UNIQUE KEY `date_UNIQUE` (`date`),
  ADD UNIQUE KEY `idappointments_UNIQUE` (`idappointments`),
  ADD KEY `fk_appointments_services1_idx` (`services_idservices`),
  ADD KEY `fk_appointments_doctors1_idx` (`doctors_iddoctors`),
  ADD KEY `fk_appointments_medcard1_idx` (`medcard_idmedcard`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`iddoctors`);

--
-- Индексы таблицы `medcard`
--
ALTER TABLE `medcard`
  ADD PRIMARY KEY (`idmedcard`,`treatment_idtreatment`,`owners_idOwner`),
  ADD UNIQUE KEY `idmedcard_UNIQUE` (`idmedcard`),
  ADD KEY `fk_medcard_treatment1_idx` (`treatment_idtreatment`),
  ADD KEY `fk_medcard_owners1_idx` (`owners_idOwner`);

--
-- Индексы таблицы `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`idmedicines`),
  ADD UNIQUE KEY `idmedicines_UNIQUE` (`idmedicines`),
  ADD UNIQUE KEY `Code_UNIQUE` (`Code`),
  ADD UNIQUE KEY `Name_UNIQUE` (`Name`);

--
-- Индексы таблицы `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`idOwner`),
  ADD UNIQUE KEY `idOwner_UNIQUE` (`idOwner`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`idservices`);

--
-- Индексы таблицы `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`idtreatment`),
  ADD KEY `fk_treatment_medicines1_idx` (`medicines_idmedicines`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `appointments`
--
ALTER TABLE `appointments`
  MODIFY `idappointments` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointments_doctors1` FOREIGN KEY (`doctors_iddoctors`) REFERENCES `doctors` (`iddoctors`),
  ADD CONSTRAINT `fk_appointments_medcard1` FOREIGN KEY (`medcard_idmedcard`) REFERENCES `medcard` (`idmedcard`),
  ADD CONSTRAINT `fk_appointments_services1` FOREIGN KEY (`services_idservices`) REFERENCES `services` (`idservices`);

--
-- Ограничения внешнего ключа таблицы `medcard`
--
ALTER TABLE `medcard`
  ADD CONSTRAINT `fk_medcard_owners1` FOREIGN KEY (`owners_idOwner`) REFERENCES `owners` (`idOwner`),
  ADD CONSTRAINT `fk_medcard_treatment1` FOREIGN KEY (`treatment_idtreatment`) REFERENCES `treatment` (`idtreatment`);

--
-- Ограничения внешнего ключа таблицы `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `fk_treatment_medicines1` FOREIGN KEY (`medicines_idmedicines`) REFERENCES `medicines` (`idmedicines`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
