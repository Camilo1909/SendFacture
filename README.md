# 📄 SendInvoice

> Sistema de gestión y envío de comprobantes electrónicos construido con Django

[![CI Status](https://github.com/Camilo1909/SendInvoice/workflows/CI&20Pipeline/badge.svg)](https://github.com/Camilo1909/SendInvoice/actions)
[![Docker Build](https://github.com/Camilo1909/SendInvoice/workflows/Docker%20Build%20and%20Push/badge.svg)](https://github.com/Camilo1909/SendInvoice/actions)
[![Python Version](https://img.shields.io/badge/python-3.12-blue.svg)](https://www.python.org/downloads/)
[![Django Version](https://img.shields.io/badge/django-5.2.7-green.svg)](https://www.djangoproject.com/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## 📋 Tabla de Contenidos

- [Descripción](#-descripción)
- [Características](#-características)
- [Tecnologías](#-tecnologías)
- [Arquitectura](#-arquitectura)
- [Requisitos Previos](#-requisitos-previos)
- [Instalación](#-instalación)
  - [Desarrollo Local](#desarrollo-local)
  - [Usando Docker](#usando-docker)
- [Configuración](#-configuración)
- [Uso](#-uso)
- [Testing](#-testing)
- [Deployment](#-deployment)
- [CI/CD](#-cicd)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Contribución](#-contribución)
- [Licencia](#-licencia)
- [Contacto](#-contacto)

## 🎯 Descripción

SendInvoice es una aplicación web moderna para la gestión y envío de comprobantes electrónicos. Permite a empresas y freelancers crear, gestionar y enviar comprobantes de manera eficiente a través de WhatsApp.

**Demo en vivo:** [https://sendinvoice.site](https://sendinvoice.site)

## ✨ Características

### Funcionalidades Principales

- 📝 **Gestión de Comprobantes:** Envio, registro y visualización
- 👥 **Gestión de Clientes:** Base de datos de clientes con información completa
- 📊 **Dashboard:** Visualización de estadísticas y métricas
- 💬 **Integración WhatsApp:** Envío automático de comprobantes por WhatsApp
- 🔐 **Sistema de Autenticación:** Roles y permisos personalizados
- 📱 **Responsive Design:** Optimizado para todos los dispositivos

### Características Técnicas

- ⚡ **Alta Performance:** Optimizado con Redis cache
- 🔒 **Seguro:** HTTPS, encriptación, autenticación robusta
- 📦 **Escalable:** Arquitectura basada en microservicios
- 🚀 **CI/CD:** Deployment automático con GitHub Actions
- ☁️ **Cloud-Native:** Desplegado en AWS con infraestructura como código

## 🛠️ Tecnologías

### Backend
- **Framework:** Django 5.2.7
- **Lenguaje:** Python 3.12
- **Base de Datos:** PostgreSQL 17.6
- **Cache:** Redis 7
- **WSGI Server:** Gunicorn 22.0
- **Task Queue:** Celery (próximamente)

### Frontend
- **HTML5 / CSS3**
- **JavaScript (Vanilla)**
- **Bootstrap 5** (opcional)

### Infrastructure
- **Containerización:** Docker + Docker Compose
- **Proxy Reverso:** Nginx
- **Cloud Provider:** AWS
  - EC2 (Compute)
  - RDS (Database)
  - S3 (Storage)
  - CloudFront (CDN - próximamente)
- **IaC:** Terraform
- **CI/CD:** GitHub Actions

### DevOps
- **Version Control:** Git + GitHub
- **Container Registry:** Docker Hub
- **Monitoring:** CloudWatch (próximamente)
- **Error Tracking:** Sentry (próximamente)

## 🏗️ Arquitectura

```
┌─────────────────────────────────────────┐
│  Client (Browser)                       │
└──────────────┬──────────────────────────┘
               │ HTTPS
               ▼
┌─────────────────────────────────────────┐
│  Nginx (Reverse Proxy + SSL)            │
└──────────────┬──────────────────────────┘
               │ HTTP
               ▼
┌─────────────────────────────────────────┐
│  Gunicorn (WSGI)                        │
│  └─ Django Application                  │
└──┬──────────┬────────────┬──────────────┘
   │          │            │
   ▼          ▼            ▼
┌──────┐  ┌──────┐  ┌─────────────┐
│Redis │  │ RDS  │  │ S3 Buckets  │
│Cache │  │ PG   │  │ Static/Media│
└──────┘  └──────┘  └─────────────┘
```

## 📦 Requisitos Previos

### Para Desarrollo Local

- Python 3.12+
- PostgreSQL 14+
- Redis 7+
- Git

### Para Docker

- Docker 24.0+
- Docker Compose 2.20+

## 🚀 Instalación

### Desarrollo Local

1. **Clonar el repositorio:**

```bash
git clone https://github.com/Camilo1909/SendInvoice.git
cd SendInvoice
```

2. **Crear entorno virtual:**

```bash
python -m venv venv
source venv/bin/activate  # En Windows: venv\Scripts\activate
```

3. **Instalar dependencias:**

```bash
pip install -r requirements/dev.txt
```

4. **Configurar variables de entorno:**

```bash
cp .env.example .env
# Editar .env con tus valores
```

5. **Ejecutar migraciones:**

```bash
python manage.py migrate
```

6. **Crear superusuario:**

```bash
python manage.py createsuperuser
```

7. **Inicializar datos:**

```bash
python manage.py initialize_data
```

8. **Ejecutar servidor de desarrollo:**

```bash
python manage.py runserver
```

Visita: `http://localhost:8000`

---

### Usando Docker

1. **Clonar el repositorio:**

```bash
git clone https://github.com/Camilo1909/SendInvoice.git
cd SendInvoice
```

2. **Configurar variables de entorno:**

```bash
cp .env.example .env.docker
# Editar .env.docker con tus valores
```

3. **Construir y levantar contenedores:**

```bash
docker-compose up -d --build
```

4. **Ejecutar migraciones:**

```bash
docker-compose exec web python manage.py migrate
```

5. **Crear superusuario:**

```bash
docker-compose exec web python manage.py createsuperuser
```

Visita: `http://localhost:8000`

## ⚙️ Configuración

### Variables de Entorno

Crea un archivo `.env` en la raíz del proyecto:

```bash
# Django
SECRET_KEY=your-secret-key-here
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1

# Database
DB_NAME=sendinvoice
DB_USER=postgres
DB_PASSWORD=postgres
DB_HOST=localhost
DB_PORT=5432

# AWS S3 (Producción)
USE_S3=False
AWS_STORAGE_BUCKET_NAME_STATIC=your-static-bucket
AWS_STORAGE_BUCKET_NAME_MEDIA=your-media-bucket
AWS_S3_REGION_NAME=us-east-1

# WhatsApp API
WHATSAPP_API_TOKEN=your-whatsapp-token
WHATSAPP_PHONE_ID=your-phone-id
```

Ver `.env.example` para todas las variables disponibles.

### Base de Datos

**Desarrollo (SQLite):**
```python
# Por defecto usa SQLite en desarrollo
```

**Producción (PostgreSQL):**
```bash
# Configurar variables DB_* en .env
```

## 💻 Uso

### Acceso al Sistema

1. **Admin Panel:** `http://localhost:8000/admin/`
2. **Aplicación:** `http://localhost:8000/`

### Credenciales por Defecto

- **Usuario:** admin
- **Contraseña:** admin123

⚠️ **Importante:** Cambiar estas credenciales en producción.

### Comandos Útiles

```bash
# Ejecutar tests
python manage.py test

# Crear migraciones
python manage.py makemigrations

# Aplicar migraciones
python manage.py migrate

# Recolectar archivos estáticos
python manage.py collectstatic

# Inicializar datos base
python manage.py initialize_data
```

## 🧪 Testing

### Ejecutar Tests

```bash
# Todos los tests
pytest

# Con coverage
pytest --cov=.

# Tests específicos
pytest modules/invoice/tests/
```

### Linting

```bash
# Flake8
flake8 .

# Black (formateo)
black .

# isort (imports)
isort .
```

## 🚀 Deployment

### Requisitos AWS

- Cuenta AWS con Free Tier
- AWS CLI configurado
- Terraform instalado

### Deployment Automático

El proyecto usa GitHub Actions para deployment automático:

```bash
# 1. Push a main activa el pipeline
git push origin main

# 2. GitHub Actions ejecuta:
#    - Tests
#    - Build de imagen Docker
#    - Deploy a EC2
```

### Deployment Manual

```bash
# 1. Construir imagen
docker build -t sendinvoice:latest .

# 2. Push a Docker Hub
docker push devkamilo/sendinvoice:latest

# 3. En el servidor
ssh ubuntu@tu-servidor
cd /opt/sendinvoice
docker-compose pull
docker-compose up -d
```

Ver [DEPLOYMENT.md](docs/DEPLOYMENT.md) para guía detallada.

## 🔄 CI/CD

### Pipeline Automático

```
git push → CI (Tests) → Docker Build → Deploy to EC2
```

### Workflows de GitHub Actions

1. **CI:** Tests, linting, security checks
2. **Docker Build:** Construye y sube imagen
3. **Deploy:** Deployment automático usando self-hosted runner

### Secrets Requeridos

Configurar en GitHub → Settings → Secrets:

```
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
EC2_SSH_PRIVATE_KEY (si usas SSH)
EC2_HOST
EC2_USER
```

## 📁 Estructura del Proyecto

```
SendInvoice/
├── .github/
│   └── workflows/          # GitHub Actions
│       ├── ci.yml
│       ├── docker.yml
│       └── deploy.yml
├── core/                   # Configuración principal
│   ├── settings.py
│   ├── urls.py
│   ├── wsgi.py
│   └── storage_backends.py # S3 storage
├── modules/                # Aplicaciones Django
│   ├── auths/             # Autenticación
│   ├── base/              # Funcionalidad base
│   ├── invoice/           # Gestión comprobantes
│   ├── menu/              # Menú dinámico
│   └── services/          # Servicios externos
├── scripts/               # Scripts de utilidad
│   ├── entrypoint.sh
│   └── refresh-aws-credentials.sh
├── terraform/             # Infraestructura como código
│   ├── modules/
│   │   ├── vpc/
│   │   ├── ec2/
│   │   ├── rds/
│   │   ├── s3/
│   │   └── iam/
│   └── main.tf
├── requirements/          # Dependencias Python
│   ├── base.txt
│   ├── dev.txt
│   └── prod.txt
├── docker-compose.yml     # Docker para desarrollo
├── Dockerfile             # Imagen Docker
├── .dockerignore
├── .gitignore
├── manage.py
└── README.md
```


## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

## 📞 Contacto

**Camilo** - [Linkedin](https://www.linkedin.com/in/juan-camilo-vargas-cordoba/)

**Email:** jcvargas1909@gmail.com

**Project Link:** [https://github.com/Camilo1909/SendInvoice](https://github.com/Camilo1909/SendInvoice)

---

⭐ **Si este proyecto te fue útil, considera darle una estrella!**

---

*Desarrollado con ❤️ por [Juan Camilo Vargas](https://github.com/Camilo1909)*
