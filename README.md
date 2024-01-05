Необходимо организовать систему учета для питомника в котором живут
домашние и вьючные животные.

1. Используя команду cat в терминале операционной системы Linux, создать два файла Домашние животные (заполнив файл собаками, кошками, хомяками) и Вьючные животными заполнив файл Лошадьми, верблюдами и ослы), а затем объединить их. Просмотреть содержимое созданного файла. Переименовать файл, дав ему новое имя (Друзья человека).

mkdir kennel
cd kennel
cat > home_animals
dog
cat
hamster
^C
cat > packed_animals
Horse
Camel
Donkey
^C
cat home_animals packed_animals > all_animals
cat all_animals
______________________________________________________
Dog
Cat
Hamster
Horse
Camel
Donkey
______________________________________________________
mv all_animals mans_friends
ls
______________________________________________________
home_animals  mans_friends  packed_animals
______________________________________________________

2. Создать директорию, переместить файл туда.

cd ..
mkdir new_kennel
cd kennel
mv mans_friends ~/new_kennel
cd ~/new_kennel
ls
______________________________________________________
mans_friends
______________________________________________________

3. Подключить дополнительный репозиторий MySQL. Установить любой пакет
из этого репозитория.

sudo wget http://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
[sudo] password for dw: 
--2024-01-03 02:12:03--  http://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
Resolving dev.mysql.com (dev.mysql.com)... 184.51.238.43, 2a02:2d8:3:9a5::2e31, 2a02:2d8:3:9a9::2e31
Connecting to dev.mysql.com (dev.mysql.com)|184.51.238.43|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb [following]
--2024-01-03 02:12:03--  https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
Connecting to dev.mysql.com (dev.mysql.com)|184.51.238.43|:443... connected.
HTTP request sent, awaiting response... 302 Moved Temporarily
Location: https://repo.mysql.com//mysql-apt-config_0.8.24-1_all.deb [following]
--2024-01-03 02:12:03--  https://repo.mysql.com//mysql-apt-config_0.8.24-1_all.deb
Resolving repo.mysql.com (repo.mysql.com)... 104.81.113.179, 2a02:26f0:d200:888::1d68, 2a02:26f0:d200:889::1d68
Connecting to repo.mysql.com (repo.mysql.com)|104.81.113.179|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 18048 (18K) [application/x-debian-package]
Saving to: ‘mysql-apt-config_0.8.24-1_all.deb’

mysql-apt-config_0. 100%[===================>]  17,62K  --.-KB/s    in 0s      

2024-01-03 02:12:03 (394 MB/s) - ‘mysql-apt-config_0.8.24-1_all.deb’ saved [18048/18048]

sudo dpkg -i mysql-apt-config_0.8.24-1_all.deb
Selecting previously unselected package mysql-apt-config.
(Reading database ... 210408 files and directories currently installed.)
Preparing to unpack mysql-apt-config_0.8.24-1_all.deb ...
Unpacking mysql-apt-config (0.8.24-1) ...
Setting up mysql-apt-config (0.8.24-1) ...
Warning: apt-key should not be used in scripts (called from postinst maintainerscript of the package mysql-apt-config)
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
OK

sudo apt-get update

sudo apt-get install mysql-server
systemctl status mysql
● mysql.service - MySQL Community Server
     Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2024-01-03 02:32:21 MSK; 58s ago
    Process: 5864 ExecStartPre=/usr/share/mysql/mysql-systemd-start pre (code=exited, status=0/SUCCESS)
   Main PID: 5872 (mysqld)
     Status: "Server is operational"
      Tasks: 38 (limit: 4597)
     Memory: 365.5M
        CPU: 1.283s
     CGroup: /system.slice/mysql.service
             └─5872 /usr/sbin/mysqld

янв 03 02:32:21 dw-VirtualBox systemd[1]: Starting MySQL Community Server...
янв 03 02:32:21 dw-VirtualBox systemd[1]: Started MySQL Community Server.


4. Установить и удалить deb-пакет с помощью dpkg.

