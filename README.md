# LegacyCorp - Módulo de Inventario

**Estudiante:** Henrry Alberto Coronado Villca
**URL de Validación (Producción):** http://3.92.8.41:5000

## Arquitectura CI/CD Implementada

Esta aplicación utiliza una arquitectura de infraestructura como código (IaC) modular y procesos automatizados de Integración y Despliegue Continuo (CI/CD) orquestados mediante GitHub Actions, respetando los principios de GitOps.

### Integración Continua (CI)
- **Pipeline:** `.github/workflows/ci.yml`
- **Rama:** `develop`
- **Flujo:** Se dispara mediante eventos `push` o `pull_request`. Levanta un entorno virtualizado con Ubuntu y Node.js 20, instala dependencias y ejecuta las pruebas automatizadas del Módulo de Inventario para garantizar la integridad del código antes de pasar a producción.

### Despliegue Continuo (CD) y GitOps
- **Pipeline:** `.github/workflows/cd.yml`
- **Rama:** `main`
- **Flujo:** Al realizar un merge a `main`, GitHub Actions asume de forma segura credenciales temporales de AWS y ejecuta Terraform CLI. 
- **Infraestructura (Terraform):** El despliegue está dividido en módulos lógicos (`network` para el Security Group y `compute` para la instancia EC2 con Amazon Linux 2023). El arranque de la aplicación Node.js está completamente automatizado mediante el script `user_data`.
- **Gestión de Cambios:** Cualquier modificación a la infraestructura (como restricciones de IP o escalado vertical a `t3.micro`) se realiza modificando el código declarativo de Terraform y aplicando un *push* a la rama principal, eliminando la intervención manual en la consola de AWS.

## Estructura del Repositorio

- `.github/workflows/` — Pipelines de CI y CD.
- `terraform/` — Código IaC orquestador, variables globales y configuración de backend S3.
  - `modules/network/` — Configuración de Security Groups.
  - `modules/compute/` — Configuración de la instancia EC2 y script de automatización de arranque (`user_data`).
- `evidencias/` — Capturas de pantalla y logs que certifican la superación de los hitos del laboratorio.