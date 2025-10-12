from django.conf import settings

from storages.backends.s3boto3 import S3Boto3Storage


class StaticStorage(S3Boto3Storage):

    bucket_name = settings.AWS_STORAGE_BUCKET_NAME_STATIC
    location = "static"  # Carpeta dentro del bucket
    default_acl = None  # Archivos públicos
    file_overwrite = False


class MediaStorage(S3Boto3Storage):

    bucket_name = settings.AWS_STORAGE_BUCKET_NAME_MEDIA
    location = "media"  # Carpeta dentro del bucket
    default_acl = None  # Archivos privados
    file_overwrite = False