sudo wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
--2024-01-03 02:43:45--  https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
Resolving dev.mysql.com (dev.mysql.com)... 184.51.238.43, 2a02:2d8:3:9a9::2e31, 2a02:2d8:3:9a5::2e31
Connecting to dev.mysql.com (dev.mysql.com)|184.51.238.43|:443... connected.
HTTP request sent, awaiting response... 302 Moved Temporarily
Location: https://cdn.mysql.com//archives/mysql-connector-java-8.0/mysql-connector-j_8.0.32-1ubuntu22.04_all.deb [following]
--2024-01-03 02:43:45--  https://cdn.mysql.com//archives/mysql-connector-java-8.0/mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
Resolving cdn.mysql.com (cdn.mysql.com)... 184.51.230.241, 2a02:2d8:3:9a1::1d68, 2a02:2d8:3:984::1d68
Connecting to cdn.mysql.com (cdn.mysql.com)|184.51.230.241|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2429088 (2,3M) [application/x-debian-package]
Saving to: ‘mysql-connector-j_8.0.32-1ubuntu22.04_all.deb’

mysql-connector-j_8.0.32-1ubuntu22.04_all.deb      100%[================================================================================================================>]   2,32M  2,46MB/s    in 0,9s    

2024-01-03 02:43:46 (2,46 MB/s) - ‘mysql-connector-j_8.0.32-1ubuntu22.04_all.deb’ saved [2429088/2429088]

sudo dpkg -i mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
Selecting previously unselected package mysql-connector-j.
(Reading database ... 210800 files and directories currently installed.)
Preparing to unpack mysql-connector-j_8.0.32-1ubuntu22.04_all.deb ...
Unpacking mysql-connector-j (8.0.32-1ubuntu22.04) ...
Setting up mysql-connector-j (8.0.32-1ubuntu22.04) ...

sudo dpkg -r mysql-connector-j
(Reading database ... 210809 files and directories currently installed.)
Removing mysql-connector-j (8.0.32-1ubuntu22.04) ...

sudo apt-get autoremove
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
0 upgraded, 0 newly installed, 0 to remove and 29 not upgraded.


5. Выложить историю команд в терминале ubuntu
history
________________________________________________________________
mkdir kennel
cd kennel
cat > home_animals
cat > packed_animals
cat home_animals packed_animals > all_animals
cat all_animals
mv all_animals mans_friends
ls
cd ..
mkdir new_kennel
cd kennel
mv mans_friends ~/new_kennel
cd ~/new_kennel
ls
sudo wget http://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.24-1_all.deb
sudo apt-get update
sudo apt-get install mysql-server
systemctl status mysql
sudo wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
sudo dpkg -i mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
sudo dpkg -r mysql-connector-j
sudo apt-get autoremove
________________________________________________________________
6. Нарисовать диаграмму, в которой есть класс родительский класс, домашние
животные и вьючные животные, в составы которых в случае домашних
животных войдут классы: собаки, кошки, хомяки, а в класс вьючные животные
войдут: Лошади, верблюды и ослы).
https://github.com/denistet100/animal_accounting/blob/main/Диаграмма.png
8. В подключенном MySQL репозитории создать базу данных “Друзья
человека”
CREATE DATABASE Human_friends;
10. Создать таблицы с иерархией из диаграммы в БД
11. Заполнить низкоуровневые таблицы именами(животных), командами
которые они выполняют и датами рождения
12. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
11.Создать новую таблицу “молодые животные” в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице
13. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
прошлую принадлежность к старым таблицам.
13.Создать класс с Инкапсуляцией методов и наследованием по диаграмме.
14. Написать программу, имитирующую работу реестра домашних животных.
В программе должен быть реализован следующий функционал:
14.1 Завести новое животное
14.2 определять животное в правильный класс
14.3 увидеть список команд, которое выполняет животное
14.4 обучить животное новым командам
14.5 Реализовать навигацию по меню
15.Создайте класс Счетчик, у которого есть метод add(), увеличивающий̆
значение внутренней̆int переменной̆на 1 при нажатие “Завести новое
животное” Сделайте так, чтобы с объектом такого типа можно было работать в
блоке try-with-resources. Нужно бросить исключение, если работа с объектом
типа счетчик была не в ресурсном try и/или ресурс остался открыт. Значение
считать в ресурсе try, если при заведения животного заполнены все поля.

