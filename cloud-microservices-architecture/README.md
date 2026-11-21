# Cloud Microservices Architecture & Azure IaaS/PaaS Migration

Engineering case studies and infrastructure configurations developed during cloud computing coursework at **Kaunas University of Technology (KTU)**. This repository documents two progressive architectures: migrating an enterprise ASP.NET MVC application across **Microsoft Azure IaaS and PaaS**, and re-architecting domain services into **containerized .NET 8 microservices** behind an **Ocelot API Gateway** with **RabbitMQ** event messaging.

---

## 📄 Verified Engineering Reports
* **[Lab 1 Report: Azure IaaS vs. PaaS Cloud Deployment (PDF)](docs/lab1-azure-iaas-paas-report.pdf)**
* **[Lab 2 Report: Containerized Microservices with Docker, Ocelot & RabbitMQ (PDF)](docs/lab2-docker-ocelot-microservices-report.pdf)**

---

## 1. Azure IaaS vs. PaaS Deployment (`01-azure-iaas-paas/`)

Evaluated operational trade-offs, identity management, and scaling between Infrastructure-as-a-Service and Platform-as-a-Service in **Azure France Central** using the Contoso University ASP.NET MVC workload.

```mermaid
graph LR
    subgraph Azure_IaaS["Azure Virtual Network (IaaS)"]
        AD["AD VM<br/>(lab.local Domain Controller)"]
        IIS["WS2019-IIS VM<br/>(ASP.NET MVC + Windows Auth)"]
        SQL["SQL VM<br/>(SQL Server 2016)"]
        IIS <-->|Kerberos / DNS| AD
        IIS <-->|ADO.NET| SQL
    end

    subgraph Azure_PaaS["Azure Managed Services (PaaS)"]
        AppSvc["Azure App Service<br/>(Managed Runtime)"]
        AzureSQL["Azure SQL Database<br/>(DTU Tier Scaling)"]
        AppSvc <-->|TLS / SQL Auth| AzureSQL
    end