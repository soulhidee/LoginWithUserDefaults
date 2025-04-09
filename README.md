# Приложение с экраном входа
<img src="https://github.com/user-attachments/assets/aa43cd8f-2b12-4dd6-a01f-97bc5e7b8a4a" width="300"/>

Это простое приложение с экраном входа, разработанное с использованием UIKit на языке Swift. Приложение позволяет пользователю ввести имя пользователя и пароль, а также сохранить имя пользователя для следующего входа. Логика входа и пользовательские настройки сохраняются с использованием `UserDefaults`.

## Возможности
	•	Пользователь может ввести имя пользователя и пароль.
	•	Имя пользователя можно сохранить для следующих запусков с помощью переключателя.
	•	Пароль отображается как защищённый текст (точки).
	•	Имя пользователя и пароль могут быть автоматически подставлены при следующем запуске приложения, если они были сохранены.
	•	При попытке входа с пустыми полями выводится всплывающее сообщение (UIAlert).
	•	При успешном входе пользователь получает подтверждение через всплывающее сообщение.
	•	При вводе данных, которые не соответствуют требованиям (минимальная и максимальная длина), выводится предупреждение.
	•	Используется `enum` для хранения ключей `UserDefaults`, что упрощает и защищает работу с хранилищем данных.
	•	Упрощён доступ к `UserDefaults` с помощью приватного свойства в отдельной структуре `UserCredentialsManager`.
	•	Логика валидации введённых данных вынесена в отдельный класс `CredentialsValidator`, который проверяет длину логина и пароля.

## Требования
	•	iOS 12.0+ (или выше)
	•	Xcode 12.0+ (или выше)

## Как использовать
	1.	Введите имя пользователя и пароль.
	2.	Переключите тумблер для сохранения имени пользователя для следующего входа.
	3.	Нажмите кнопку “Login” для входа.
	4.	Если тумблер включен, приложение сохранит имя пользователя и пароль в UserDefaults.
	5.	При следующем запуске имя пользователя будет подставлено, если оно было сохранено.
	6.	При ошибках или успешном входе появятся соответствующие уведомления.
	7.	Логин и пароль должны быть в пределах от 6 до 20 символов. При неверной длине будет выведено соответствующее сообщение.

## Установка
Для того чтобы установить проект, клонируйте репозиторий и откройте проект в Xcode:
	1.	git clone https://github.com/sulhidee/loginScreen.git
	2.	cd loginScreen
	3.	open loginScreen.xcodeproj



