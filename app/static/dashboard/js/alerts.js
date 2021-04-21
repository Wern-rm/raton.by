function getParamsURL() {
    let queryString = window.location.search.slice(1);
    let obj = {};
    if (queryString) {
        queryString = queryString.split('#')[0];
        let arr = queryString.split('&');
        for (let i=0; i<arr.length; i++) {
            let a = arr[i].split('=');
            let paramNum = undefined;
            let paramName = a[0].replace(/\[\d*\]/, function (v) {
                paramNum = v.slice(1, -1);
                return '';
            });
            let paramValue = typeof (a[1]) === 'undefined' ? true : a[1];
            paramName = paramName.toLowerCase();
            paramValue = paramValue.toLowerCase();
            if (obj[paramName]) {
                if (typeof obj[paramName] === 'string') {
                    obj[paramName] = [obj[paramName]];
                }
                if (typeof paramNum === 'undefined') {
                    obj[paramName].push(paramValue);
                }
                else {
                    obj[paramName][paramNum] = paramValue;
                }
            }
            else {
                obj[paramName] = paramValue;
            }
        }
    }
    return obj;
}

function success(string) {
    toastr.success(string);
}
function error(string) {
    toastr.error(string);
}
function warning(string) {
    toastr.warning(string);
}
function info(string) {
    toastr.info(string);
}


