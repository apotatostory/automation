# Springboot Terraform Demo

## 📝 專案簡介

這是一個**結合 Spring Boot 與 Terraform CLI 的自動化平台**。  
後端提供 REST API，可依據前端表單內容，自動選擇 provider（Azure、Hyper-V、VMware），並透過 Terraform
於本地或雲端自動建立 VM。  
適用於 DevOps/雲端/虛擬化自動部署練習與實務專案。

## 📁 專案目錄結構

```plaintext
springboot-terraform-demo/
├── pom.xml
├── src/
│   └── main/
│       ├── java/
│       │   └── com/example/terraform/
│       │       ├── DemoApplication.java
│       │       ├── controller/
│       │       │   └── VmController.java
│       │       ├── service/
│       │       │   └── VmProvisionService.java
│       │       ├── model/
│       │       │   └── VmRequest.java
│       └── resources/
│           └── application.yml
└── terraform/
    ├── providers/
    │   ├── azurerm/
    │   │   └── main.tf
    │   ├── hyperv/
    │   │   └── main.tf
    │   └── vmware/
    │       └── main.tf
    └── sample-tfvars/
        └── demo.tfvars
```

## 🚀 開發/執行說明

前置需求
JDK 17+

Maven 3.8+

Terraform CLI（已加入系統 PATH）

欲使用之 provider plugin（第一次執行會自動下載）

若用 Hyper-V，請在 Windows 上執行，並啟用 Hyper-V 功能

---

## TODO

- [X] 建立基本 Dockerfile，包含build, run，以及安裝terraform
- [ ] 完成 Spring Boot 使用 terraform cli 執行腳本
    - [ ] 完善 terraform client元件
    - [ ] 完善 terraform 建立 VM 基本var
    - [ ] 完善 terraform 建立 VM 進階var
