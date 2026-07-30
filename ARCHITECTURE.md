# Elden Ring Build Optimizer & Quest Graph API

## 1. Executive Summary
An enterprise-grade platform for Elden Ring players to compute optimal character builds, mathematically model complex weapon damage scaling formulas, and track intricate, state-machine-driven NPC questlines.

## 2. Core Domain Entities
* **User:** Platform members who create and share builds. Managed via strict RBAC.
* **CharacterStat:** Core attributes (Vigor, Mind, Endurance, Strength, Dexterity, Intelligence, Faith, Arcane).
* **Equipment:** Weapons, catalysts, and armor. Contains baseline damage vectors and scaling coefficients.
* **Build:** A user-generated profile containing a specific configuration of CharacterStats and linked Equipment.
* **QuestNode:** A localized state within an NPC questline.
* **QuestEdge:** Directed graph relationship between QuestNodes with transition conditions (e.g., "Defeat Boss X", "Acquire Item Y").

## 3. Technology Stack
* **Monorepo:** Managed via npm workspaces.
* **Backend API:** NestJS (TypeScript), Prisma ORM.
* **Frontend SPA:** React (Vite), TypeScript, Pure CSS.
* **Database:** PostgreSQL.
* **Infrastructure:** Dockerized containers deployed via GitHub Actions CI/CD.