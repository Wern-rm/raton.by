import logging
import os
import zipfile
from datetime import datetime

logging_config = dict(
    version=1,
    formatters={
        'product': {'format': '%(asctime)s | %(funcName)s | %(levelname)s | %(module)s:%(lineno)d}: %(message)s'},
        'default': {'format': '%(asctime)s: %(message)s'}
    },
    handlers={
        'h': {'class': 'logging.handlers.RotatingFileHandler',
              'filename': 'logs/api.log',
              'maxBytes': 1024 * 1024 * 10,
              'backupCount': 25,
              'level': 'DEBUG',
              'formatter': 'product',
              'encoding': 'utf8'},
        'l': {
            'class': 'logging.StreamHandler',
            'stream': 'ext://flask.logging.wsgi_errors_stream',
            'formatter': 'default'
        }
    },
    root={
        'handlers': ['h', 'l'],
        'level': logging.DEBUG,
    },
    disable_existing_loggers=False
)


def safe_logs():
    log_file = os.getcwd() + "\\logs\\api.log"  # Путь до файла .log
    if os.path.exists(log_file):  # Проверяем существует ли файл .log
        backup_folder = os.getcwd() + "\\logs\\backups"  # Путь до папки backups
        if not os.path.exists(backup_folder):  # Проверяем существует ли папка backups
            os.mkdir(backup_folder)  # Если папка не обнаружена - создаем ее
        name = datetime.now().strftime("api_%d-%m-%Y %H-%M-%S-%f") + '.zip'  # Название .zip архива из даты и времени
        zipName = backup_folder + '\\' + name  # Название .zip архива с patch
        newZip = zipfile.ZipFile(zipName, 'w')  # создаем архив
        old_cwd = os.getcwd()  # Сохраняем текущую рабочую директорию
        os.chdir(os.getcwd() + "\\logs")  # Назначаем новую рабочую директорию
        newZip.write('api.log')  # добавляем файл в архив
        newZip.close()  # закрываем архив
        os.chdir(old_cwd)  # Возвращаем стандартную рабочую директорию
        open(log_file, 'w', encoding='utf-8').close()  # Очищаем файл от всех записей