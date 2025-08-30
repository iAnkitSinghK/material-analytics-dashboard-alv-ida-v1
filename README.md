# Material Analytics Dashboard

📊 **ALV IDA-Based Material Analytics Dashboard in ABAP on HANA**  
Utilizes CDS Views, AMDP, Table Functions, and advanced ALV capabilities for interactive material analysis.

---

## 🚀 Overview

The **Material Analytics Dashboard** is a powerful analytical solution built on **ABAP on HANA**, designed to deliver real-time insights on material data.  
It features interactive ALV IDA grids, robust filtering, sorting, and a user-friendly interface with custom containers.

---

## 🔑 Key Features

- **Table Function with Parameters**
  - Defined via Data Definition with an input parameter `MATKL` (Material Group).
  - Implemented using a custom **AMDP Method**.

- **CDS View with Parameters**
  - Combines data from the **Table Function** and the standard **I_Material** table.
  - Exposes merged fields for comprehensive analysis.

- **ALV IDA (Version 1)**
  - Displays data in an ALV Grid within a single custom container.
  - Implements a dynamic field catalog.
  - (Optional) Row limit: 50 rows (feature currently commented out).
  - Enables sorting by `MATNR`.
  - Supports input parameters (`MATKL`) and select-options (`MATNR`) for advanced filtering.

- **ALV IDA (Version 2)**
  - Builds on Version 1, adding:
    - A second custom container for notes or custom texts.
    - **PBO/PAI modules** for interactive event handling.
    - Navigation controls: **Back**, **Cancel**, and **Exit**.

---

## 🛠️ Technology Stack

- **ABAP on HANA**
- **Core Data Services (CDS Views)**
- **AMDP (ABAP Managed Database Procedures)**
- **Table Functions**
- **ALV IDA (Integrated Data Access)**

---

## 📂 Structure

```
material-analytics-dashboard-alv-ida-v1/
│── src/
│   ├── zaks_mad_tf             # Table Function (parameter: MATKL)
│   ├── zaks_mad_cl_amdp        # AMDP Class (definition & implementation)
│   ├── zaks_mad_cds_imat_tf    # CDS View (I_Material + Table Function)
│   ├── zaks_mad_alv_ida_1cc    # ALV IDA report (single container)
│   └── zaks_mad_alv_ida_mcc    # ALV IDA report (multi-container + notes)
│── LICENSE                     # MIT License
└── README.md
```

---

## ▶️ Getting Started

1. **Import** the repository into **ABAP Development Tools (ADT)** (Eclipse).
2. **Activate** the CDS View, Table Function, and AMDP Class.
3. **Execute** the reports (`zaks_mad_alv_ida_1cc` or `zaks_mad_alv_ida_mcc`) in SAP GUI.
4. **Input** the required values for `MATKL` and `MATNR` to filter the results.

---

## 📌 Future Enhancements

- **Convert to RAP-Based Application**
  - Migrate from classic ALV IDA reports to a RAP (RESTful ABAP Programming Model) application.
  - Benefits:
    - Expose CDS views and Table Functions via OData V4 services.
    - Enable consumption in SAP Fiori Elements apps (List Report, Analytical List Page).
    - Simplify integration with SAP Fiori Launchpad.
    - Leverage built-in CDS annotations for filtering, sorting, and analytics—minimizing custom ALV handling.

---

## 📎 Repository

🔗 [View on GitHub](https://github.com/iAnkitSinghK/material-analytics-dashboard-alv-ida-v1)

---

## 📝 License

This project is licensed under the [MIT License](LICENSE).