if (getParamsURL().action === 'error') {
    switch (parseInt(getParamsURL().id)) {
        case 0:
            error('Неверный логин или пароль');
            break;
        case 1:
            error('Ваш аккаунт не активирован');
            break;
        case 2:
            error('Ваш аккаунт заблокирован');
            break;
        case 3:
            error('Ошибка при обновлении настроек системы');
            break;
        case 4:
            error('Ошибка при обновлении настроек email');
            break;
        case 5:
            error('Клиент с таким именем уже существует');
            break;
        case 6:
            error('Контакт с таким отделом уже существует');
            break;
        case 7:
            error('Ошибка при добавлении категории продукции');
            break;
        case 8:
            error('Категория продукции с таким названием уже существует');
            break;
        case 9:
            error('Ошибка при добавлении категории продукции');
            break;
        case 10:
            error('Ошибка при добавлении продукта');
            break;
        case 11:
            error('Ошибка при изменении продукта');
            break;
        case 12:
            error('Продукт с таким названием уже существует');
            break;
        case 13:
            error('Ошибка при добавлении изображения продукта');
            break;
        case 14:
            error('Ошибка при добавлении файла продукта');
            break;
        case 15:
            error('Руководитель с таким именем уже существует');
            break;
        case 16:
            error('Ошибка при добавлении руководителя');
            break;
        case 17:
            error('Ошибка при изменении руководителя');
            break;
        case 18:
            error('Ошибка при изменении фотографии руководителя');
            break;
        case 19:
            error('Невозможно удалить каталог фотогалереи. Сначала удалите фотографии в каталоге');
            break;
        case 20:
            error('Фотография в фотогалереи с таким именем уже существует');
            break;
        case 21:
            error('Ошибка при добавлении фотографии в фотогалерею');
            break;
        case 22:
            error('Ошибка при изменении фотографии в фотогалереи');
            break;
        case 23:
            error('Видео с таким именем уже существует');
            break;
        case 24:
            error('Ошибка при добавлении видео');
            break;
        case 25:
            error('Невозможно удалить категорию. Для начала удалите или переместите все новости в другую категорию');
            break;
        case 26:
            error('Категория с таким именем уже существует');
            break;
        case 27:
            error('Страница с таким алиасом уже существует');
            break;
        case 28:
            error('Пользователь с таким email уже существует');
            break;
    }
}
else if (getParamsURL().action === 'warning') {
    switch (parseInt(getParamsURL().id)) {
        case 1:
            success("Возникла внутреняя ошибка. Обратитесь к администратору или попробуйте еще раз");
            break;
    }
}
else if (getParamsURL().action === 'success') {
    switch (parseInt(getParamsURL().id)) {
        case 1:
            success('Настройки системы успешно обновлены');
            break;
        case 2:
            success('Настройки email успешно обновлены');
            break;
        case 3:
            success('Активация клиента успешно изменена');
            break;
        case 4:
            success('Клиент успешно удален');
            break;
        case 5:
            success('Клиент успешно добавлен');
            break;
        case 6:
            success('Данные клиенты успешно обновлены');
            break;
        case 7:
            success('Логотип клиента успешно обновлен');
            break;
        case 8:
            success('Контакт успешно добавлен');
            break;
        case 9:
            success('Контакт успешно обновлен');
            break;
        case 10:
            success('Контакт успешно удален');
            break;
        case 11:
            success('Активация продукта успешно изменена');
            break;
        case 12:
            success('Активация категории продукта успешно изменена');
            break;
        case 13:
            success('Категории продукта успешно удалена');
            break;
        case 14:
            success('Продукт успешно удален');
            break;
        case 15:
            success('Активация файла успешно изменена');
            break;
        case 16:
            success('Файл продукта успешно удален');
            break;
        case 17:
            success('Активация изображения успешно изменено');
            break;
        case 18:
            success('Изображение категории продукта успешно установлено');
            break;
        case 19:
            success('Изображение продукта успешно удалено');
            break;
        case 20:
            success('Главное изображение продукта успешно установлено');
            break;
        case 21:
            success('Категория продукта успешно добавлена');
            break;
        case 22:
            success('Категория продукта успешно изменена');
            break;
        case 23:
            success('Продукт успешно добавлен');
            break;
        case 24:
            success('Изображение продукта успешно добавлено');
            break;
        case 25:
            success('Файл продукта успешно добавлено');
            break;
        case 26:
            success('Руководитель успешно добавлен');
            break;
        case 27:
            success('Руководитель успешно изменен');
            break;
        case 28:
            success('Фотография руководителя успешно обновлена');
            break;
        case 29:
            success('Активация каталога успешно изменена');
            break;
        case 30:
            success('Каталог фотогалереи успешно удален');
            break;
        case 31:
            success('Главное изображение фотогалереи успешно установлено');
            break;
        case 32:
            success('Фотография в фотогалерею успешно добавлена');
            break;
        case 33:
            success('Название фотографии в фотогалерею успешно изменена');
            break;
        case 34:
            success('Видео успешно добавлено');
            break;
        case 35:
            success('Активация фотографии успешно изменена');
            break;
        case 36:
            success('Фотография успешно удалена');
            break;
        case 37:
            success('Фотография успешно добавлена');
            break;
        case 38:
            success('Активация видео успешно изменена');
            break;
        case 39:
            success('Видео успешно удалено');
            break;
        case 40:
            success('Активация новости успешно изменена');
            break;
        case 41:
            success('Категория новости успешно удалена');
            break;
        case 42:
            success('Новость успешно удалена');
            break;
        case 44:
            success('Категория новостей успешно добавлена');
            break;
        case 45:
            success('Новость успешно добавлена');
            break;
        case 46:
            success('Категория успешно изменена');
            break;
        case 47:
            success('Новость успешно изменена');
            break;
        case 48:
            success('Изображение новости успешно изменено');
            break;
        case 49:
            success('Активация страницы успешно изменено');
            break;
        case 50:
            success('Страница успешно удалена');
            break;
        case 51:
            success('Страница успешно создана');
            break;
        case 52:
            success('Страница успешно изменена');
            break;
        case 53:
            success('Обращение через обратную связь успешно обработано');
            break;
        case 54:
            success('Личное обращение успешно обработано');
            break;
        case 55:
            success('Заявка на продукт успешно обработана');
            break;
        case 56:
            success('Активация отзыва успешно изменена');
            break;
        case 57:
            success('Отзыв успешно удален');
            break;
        case 58:
            success('Отзыв успешно добавлен');
            break;
        case 59:
            success('Активация слайдера успешно изменена');
            break;
        case 60:
            success('Слайдер успешно удален');
            break;
        case 61:
            success('Слайдер успешно добавлен');
            break;
        case 62:
            success('Активация Пользователя успешно изменена');
            break;
        case 63:
            success('Пользователь успешно заблокирован');
            break;
        case 64:
            success('Пользователь успешно удален');
            break;
        case 65:
            success('Пользователь успешно создан');
            break;
        case 66:
            success('Пользователь успешно изменен');
            break;
        case 67:
            success('Пароль пользователя успешно изменен');
            break;
    }
}
